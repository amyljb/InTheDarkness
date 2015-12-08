--119 : ATTEMPT TO COMPARE NIL WITH NUMBER???

local composer = require( "composer" )
local scene = composer.newScene("brainOverlay")
local physics = require("physics")
local widget = require("widget")
local gameUI = require("gameUI")
local easingx  = require("easingx")
system.activate( "multitouch" )
local badThoughts
local numTapped = 0
local exitPressed = false
local score = 0
--Find device display height and width
_H = display.contentHeight
_W = display.contentWidth
Random = math.random

--options table for next page transitions
local pageChangeOptions = {
    effect = "crossFade",
    time = 2000
}

-- Options table for the overlay scene "badgeOverlay.lua"
local overlayOptions = {
   isModal = true,
   effect = "crossFade",
   time = 400
}

function exitOverlay()
    -- By some method (a "resume" button, for example), hide the overlay
    exitPressed = true
        composer.hideOverlay( "fade", 200 )
        --composer.removeScene("brainOverlay")
        composer.gotoScene( "scenes.scene10")
        if moveTimer then
          timer.cancel(moveTimer)  
        end
end

-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

-- 1. Start the physics engine
physics.start()
--  Set gravity 
physics.setGravity(0, 4)

   local background = display.newImage("Images/brainBkg.png", true)
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2
    
    local instructions = display.newImage("Images/puckInstructions.png", true)
    instructions.x = display.contentWidth/2
    instructions.y = display.contentHeight/2
    instructions.alpha=0
    
    local puck = display.newImage("Images/puck_green.png", true)
    puck.x = display.contentWidth/4
    puck.y = display.contentHeight*0.7
    
    local enemy = display.newImage("Images/enemy.png", true)
    enemy.x = display.contentWidth/7
    enemy.y = display.contentHeight/9
    physics.addBody(enemy, 'static', {radius = 25})
    
    local score = display.newText(score, 1875, 150, 'Courier-Bold', 150)
    score:setTextColor(0, 0, 0)
    
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
    
   -- toolMaterial = { density=0.3, friction=0.6, radius=66.0 }
    
    physics.addBody (puck, "dynamic", { friction=0.6, bounce = 0.4} )
    puck.isFixedRotation = true
    puck.linearDamping = 0.8
    puck.angularDamping = 1
    puck.gravityScale = 0
    puck.name = "puck"
    
    local exitButton = widget.newButton
{
    width = 150,
    height = 150,
    id ="exit",
    defaultFile = "Images/exitButton.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.9,
    onRelease = exitOverlay
}

--       -- Create an image, 250 pixels by 250 pixels
       local thought = display.newImage("Images/badThought.png", true)

--	-- Generate Zs randomly on the X-coordinate
	thought.x = display.contentWidth/2

	thought.y = display.contentHeight/2
        physics.addBody(thought, "dynamic", {density=0.5, friction=1.0, bounce=1.5, radius=125})
        

local function dragBody( event )
	gameUI.dragBody( event, { maxForce=10000, frequency=10, dampingRatio=0.2, center=true } )
       -- return gameUI.dragBody( event )
end


local function moveEnemy(e)
	-- Move Enemy
        if exitPressed==false then
	if(thought.y < display.contentHeight * 0.5) then
		transition.to(enemy, {time = 700, x = thought.x})
	end
        end
end

local function update()
	-- Score
        if exitPressed==false then
           if(thought.y < -100) then
		score.text = tostring(tonumber(score.text) + 1)
            end 
        end
	
	
	-- Reset Puck position
	if exitPressed==false then
	if(thought.y < -100) then
		thought.x = display.contentCenterX
		thought.y = display.contentCenterY
		thought.isAwake = false
	end 
        end
	
	-- Keep puck inside play area
	if exitPressed==false then
	if(puck.y < -100) then
            puck.x = display.contentWidth/2
            puck.y = display.contentHeight*0.7
        end
        end
end

local function textDelete()
   instructions.alpha = 0
   --instructions:removeSelf()
    moveTimer = timer.performWithDelay(100, moveEnemy, 0)
end   

local function scaleDown()
    transition.scaleTo( instructions, { xScale=1.0, yScale=1.0, time=2000, onComplete=textDelete } )    
end    

function playInstructions()
    instructions.alpha = 1
    transition.scaleTo( instructions, { xScale=1.1, yScale=1.1, time=2000, onComplete=scaleDown}) 
end 

sceneGroup:insert(background)
sceneGroup:insert(exitButton)
sceneGroup:insert(puck)
sceneGroup:insert(leftWall)
sceneGroup:insert(rightWall)
sceneGroup:insert(topWall1)
sceneGroup:insert(topWall2)
sceneGroup:insert(floor)
sceneGroup:insert(enemy)
sceneGroup:insert(thought)
sceneGroup:insert(score)
sceneGroup:insert(instructions)
 
puck:addEventListener("touch", dragBody)
Runtime:addEventListener('enterFrame', update)

end


-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       timer.performWithDelay(700, playInstructions)
    --timer.performWithDelay(1500, generateThoughts, totalThoughts)
   
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
       Runtime:removeEventListener('enterFrame', update)
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



