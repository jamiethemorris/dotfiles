local currentLayer = "Layer: Default"
local currentDygmaLayer = "Layer: Mac"
local currentGMMKLayer = "Layer: Macros"
local currentQ0Layer = "Layer: Numpad"
local trackballLayerText -- Store the trackball layer text canvas
local dygmaLayerText -- Store the Dygma layer text canvas
local gmmkLayerText -- Store the GMMK layer text canvas
local q0LayerText -- Store the Q0 layer text canvas
local lastLayerText = currentLayer -- Initialize to the default layer
local currentDPI = "DPI: 1600"
local currentDPIColor = { white = 1, alpha = 1 } -- Define a default color for DPI text

local showTrackballLayer = true
local showDygmaLayer = true
local showGMMKLayer = true
local showQ0Layer = true
local layerOffset = -60

local function setAllSpacesBehavior(canvasObject)
  canvasObject:level(hs.canvas.windowLevels.overlay)
  canvasObject:behavior(hs.canvas.windowBehaviors.canJoinAllSpaces)
end

function drawLayerText(text, textColor, updateLastLayer, positionOffset, canvasObj)
  if updateLastLayer then -- Only update the lastLayerText if the flag is set
    lastLayerText = text
  end

  if canvasObj then
    canvasObj:delete() -- delete previous canvas if it exists
  end

  local rectWidth = 100
  local rectHeight = 20
  local positionX = (hs.screen.mainScreen():frame().w - rectWidth) / 2 - positionOffset

  canvasObj = hs.canvas.new(hs.geometry.rect(positionX, 0, rectWidth, rectHeight))

  -- insert rectangle
  canvasObj:insertElement({
    type = 'rectangle',
    action = 'strokeAndFill',
    roundedRectRadii = { xRadius = 10, yRadius = 10 },
    fillColor = { red = 0, green = 0, blue = 0, alpha = 0.5 }, -- Constant color for the rectangle
    strokeWidth = 2,
    strokeColor = { white = 1, alpha = 1 },
    frame = { x = "0%", y = "0%", h = "100%", w = "100%" },
  })

  -- insert text
  canvasObj:insertElement({
    type = 'text',
    action = 'fill',
    frame = { x = "0%", y = "10%", h = "100%", w = "100%" },
    text = text,
    textSize = 12,
    textColor = textColor or { white = 1, alpha = 1 }, -- Apply the color argument here
    textAlignment = "center"
  })

  setAllSpacesBehavior(canvasObj)
  canvasObj:show()
  return canvasObj
end

function drawTrackballLayerText(layer, color)
  if showTrackballLayer then
    trackballLayerText = drawLayerText(layer, color, true, layerOffset - 120, trackballLayerText)
  end
end

function drawDygmaLayerText(layer, color)
  if showDygmaLayer then
    dygmaLayerText = drawLayerText(layer, color, true, layerOffset + 0, dygmaLayerText)
  end
end

function drawGMMKLayerText(layer, color)
  if showGMMKLayer then
    gmmkLayerText = drawLayerText(layer, color, true, layerOffset + 240, gmmkLayerText)
  end
end

function drawQ0LayerText(layer, color)
  if showQ0Layer then
    q0LayerText = drawLayerText(layer, color, true, layerOffset + 120, q0LayerText)
  end
end

-- Bindings for trackball Layers
hs.hotkey.bind(hyper, 'F13', function() drawTrackballLayerText("Layer: Default", nil, true, 0) end)
hs.hotkey.bind(hyper, 'F14', function() drawTrackballLayerText("Layer: Spaces", nil, true, 0) end)
hs.hotkey.bind(hyper, 'F15', function() drawTrackballLayerText("Layer: Nav", nil, true, 0) end)
hs.hotkey.bind(hyper, 'F16', function() drawTrackballLayerText("Layer: Logic", nil, true, 0) end)
hs.hotkey.bind(hyper, 'F17', function() drawTrackballLayerText("Layer: Mixer", nil, true, 0) end)

-- Bindings for dygma Layers
hs.hotkey.bind(meh, 'F13', function() drawDygmaLayerText("Layer: Mac", nil) end)
hs.hotkey.bind(meh, 'F14', function() drawDygmaLayerText("Layer: PC", nil) end)
hs.hotkey.bind(meh, 'F15', function() drawDygmaLayerText("Layer: Gaming", nil) end)

-- Bindings for GMMK Layers
hs.hotkey.bind(power, 'F13', function() drawGMMKLayerText("Layer: Macros", nil) end)
hs.hotkey.bind(power, 'F14', function() drawGMMKLayerText("Layer: RGB", nil) end)
hs.hotkey.bind(power, 'F15', function() drawGMMKLayerText("Layer: MIDI", nil) end)
hs.hotkey.bind(power, 'F16', function() drawGMMKLayerText("Layer: Chords", nil) end)

-- Bindings for Q0 Layers
hs.hotkey.bind(power, 'F17', function() drawQ0LayerText("Layer: Numpad", nil) end)
hs.hotkey.bind(power, 'F18', function() drawQ0LayerText("Layer: RGB", nil) end)
hs.hotkey.bind(power, 'F19', function() drawQ0LayerText("Layer: Macro", nil) end)
hs.hotkey.bind(power, 'F20', function() drawQ0LayerText("Layer: Misc", nil) end)

-- Bindings for DPI changes
hs.hotkey.bind(hyper, 'F18', function()
  currentDPI = "DPI: 800"
  currentDPIColor = { red = 1, green = 0.5, blue = 0.5, alpha = 1 }
  drawDpiText(currentDPI, currentDPIColor) 
end)
hs.hotkey.bind(hyper, 'F19', function() 
  currentDPI = "DPI: 1600"
  currentDPIColor = { red = 0, green = 1, blue = 1, alpha = 1 }
  drawDpiText(currentDPI, currentDPIColor) 
end)
hs.hotkey.bind(hyper, 'F20', function() 
  currentDPI = "DPI: 2400"
  currentDPIColor = { red = 1, green = 0.5, blue = 0, alpha = 1 }
  drawDpiText(currentDPI, currentDPIColor) 
end)

-- Draw the default text and rectangle
drawTrackballLayerText(currentLayer, nil)
drawDygmaLayerText(currentDygmaLayer, nil)
drawGMMKLayerText(currentGMMKLayer, nil)
drawQ0LayerText(currentQ0Layer, nil)

