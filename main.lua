-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local tapCount = 0

local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText(tapCount, display.contentCenterX, 20, native.systemeFont, 40)
tapText:setFillColor(0,0,0)

local platform = display.newImageRect("platform.png", 300,50)
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local balloon = display.newImageRect("balloon.png", 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.7 

local physics = require("physics")
physics.start()

-- ajout de propriété physiques
physics.addBody(platform, "static")
physics.addBody(balloon, "dynamic", { radius=50, bounce=0.3})

local function pushBalloon()
    -- first param = horizontal direction/ second param =vertical direction
    -- balloon.x and balloon.y, tell the physics engine where to apply the force, relative to the balloon itself
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
    tapCount = tapCount +1
    tapText.text = tapCount
end

balloon:addEventListener ("tap", pushBalloon)
