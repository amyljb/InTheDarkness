--FREDDIE SEES GHOST
local composer = require( "composer" )
local widget = require("widget")
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local rubPrompt = require("modules.rubOutPrompt")
local scene = composer.newScene("scene15")
local sceneName = "scene15"
local sceneNumber = 15
local nextSceneNumber = "scenes.scene16"
local previousScene = "scenes.scene14"
local previousX = 0
local previousY = 0
local nextTapped = false
local previousX, previousY
local threshold = 10
local thresholdSq = threshold*threshold

--Create a scene object based on data read from data.json
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
    time = 1500,
    params =
    {
        var1 = sceneComponents,
        nextScene = nextSceneNumber
    }
}

--closures that pass params to changePg module
local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

--function to change pg based on button id
local function changePage(event)
    movedPage = true
    if event.target.id == "nextPage" then
        nextClosure()  
    else if event.target.id == "previous" then
        previousClosure()
    end
    return true
    end
end

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
    onRelease = changePage
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
    --onRelease = loadPrevious(previousScene)
    onRelease = changePage
}
previousBtn.rotation = -180

--setup images and snapshot
local backImage = display.newImage( "Images/kitchen.png", display.contentCenterX, display.contentCenterY  )

local snapshot = display.newSnapshot(2048, 1536)
snapshot:translate( display.contentCenterX, display.contentCenterY )
local kitchenBkg = display.newImage( "Images/dungeon.png", true )
snapshot.canvas:insert(kitchenBkg)
snapshot:invalidate( "canvas" )

--setup ghost sprite
local sheetInfo = require("Sprites.kitchenGhost")
local kitchenGhostSheet = graphics.newImageSheet( "Sprites/kitchenGhost.png", sheetInfo:getSheet() )
 
 local sequenceData =
    {name="floating", start = 1, time = 1000, loopCount = 0, count=6}  
        kitchenGhostSprite = display.newSprite(kitchenGhostSheet, sequenceData)
    
        kitchenGhostSprite.x = display.contentWidth - display.contentWidth/4
        kitchenGhostSprite.y = display.contentHeight/3 

--setup brush, add to snapshot
local function draw( x, y )
	local o = display.newImage( "Images/brush.png", x, y )
	o.fill.blendMode = { srcColor = "zero", dstColor="oneMinusSrcAlpha" }

	snapshot.canvas:insert( o )
	snapshot:invalidate( "canvas" ) -- accumulate changes w/o clearing
end

--rub out listener
local function listener( event )
	local x,y = event.x - snapshot.x, event.y - snapshot.y

	if ( event.phase == "began" ) then
		previousX,previousY = x,y
		draw( x, y )
	elseif ( event.phase == "moved" ) then
		local dx = x - previousX
		local dy = y - previousY
		local deltaSq = dx*dx + dy*dy
		if ( deltaSq > thresholdSq ) then
			draw( x, y )
			previousX,previousY = x,y
		end
	end
end

--insert display objects into sceneGroup 
sceneGroup:insert(backImage)
sceneGroup:insert(snapshot)
sceneGroup:insert(kitchenGhostSprite)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(previousBtn)

--add event listeners
snapshot:addEventListener( "touch", listener )

end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       local swipeClosure = function() return rubPrompt.rubOutIndicator(nextTapped) end
        timer.performWithDelay(1500, swipeClosure, 1)
       kitchenGhostSprite:play()
       
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
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene








