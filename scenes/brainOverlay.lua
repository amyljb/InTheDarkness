local composer = require( "composer" )
local scene = composer.newScene("brainOverlay")
local physics = require("physics")
local widget = require("widget")
local gameUI = require("gameUI")
local easingx  = require("easingx")
system.activate( "multitouch" )
local badThoughts
local numTapped = 0
--Find device display height and width
_H = display.contentHeight
_W = display.contentWidth
Random = math.random
--Number of Zs variable
numThoughts = 0
-- How many Zs do we start with?
totalThoughts = 20

--options table for next page transitions
local pageChangeOptions = {
    effect = "crossFade",
    time = 3000
}

function exitOverlay()
    -- By some method (a "resume" button, for example), hide the overlay
        composer.hideOverlay( "fade", 200 )
        composer.removeScene("brainOverlay")
        composer.gotoScene( "scenes.scene10")
end


-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

-- 1. Start the physics engine
physics.start()
-- 2. Set gravity to be inverted
physics.setGravity(0, 4)

   local background = display.newImage("Images/darkness.png", true)
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2
    
    local puck = display.newImage("Images/puck_green.png", true)
    puck.x = display.contentWidth/2
    puck.y = display.contentHeight*0.7
    
    
    local topWall1 = display.newRect( 300, 10, 600, 10)
    physics.addBody(topWall1, "static", {friction=0, bounce=0.9 })
    
    local topWall2 = display.newRect( display.contentWidth-300, 10, 600, 10 )
    physics.addBody(topWall2, "static", {friction=0, bounce=0.9 })
    
    local leftWall = display.newRect( 0, display.contentHeight/2, 5, display.contentHeight )
    physics.addBody(leftWall, "static", {friction=0, bounce=0.9 })
    local rightWall = display.newRect( display.contentWidth, display.contentHeight/2, 5, display.contentHeight )
    physics.addBody(rightWall, "static", {friction=0, bounce=0.9 })
    local floor = display.newRect( display.contentWidth/2, display.contentHeight, display.contentWidth, 10 )
    physics.addBody(floor, "static", {friction=0, bounce=0.9 })
    
   -- physics.addBody( puck, { density=0.3, friction=0.6, radius=66.0 } )
   -- puck.linearDamping = 0.4
   -- puck.angularDamping = 0.6
    
    toolMaterial = { density=0.3, friction=0.6, radius=66.0 }
    
    physics.addBody (puck, "dynamic", toolMaterial )
    puck.linearDamping = 0.8
    puck.angularDamping = 1
    puck.gravityScale = 0
    puck.name = "puck"
    
    local exitButton = widget.newButton
{
    width = 190,
    height = 190,
    id ="exit",
    defaultFile = "Images/exitButton.png",
    x = 1900,
    y = 150,
    onRelease = exitOverlay
}

function generateThoughts()
-- Create an image, 250 pixels by 250 pixels
thought = display.newImageRect("Images/z.png", 250, 250)
	-- Set the reference point to the center of the image
        thought.anchorX = _W/2
	
	-- Generate Zs randomly on the X-coordinate
	thought.x = Random(50, _W-50)
	
	-- Generate Zs 10 pixels off screen on the Y-Coordinate
	thought.y = Random(-500, _H)
        
        thought.name = "thought"
	
	-- Apply physics engine to the Zs, set density, friction, bounce and radius
	physics.addBody(thought, "dynamic", {density=0.5, friction=1.0, bounce=1, radius=125})

	-- Increment the Zs variable by 1 for each balloon created
	numThoughts = numThoughts + 1
        sceneGroup:insert(thought)
        thought.collision = onCollision
        thought:addEventListener( "collision", thought )
        return thought
end


local function dragBody( event )
	--gameUI.dragBody( event, { maxForce=10000, frequency=10, dampingRatio=0.2, center=true } )
        return gameUI.dragBody( event )
end

local function onCollision(event)
    if event.phase == "began" then
        if event.object1.name == "puck" and event.object2.name == "thought" then
            print("colldied")
        end 
    end 
end

sceneGroup:insert(background)
sceneGroup:insert(exitButton)
sceneGroup:insert(puck)
sceneGroup:insert(leftWall)
sceneGroup:insert(rightWall)
sceneGroup:insert(topWall1)
sceneGroup:insert(topWall2)
sceneGroup:insert(floor)

puck:addEventListener("touch", dragBody)
Runtime:addEventListener( "collision", onCollision )

puck.collision = onCollision
puck:addEventListener( "collision", puck )

end


-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
timer.performWithDelay(1500, generateThoughts, totalThoughts)
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase
   local sceneGroup = self.view
   local phase = event.phase
   local parent = event.parent 

   if ( phase == "will" ) then
       physics.pause()
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view
   
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
scene:addEventListener( "hide", scene )
---------------------------------------------------------------------------------

return scene



