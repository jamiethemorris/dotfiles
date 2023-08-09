mouseCircle = hs.loadSpoon('MouseCircle')
require ("hotkeys")
require("mouse_functions")
require("mousemap")
require("spaces")

-- Reload config
hs.hotkey.bind(hyper, "r", function()
    hs.reload()
  end)
-- Show the key code of the pressed key
-- hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
--    local keyCode = event:getKeyCode()
--    local character = hs.keycodes.map[keyCode]
--    print("Key Code:", keyCode, "Character:", character)
--    return false
-- end):start()