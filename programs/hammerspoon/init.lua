local requireLeo = function()
    require("leo");
end;

if pcall(requireLeo) then
    print("Loaded Leo");
else
    hs.notify.new({title="Hammerspoon", informativeText="Failed to load Leo"}):send()
end

-- Get around paste blockers with cmd+alt+v

hs.hotkey.bind({"cmd", "shift"}, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Set up a hyper key tree
hyperKeys = hs.json.read("~/google-drive-personal/programs/hammerspoon/hyper-keys.json")
currentKey = nil
currentTree = hyperKeys or {}
hyperTime = nil

--[[
  Thanks to
  https://aaronlasseigne.com/2016/02/16/switching-from-slate-to-hammerspoon/
  for some tips here.
--]]
windowPositions = {
  centerHalf = {x = 0.25, y = 0, w = 0.5, h = 1},
  centerThird = {x = 0.33, y = 0, w = 0.33, h = 1},
  leftHalf = hs.layout.left50,
  leftThird = {x = 0, y = 0, w = 0.33, h = 1},
  leftTwoThirds = {x = 0, y = 0, w = 0.66, h = 1},
  rightHalf = hs.layout.right50,
  rightThird = {x = 0.66, y = 0, w = 0.34, h = 1},
  rightTwoThirds = {x = 0.33, y = 0, w = 0.67, h = 1}
}

-- Return true if it's definitely a terminating action
function executeHyperAction (tree)
  if tree["action"] == "type" then
    --[[
      Avoid treating the emulated keystrokes as hyper commands. This also avoids
      logging the emulated keystrokes.
    ]]
    down:stop()
    hs.eventtap.keyStrokes(tree["text"])
    down:start()
  elseif tree["action"] == "launch-or-focus" then
    hs.application.launchOrFocus(tree["program"])
    --[[
      If we don't ask the caller to end hyper mode, launching Anki causes us to
      temporarily get stuck in hyper mode.
    ]]
    return true
  elseif tree["action"] == "direction" then
    hs.eventtap.keyStroke(nil, tree["direction"], 0)
  elseif tree["action"] == "make-window-full-screen" then
    hs.window.focusedWindow():maximize(0)
  elseif tree["action"] == "center-window" then
    hs.window.focusedWindow():centerOnScreen(nil, true, 0)
  elseif tree["action"] == "lay-out-window" then
    if tree["layout"] == "center-half" then
      hs.window.focusedWindow():moveToUnit(windowPositions["centerHalf"], 0)
    elseif tree["layout"] == "center-third" then
      hs.window.focusedWindow():moveToUnit(windowPositions["centerThird"], 0)
    elseif tree["layout"] == "left-half" then
      hs.window.focusedWindow():moveToUnit(windowPositions["leftHalf"], 0)
    elseif tree["layout"] == "left-third" then
      hs.window.focusedWindow():moveToUnit(windowPositions["leftThird"], 0)
    elseif tree["layout"] == "left-two-thirds" then
      hs.window.focusedWindow():moveToUnit(windowPositions["leftTwoThirds"], 0)
    elseif tree["layout"] == "right-half" then
      hs.window.focusedWindow():moveToUnit(windowPositions["rightHalf"], 0)
    elseif tree["layout"] == "right-third" then
      hs.window.focusedWindow():moveToUnit(windowPositions["rightThird"], 0)
    elseif tree["layout"] == "right-two-thirds" then
      hs.window.focusedWindow():moveToUnit(windowPositions["rightTwoThirds"], 0)
    end
  elseif tree["action"] == "minimize-window" then
    hs.window.focusedWindow():minimize(0)
  elseif tree["action"] == "move-window" then
    if tree["direction"] == "left" then
      hs.window.focusedWindow():moveOneScreenWest(nil, true, 0)
    elseif tree["direction"] == "right" then
      hs.window.focusedWindow():moveOneScreenEast(nil, true, 0)
    end
  end

  return false
end

keyLog = assert(io.open(os.getenv("HOME") .. "/.keys.log", "a"))
keyLog:setvbuf("no")

down = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
  local character = event:getCharacters()
  local keyCode = event:getKeyCode()
  local mods = event:getFlags()
  -- print("down", character, keyCode, hs.inspect.inspect(mods))

  -- Disable the insert key because overwrite mode is annoying
  if keyCode == 114 then
    return true
  end

  -- Map backspace + shift to forward delete
  if keyCode == 51 and mods["shift"] then
    hs.eventtap.keyStroke(nil, "forwarddelete", 0)
    return true
  end

  --[[
    Log keystrokes, but ignore hyper mode, keys that aren't characters or space,
    and non-shift modifiers
  ]]
  if currentKey == nil and character ~= "" and keyCode >= 0 and
    keyCode <= 50 and keyCode ~= 10 and keyCode ~= 36 and keyCode ~= 48 and
    (next(mods) == nil or mods["shift"]) then
    keyLog:write(character)
  end

  if currentKey == character then
    return true
  elseif currentTree["keys"] and currentTree["keys"][character] then
    --[[
      There's no need to wait for the up event if we know the tree doesn't go
      any deeper, so we can execute the action immediately.

      This also lets us hold down the current hyper key and execute multiple or
      repeated actions for its tree. For example for multiple actions, we could
      hold down the hyper key and tap two keys in its tree that both do not
      have subtrees. Both actions can execute without having to restart the
      sequence.

      For example for repeated actions, we could hold down the hyper key and
      hold another key to emulate holding down the up key.
    ]]
    if currentTree["keys"][character]["action"] and
       not currentTree["keys"][character]["keys"] then
      local isTerminatingAction = executeHyperAction(currentTree["keys"][character])
      -- Reset the time so that the up event handler doesn't execute any actions
      hyperTime = nil
      if isTerminatingAction then
        currentKey = nil
        currentTree = hyperKeys
      end
    -- Otherwise, go deeper into the tree
    elseif currentTree["keys"][character]["keys"] then
      currentKey = character
      currentTree = currentTree["keys"][character]
      hyperTime = hs.timer.absoluteTime()
    end

    return true
  end
end)
down:start()

