-- local logger = hs.logger.new('mymodule','debug')

local overrideMouseButtons = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDown }, function(e)
local mouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])
-- logger.d('Button pressed: ' .. mouseButton)

if mouseButton == 3 then
    hs.eventtap.keyStroke({'cmd'}, '[')
    return true
elseif mouseButton == 4 then
    hs.eventtap.keyStroke({'cmd'}, ']')
    return true
end
end)

overrideMouseButtons:start()
