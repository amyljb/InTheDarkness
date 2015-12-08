--BEDROOM 
local composer = require( "composer" )
local changePg = require("changePg")
local widget = require("widget")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local sfx = require("modules.sfx")
local rubPrompt = require("modules.rubOutPrompt")
local scene = composer.newScene("scene19")
local sceneName = "scene19"
local sceneNumber = 19
local nextSceneNumber = "scenes.scene20"
local counter = 0
local movedPage = false
--local whooshSound = audio.loadStream("Sounds/whoosh_1.mp3")
local previousScene = "scenes.scene18"

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
    time = 1500,
    params =
    {
        var1 = sceneComponents,
        nextScene = nextSceneNumber
    }
}

local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

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

local scene21bkg = display.newImage("Images/eyesReveal.png", true)
scene21bkg.x = display.contentWidth/2
scene21bkg.y = display.contentHeight/2
scene21bkg.alpha = 0

local darkness = display.newImage("Images/darkness.png", true)
 darkness.x = display.contentWidth/2
 darkness.y = display.contentHeight/2

local snapshot = display.newSnapshot(2048, 1536)
snapshot:translate( display.contentCenterX, display.contentCenterY )
snapshot.alpha=0

local roomEyes = display.newImage("Images/roomEyes.png", true)
snapshot.canvas:insert(roomEyes)
snapshot:invalidate( "canvas" )

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
		previousX = x
                previousY = y
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

    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
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
    onRelease = changePage
}
previousBtn.rotation = -180

    
    local sheetInfo4 = require("Sprites.bedroomDoor")
    local doorSheet = graphics.newImageSheet( "Sprites/bedroomDoor.png", sheetInfo4:getSheet() )
 
    local sequenceData4 =
   {name="opening", start = 1, time = 500, loopCount = 1, count=4}  
        doorSprite = display.newSprite(doorSheet, sequenceData4)
        doorSprite.x = display.contentWidth/2 
       doorSprite.y = display.contentHeight/2
        
     local sheetInfo5 = require("Sprites.doorEyes")
    local doorEyesSheet = graphics.newImageSheet( "Sprites/doorEyes.png", sheetInfo5:getSheet() )
 
    local sequenceData5 =
    {name="blinking", start = 1, time = 4000, loopCount = 3, count=5}  
        doorEyesSprite = display.newSprite(doorEyesSheet, sequenceData5)
        doorEyesSprite.x = display.contentWidth/2 
        doorEyesSprite.y = display.contentHeight/2
        doorEyesSprite.alpha=0
        

function changeImage()
    doorEyesSprite:removeSelf()
    doorSprite:removeSelf()
    snapshot.alpha=1
    snapshot:addEventListener( "touch", listener )  
    transition.to(darkness, {alpha = 0, time = 1000})
    transition.to(scene21bkg, {alpha = 1, time = 1000})
    local rubOutClosure = function() return rubPrompt.rubOutIndicator(movedPage) end
    timer.performWithDelay(2000, rubOutClosure, 1)
end

function hideEyes()
    doorEyesSprite.alpha=0
    transition.to(doorSprite, {xScale = 6, yScale = 6, time = 2500, onComplete = changeImage})
    audio.play(sfx.whooshSound, {loops=1, duration =2000})
end

function playDoorEyes()
    doorEyesSprite.alpha=1
    doorEyesSprite:play()
    timer.performWithDelay(3000, hideEyes)
end

function openDoor()
    doorSprite:play()
    doorSprite:removeEventListener("tap", openDoor)
    timer.performWithDelay(1500, playDoorEyes)
    
end

sceneGroup:insert(scene21bkg)
sceneGroup:insert(snapshot)
sceneGroup:insert(darkness)
sceneGroup:insert(doorSprite)
sceneGroup:insert(doorEyesSprite)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(previousBtn)

doorSprite:addEventListener("tap", openDoor)

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

