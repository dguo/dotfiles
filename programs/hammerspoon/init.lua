-- Get around paste blockers with cmd+alt+v
hs.hotkey.bind({"cmd", "alt"}, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

hyper = false
hyperTime = nil

down = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
  local character = event:getCharacters()
  -- local keyCode = event:getKeyCode()
  -- print("down", character, keyCode)

  if character == ";" then
    hyper = true
    if hyperTime == nil then
      hyperTime = hs.timer.absoluteTime()
    end
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

  if character == 'u' and hyper then
    hs.application.launchOrFocus("Slack")
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
