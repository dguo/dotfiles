-- Get around paste blockers with cmd+alt+v
hs.hotkey.bind({"cmd", "shift"}, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

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

  if character == 'q' and hyper then
    hs.application.launchOrFocus("Authy Desktop")
    hyperTime = nil
    return true
  end

  if character == 'w' and hyper then
    hs.application.launchOrFocus("Firefox Developer Edition")
    hyperTime = nil
    return true
  end

  if character == 'e' and hyper then
    hs.application.launchOrFocus("iTerm")
    hyperTime = nil
    return true
  end

  if character == 'r' and hyper then
    hs.application.launchOrFocus("Visual Studio Code")
    hyperTime = nil
    return true
  end

  if character == 't' and hyper then
    hs.application.launchOrFocus("TablePlus")
    hyperTime = nil
    return true
  end

  if character == 'y' and hyper then
    hs.application.launchOrFocus("Todoist")
    hyperTime = nil
    return true
  end

  if character == 'u' and hyper then
    hs.application.launchOrFocus("Slack")
    hyperTime = nil
    return true
  end

  if character == 'i' and hyper then
    hs.application.launchOrFocus("Spotify")
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
  Set the default output device, based on this priority:

    1. Sony headphones
    2. Other Bluetooth headphones
    3. CalDigit dock audio (i.e. desktop speakers)
    4. Built-in speakers

  Crucially, this also avoids the issue of macOS setting the default device to
  a monitor that doesn't even have speakers but registers as an output device
  for some reason.
]]
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

    if device:transportType() == "Bluetooth" then
      if currentDevice:name() ~= "WH-1000XM3" then
        device:setDefaultOutputDevice()
      end
    elseif device:transportType() == "USB" then
      if currentDevice:transportType() ~= "Bluetooth" then
        device:setDefaultOutputDevice()
      end
    elseif device:transportType() == "Built-in" then
      if currentDevice:transportType() ~= "Bluetooth" and
         currentDevice:transportType() ~= "USB" then
        device:setDefaultOutputDevice()
      end
    end
  end
end)
hs.audiodevice.watcher.start()
