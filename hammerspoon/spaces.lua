local function focusSpace(spaceIndex)
    local command = "/usr/local/bin/yabai -m space --focus \"$(/usr/local/bin/yabai -m query --displays --display mouse | /usr/local/bin/jq '.spaces[" .. (spaceIndex - 1) .. "]')\""
    os.execute(command)
end

hs.hotkey.bind(hyper, "1", function() focusSpace(1) end)
hs.hotkey.bind(hyper, "2", function() focusSpace(2) end)
hs.hotkey.bind(hyper, "3", function() focusSpace(3) end)
hs.hotkey.bind(hyper, "4", function() focusSpace(4) end)
