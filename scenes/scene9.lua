--UNDER BED TENTACLES
local composer = require( "composer" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local widget = require( "widget" )
local scene = composer.newScene("scene9")
local sceneName = "scene9"
local centreX = display.contentCenterX
local centreY = display.contentCenterY
local numTapped = 0
local transitioned = false
local sceneNumber = 9
local nextSceneNumber = "scenes.scene10"
local previousScene = "scenes.scene8"

--    Create a scene object based on data read from data.json
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

local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

local function tapCounter()
    if numTapped == 5 then
        nextClosure()
    end
end

local background = display.newImage("Images/page8.png", true)
background.x = centreX
background.y = centreY

local bed = display.newImage("Images/overheadBed.png", true)
bed.x = display.contentWidth/2
bed.y = display.contentHeight/2

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

local sheetInfo = require("Sprites.tentacle")
        local tentacleSheet = graphics.newImageSheet( "Sprites/tentacle.png", sheetInfo:getSheet() )
        local sequenceData = 
            {name="slither", start = 1, time = 2000, loopCount = 0, count=18}
                                
        tentacleNew = display.newSprite(tentacleSheet, sequenceData)
        tentacleNew.x = display.contentWidth*0.75 --Random(50, _W-50)
        tentacleNew.y =display.contentHeight/2 --display.contentHeight/5  
        tentacleNew.rotation = 90
                     
local sheetInfo2 = require("Sprites.bearclaw")
        local bearclawSheet = graphics.newImageSheet( "Sprites/bearclaw.png", sheetInfo2:getSheet() )
        local sequenceData2 = 
            {name="claws", start = 1, time = 2000, loopCount = 1, count=5}
                                
        bearclaw = display.newSprite(bearclawSheet, sequenceData2)
        bearclaw.x = display.contentWidth/3.5
        bearclaw.y =display.contentHeight*0.47     
        
local sheetInfo3 = require("Sprites.tentacle")
        local tentacleSheet2 = graphics.newImageSheet( "Sprites/tentacle.png", sheetInfo3:getSheet() )
        local sequenceData2 = 
            {name="slither2", start = 1, time = 2000, loopCount = 0, count=18}
                                
        tentacle2 = display.newSprite(tentacleSheet2, sequenceData2)
        tentacle2.x = display.contentWidth/3.5 
        tentacle2.y =display.contentHeight/5 --display.contentHeight/5  
        tentacle2.rotation = -90        
        
local sheetInfo4 = require("Sprites.spikedTent")
        local tentacleSheet3 = graphics.newImageSheet( "Sprites/spikedTent.png", sheetInfo4:getSheet() )
        local sequenceData3 = 
            {name="slither3", start = 1, time = 1000, loopCount = 0, count=6}
                                
        spikedTent = display.newSprite(tentacleSheet3, sequenceData3)
        spikedTent.x = display.contentWidth*0.6 
        spikedTent.y =display.contentHeight*0.7 --display.contentHeight/5  
        
local sheetInfo5 = require("Sprites.tentBottomL")
        local tentacleSheet4 = graphics.newImageSheet( "Sprites/tentBottomL.png", sheetInfo5:getSheet() )
        local sequenceData4 = 
            {name="slither4", start = 1, time = 2000, loopCount = 0, count=12}
                                
        tentBottomL = display.newSprite(tentacleSheet4, sequenceData4)
        tentBottomL.x = display.contentWidth/4
        tentBottomL.y =display.contentHeight*0.7        
        
sceneGroup:insert(background)
sceneGroup:insert(tentacleNew)
sceneGroup:insert(bearclaw)
sceneGroup:insert(tentacle2)
sceneGroup:insert(spikedTent)
sceneGroup:insert(tentBottomL)
sceneGroup:insert(bed)
sceneGroup:insert(previousBtn)

local function onTouch( event )
   display.remove( event.target )
   numTapped = numTapped + 1
   tapCounter()
   return true
end

function playClaws()
        bearclaw:play()
        tentacle2:play()
        tentBottomL:play()
        tentacleNew:play()
       spikedTent:play()
end

bearclaw:addEventListener( "tap", onTouch )
tentBottomL:addEventListener( "touch", onTouch )
tentacle2:addEventListener( "tap", onTouch )
tentacleNew:addEventListener( "tap", onTouch )
spikedTent:addEventListener( "tap", onTouch )

   -- function removeEventListeners()
     --   print("removeEventListeners called scene 8")
    -- bearclaw:removeEventListener( "touch", onTouch )
      --  spikeBottom:removeEventListener( "touch", onTouch )
        --tentacle1:removeEventListener( "touch", onTouch )
      --  tentacle2:removeEventListener( "touch", onTouch )
      --  longTent:removeEventListener( "touch", onTouch )
   -- end
end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       timer.performWithDelay(1000, playClaws )
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
    --removeEventListeners()
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