up = hs.eventtap.new({hs.eventtap.event.types.keyUp}, function(event)
  local character = event:getCharacters()
  -- print("up", character)

  if character == currentKey then
    local currentTime = hs.timer.absoluteTime()
    -- print(currentTime, hyperTime)
    if hyperTime ~= nil and (currentTime - hyperTime) / 1000000 < 250 then
      executeHyperAction(currentTree)
    end

    currentKey = nil
    currentTree = hyperKeys
    hyperTime = nil
  end
end)
up:start()

--[[
  Set the audio output and input devices, based on the priorities in the look
  up functions because macOS is bad at keeping track of my preferences.

  Crucially, this also avoids the issue of macOS setting the default device to
  a monitor that doesn't even have speakers but registers as an output device
  for some reason.
]]

function getAudioOutputPriority (device)
  if device:name() == "WH-1000XM3" then
    return 1
  elseif device:transportType() == "Bluetooth" then
    return 2
  elseif device:transportType() == "Built-in" and
    device:name() == "External Headphones" then
    return 3
  elseif device:name() == "CalDigit Thunderbolt 3 Audio" then
    return 4
  elseif device:transportType() == "Built-in" then
    return 5
  else
    return 6
  end
end

function getAudioInputPriority (device)
  if device:name() == "ATR2100x-USB Microphone" then
    return 1
  elseif device:name() == "WH-1000XM3" then
    return 2
  elseif device:transportType() == "Bluetooth" then
    return 3
  elseif device:name() == "HD Pro Webcam C920" then
    return 4
  elseif device:transportType() == "Built-in" then
    return 5
  else
    return 6
  end
end

hs.audiodevice.watcher.setCallback(function(event)
  --[[
    We only care about when devices are connected or disconnected. This allows
    us to manually change the default device without issues.
  ]]
  if event ~= "dev#" then
    return
  end

  for i, device in ipairs(hs.audiodevice.allOutputDevices()) do
    local currentDevice = hs.audiodevice.defaultOutputDevice()
    local currentPriority = getAudioOutputPriority(currentDevice)
    if getAudioOutputPriority(device) < currentPriority then
      device:setDefaultOutputDevice()
    end
  end

  for i, device in ipairs(hs.audiodevice.allInputDevices()) do
    local currentDevice = hs.audiodevice.defaultInputDevice()
    local currentPriority = getAudioInputPriority(currentDevice)
    if getAudioInputPriority(device) < currentPriority then
      device:setDefaultInputDevice()
    end
 end
end)
hs.audiodevice.watcher.start()

--[[
  Make control act as escape when tapped
  Thanks to https://gist.github.com/arbelt/b91e1f38a0880afb316dd5b5732759f1
]]

send_escape = false
last_mods = {}

control_key_handler = function()
  send_escape = false
end

control_key_timer = hs.timer.delayed.new(0.15, control_key_handler)

control_handler = function(evt)
  local new_mods = evt:getFlags()
  if last_mods["ctrl"] == new_mods["ctrl"] then
    return false
  end
  if not last_mods["ctrl"] then
    last_mods = new_mods
    send_escape = true
    control_key_timer:start()
  else
    last_mods = new_mods
    control_key_timer:stop()
    if send_escape then
      return true, {
        hs.eventtap.event.newKeyEvent({}, 'escape', true),
        hs.eventtap.event.newKeyEvent({}, 'escape', false),
      }
    end
  end
  return false
end

control_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, control_handler)
control_tap:start()

other_handler = function(evt)
  send_escape = false
  return false
end

other_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, other_handler)
other_tap:start()
