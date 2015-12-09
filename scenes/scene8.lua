--SEARCH ROOM
local composer = require( "composer" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local widget = require( "widget" )
local scene = composer.newScene("scene8")
local sceneName = "scene8"
local sceneNumber = 8
local nextSceneNumber = "scenes.scene9"
local previousScene = "scenes.scene7"

--local centerX = display.contentCenterX
local centerX = display.contentCenterX
local centerY = display.contentCenterY

--    Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    nextScene = nextSceneNumber
})

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

local sceneGroup = self.view

    --Initialize the scene
    local sceneComponents = sceneObject:getText()
    
local overlayOptions =
{
    effect = "fade",
    time = 2000,
    params =
    {
        var1 = sceneComponents,
        nextScene = nextSceneNumber
    }
}
 --closures that pass params to changePg module 
local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

function changePage( )
        nextClosure()
    return true
end

--create mask group
local maskGroup = display.newGroup()

-- Image to be masked
local image = display.newImageRect( "Images/page7.png", 2046, 1536 )

--setup buttons
     local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    overFile = "Images/nextBtnOver.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.85,
    onRelease = changePage,
}

    local previousBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="previous",
    defaultFile = "Images/nextBtn.png",
    overFile = "Images/nextBtnOver.png",
    x = display.contentWidth/14,
    y = display.contentHeight*0.85,
    onRelease = previousClosure
}
previousBtn.rotation = -180 

--create mouse sprite
local sheetInfo = require("Sprites.mouse")
        local mouseSheet = graphics.newImageSheet( "Sprites/mouse.png", sheetInfo:getSheet() )
        local sequenceData =
            {name="mouse", start = 1, time = 3000, loopCount = 0, count=19}  
            mouseSprite = display.newSprite(mouseSheet, sequenceData)
            mouseSprite:translate( centerX, centerY )
            mouseSprite.x = display.contentWidth/3
            mouseSprite.y = display.contentHeight/4
            mouseSprite:play()
            
--setup rocket sprite
local sheetInfo2 = require("Sprites.rocket")
        local rocketSheet = graphics.newImageSheet( "Sprites/rocket.png", sheetInfo2:getSheet() )
        local sequenceData2 =
            {name="rocket", start = 1, time = 2500, loopCount = 0, count=28}  
            rocketSprite = display.newSprite(rocketSheet, sequenceData2)
            rocketSprite.x = -700
            rocketSprite.y = -220--display.contentHeight/8--/9
            rocketSprite:play()                    
            
maskGroup:insert(image)
maskGroup:insert(mouseSprite)
maskGroup:insert(rocketSprite)
-- Mask
local mask = graphics.newMask( "Images/circlemask3.png" )
maskGroup:setMask( mask )
maskGroup:translate( centerX, centerY )

sceneGroup:insert(maskGroup)
sceneGroup:insert(previousBtn)
sceneGroup:insert(nextPgBtn)

local radiusMax = math.sqrt( centerX*centerX + centerY*centerY )

function onTouch( event )
	local t = event.target

	local phase = event.phase
	if "began" == phase then
		display.getCurrentStage():setFocus( t )

		-- Spurious events can be sent to the target, e.g. the user presses 
		-- elsewhere on the screen and then moves the finger over the target.
		-- To prevent this, we add this flag. Only when it's true will "move"
		-- events be sent to the target.
		t.isFocus = true

		-- Store initial position
		t.x0 = event.x - t.maskX
		t.y0 = event.y - t.maskY
	elseif t.isFocus then
		if "moved" == phase then
			-- Make object move (we subtract t.x0,t.y0 so that moves are
			-- relative to initial grab point, rather than object "snapping").
			local maskX = event.x - t.x0
			local maskY = event.y - t.y0
			t.maskX = maskX
			t.maskY = maskY

			-- Stretch the flashlight as it moves further away 
			-- from the screen's center
			local radius = math.sqrt( maskX*maskX + maskY*maskY )
			local scaleDelta = radius/radiusMax
			t.maskScaleX = 1 + scaleDelta
			t.maskScaleY = 1 + 0.2 * scaleDelta

			-- Rotate it appropriately about screen center
			local rotation = math.deg( math.atan2( maskY, maskX ) )
			t.maskRotation = rotation

		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false
		end
	end

	return true
end
maskGroup:addEventListener( "touch", onTouch )

-- By default, the mask will limit the touch region to areas that lie inside 
-- both the mask and the image being masked.  We can override this by setting the
-- isHitTestMasked property to false, so the touch region lies inside the entire image. 
maskGroup.isHitTestMasked = false

end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then

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

---------------------------------------------------------------------------------

return scene

