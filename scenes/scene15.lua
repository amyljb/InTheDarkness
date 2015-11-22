--FREDDIE SEES GHOST
local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene("scene15")
local sceneName = "scene15"
local sceneNumber = 15
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene16"
local rubPrompt = require("rubOutPrompt")
local previousX = 0
local previousY = 0
local nextTapped = false

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
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

local function changePage()
    nextTapped = true
    composer.gotoScene( "scenes.textPage", overlayOptions ) 
    return true
end

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
local backImage = display.newImage( "Images/kitchen.png", display.contentCenterX, display.contentCenterY  )

local snapshot = display.newSnapshot(2048, 1536)
snapshot:translate( display.contentCenterX, display.contentCenterY )

local kitchenBkg = display.newImage( "Images/dungeon.png", true )
--kitchenBkg.x=display.contentWidth/2
--kitchenBkg.y=display.contentHeight/2

snapshot.canvas:insert(kitchenBkg)
snapshot:invalidate( "canvas" )

local sheetInfo = require("Sprites.kitchenGhost")
local kitchenGhostSheet = graphics.newImageSheet( "Sprites/kitchenGhost.png", sheetInfo:getSheet() )
 
 local sequenceData =
    {name="floating", start = 1, time = 1000, loopCount = 0, count=6}  
        kitchenGhostSprite = display.newSprite(kitchenGhostSheet, sequenceData)
    
        kitchenGhostSprite.x = display.contentWidth - display.contentWidth/4
        kitchenGhostSprite.y = display.contentHeight/3 


local previousX, previousY
local threshold = 10
local thresholdSq = threshold*threshold

local function draw( x, y )
	local o = display.newImage( "Images/brush.png", x, y )
	o.fill.blendMode = { srcColor = "zero", dstColor="oneMinusSrcAlpha" }

	snapshot.canvas:insert( o )
	snapshot:invalidate( "canvas" ) -- accumulate changes w/o clearing
end

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

sceneGroup:insert(backImage)
sceneGroup:insert(snapshot)
sceneGroup:insert(kitchenGhostSprite)
sceneGroup:insert(nextPgBtn)

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
        timer.performWithDelay(5000, swipeClosure, 1)
       kitchenGhostSprite:play()
       local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
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








