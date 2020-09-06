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

-- Set up a hyper key

hyper = false
hyperTime = nil

down = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
  local character = event:getCharacters()
  local keyCode = event:getKeyCode()
  -- print("down", character, keyCode)

  -- Disable the insert key because overwrite mode is annoying
  if keyCode == 114 then
    return true
  end

  -- Set up ; as the hyper key
  if character == ";" then
    hyper = true
    if hyperTime == nil then
      hyperTime = hs.timer.absoluteTime()
    end
    return true
  end

  -- Use h, j, k, l as arrow keys

  if character == 'h' and hyper then
    hs.eventtap.keyStroke(nil, "left", 0)
    hyperTime = nil
    return true
  end

  if character == 'j' and hyper then
    hs.eventtap.keyStroke(nil, "down", 0)
    hyperTime = nil
    return true
  end
  if character == 'k' and hyper then
    hs.eventtap.keyStroke(nil, "up", 0)
    hyperTime = nil
    return true
  end

  if character == 'l' and hyper then
    hs.eventtap.keyStroke(nil, "right", 0)
    hyperTime = nil
    return true
  end

  -- Quick switch to applications

  if character == 'a' and hyper then
    hs.application.launchOrFocus("Anki")
    hyperTime = nil
    return true
  end

  if character == 'd' and hyper then
    hs.application.launchOrFocus("Todoist")
    hyperTime = nil
    return true
  end

  if character == 'f' and hyper then
    hs.application.launchOrFocus("Firefox Developer Edition")
    hyperTime = nil
    return true
  end

  if character == 'i' and hyper then
    hs.application.launchOrFocus("iTerm")
    hyperTime = nil
    return true
  end

  if character == 'n' and hyper then
    hs.application.launchOrFocus("Notion")
    hyperTime = nil
    return true
  end

  if character == 's' and hyper then
    hs.application.launchOrFocus("Spotify")
    hyperTime = nil
    return true
  end

  if character == 't' and hyper then
    hs.application.launchOrFocus("TablePlus")
    hyperTime = nil
    return true
  end

  if character == 'u' and hyper then
    hs.application.launchOrFocus("Slack")
    hyperTime = nil
    return true
  end

  if character == 'v' and hyper then
    hs.application.launchOrFocus("Visual Studio Code")
    hyperTime = nil
    return true
  end

  if character == 'x' and hyper then
    hs.application.launchOrFocus("Xcode")
    hyperTime = nil
    return true
  end

  if character == 'y' and hyper then
    hs.application.launchOrFocus("Todoist")
    hyperTime = nil
    return true
  end

  if character == 'z' and hyper then
    hs.application.launchOrFocus("zoom.us")
    hyperTime = nil
    return true
  end

  end)
down:start()

up = hs.eventtap.new({hs.eventtap.event.types.keyUp}, function(event)
  local character = event:getCharacters()
  if character == ";" and hyper then
      local currentTime = hs.timer.absoluteTime()
      -- print(currentTime, hyperTime)
      if hyperTime ~= nil and (currentTime - hyperTime) / 1000000 < 250 then
          down:stop()
          hs.eventtap.keyStrokes(";")
          down:start()
      end
      hyper = false
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
