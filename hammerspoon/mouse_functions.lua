-- Set the color of the circle to white
mouseCircle.color = {["red"] = 1, ["blue"] = 1, ["green"] = 1, ["alpha"] = 1}

-- Custom show function to change the duration of the circle display
function customShow()
    mouseCircle:show()
    -- Override the default timer to hide the circle after 0.2 seconds
    if mouseCircle.timer then
        mouseCircle.timer:stop()
    end
    mouseCircle.timer = hs.timer.doAfter(0.2, function()
        mouseCircle.circle:hide(0.5)
        hs.timer.doAfter(0.6, function() mouseCircle.circle:delete() mouseCircle.circle = nil end)
    end)
end

-- Move to display on the left
hs.hotkey.bind(hyper, "f", function()
    local screen = hs.mouse.getCurrentScreen():toWest()
    if screen then
      hs.mouse.setAbsolutePosition(screen:frame().center)
      customShow() -- Custom show function to circle the mouse
    end
  end)
  
  -- Move to display on the right
  hs.hotkey.bind(hyper, "g", function()
    local screen = hs.mouse.getCurrentScreen():toEast()
    if screen then
      hs.mouse.setAbsolutePosition(screen:frame().center)
      customShow() -- Custom show function to circle the mouse
    end
  end)
  
  -- Move to specific displays
  local screens = hs.screen.allScreens()
  hs.hotkey.bind(hyper, "8", function()
    hs.mouse.setAbsolutePosition(screens[3]:frame().center)
    customShow() -- Custom show function to circle the mouse
  end)
  hs.hotkey.bind(hyper, "9", function()
    hs.mouse.setAbsolutePosition(screens[1]:frame().center)
    customShow() -- Custom show function to circle the mouse
  end)
  hs.hotkey.bind(hyper, "0", function()
    hs.mouse.setAbsolutePosition(screens[2]:frame().center)
    customShow() -- Custom show function to circle the mouse
  end)