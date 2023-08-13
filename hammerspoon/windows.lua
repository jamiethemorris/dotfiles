-- Move window to the next display
hs.hotkey.bind(hyper, "right", function()
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():next()
    win:moveToScreen(nextScreen)
end)

-- Move window to the previous display
hs.hotkey.bind(hyper, "left", function()
    local win = hs.window.focusedWindow()
    local prevScreen = win:screen():previous()
    win:moveToScreen(prevScreen)
end)