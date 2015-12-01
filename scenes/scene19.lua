--BEDROOM ONE
local composer = require( "composer" )
local changePg = require("changePg")
local widget = require("widget")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local sfx = require("modules.sfx")
local scene = composer.newScene("scene19")
local sceneName = "scene19"
local sceneNumber = 19
local nextSceneNumber = "scenes.scene20"
local counter = 0
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
    time = 2000,
    params =
    {
        var1 = sceneComponents,
        nextScene = nextSceneNumber
    }
}

local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

local function changePage()
        composer.gotoScene( "scenes.textPage", overlayOptions )
    return true
end

local scene21bkg = display.newImage("Images/scaryRoom.png", true)
scene21bkg.x = display.contentWidth/2
scene21bkg.y = display.contentHeight/2
scene21bkg.alpha = 0

local darkness = display.newImage("Images/darkness.png", true)
darkness.x = display.contentWidth/2
darkness.y = display.contentHeight/2

    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.85,
    onRelease = nextClosure
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
    onRelease = previousClosure
}
previousBtn.rotation = -180


--local eyesSheetInfo = require("eyeGroup1")
--local eyesSheet = graphics.newImageSheet( "eyeGroup1.png", eyesSheetInfo:getSheet() )
    
   -- local eyesSequenceData =
    --{name="eyes1", time = 1000, loopCount = 1}
    
       -- eyesSprite1 = display.newSprite(eyesSheet, eyesSequenceData)
      --  eyesSprite1.x = display.contentWidth/2 
       -- eyesSprite1.y = display.contentHeight/2  

function playEyes()
    eyeSprite1.alpha = 1
    eyeSprite1:play()
    eyeSprite2.alpha = 1
    eyeSprite2:play()
    eyeSprite3.alpha = 1
    eyeSprite3:play()
   -- eyeSprite4.alpha = 1
   -- eyeSprite4:play()
end

local function spriteListener(event)
    local thisSprite = event.target
    counter = counter + 1
    if event.phase == "ended" then 
        thisSprite:removeSelf()
        transition.to(darkness, {alpha=0, time = 3000})
        transition.to(scene21bkg, {alpha=1, time = 3000})   
    end
end

 local eyeSheetInfo = require("Sprites.eyeGroup1")
 local eyesSheet1 = graphics.newImageSheet( "Sprites/eyeGroup1.png", eyeSheetInfo:getSheet() )
    local sequenceData =
    {name="blinking", start = 1, time = 6000, loopCount = 2, count=5}  
    
    eyeSprite1 = display.newSprite(eyesSheet1, sequenceData)
    eyeSprite1.x = display.contentWidth/3
    eyeSprite1.y = display.contentHeight/4
    eyeSprite1.alpha = 0
    
  local sheetInfo2 = require("Sprites.eyeGroup2")
  local eyesSheet2 = graphics.newImageSheet( "Sprites/eyeGroup2.png", sheetInfo2:getSheet() )
    local sequenceData2 =
    {name="blinking", start = 1, time = 6000, loopCount = 2, count=4}  
    
    eyeSprite2 = display.newSprite(eyesSheet2, sequenceData2)
    eyeSprite2.x = display.contentWidth*0.7
    eyeSprite2.y = display.contentHeight/3
    eyeSprite2.alpha = 0  
    
    local sheetInfo3 = require("Sprites.eyeGroup3")
  local eyesSheet3 = graphics.newImageSheet( "Sprites/eyeGroup3.png", sheetInfo3:getSheet() )
    local sequenceData3 =
    {name="blinking", start = 1, time = 6000, loopCount = 2, count=4}  
    
    eyeSprite3 = display.newSprite(eyesSheet3, sequenceData3)
    eyeSprite3.x = display.contentWidth/3
    eyeSprite3.y = display.contentHeight*0.7
    eyeSprite3.alpha = 0 
    
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
        
    --local sheetInfo4 = require("eyeGroup4")
  --local eyesSheet4 = graphics.newImageSheet( "eyeGroup4.png", sheetInfo4:getSheet() )
  --  local sequenceData4 =
   -- {name="blinking", start = 1, time = 6000, loopCount = 2, count=6}  
    
   -- eyeSprite4 = display.newSprite(eyesSheet4, sequenceData4)
   -- eyeSprite4.x = display.contentWidth/4
  --  eyeSprite4.y = display.contentHeight*0.7
  --  eyeSprite4.alpha = 0 

function changeImage()
    doorEyesSprite:removeSelf()
    doorSprite:removeSelf()
    transition.to(darkness, {alpha = 0, time = 1000})
    transition.to(scene21bkg, {alpha = 1, time = 1000})
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
sceneGroup:insert(darkness)
sceneGroup:insert(eyeSprite1)
sceneGroup:insert(eyeSprite2)
sceneGroup:insert(eyeSprite3)
sceneGroup:insert(doorSprite)
sceneGroup:insert(doorEyesSprite)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(previousBtn)

eyeSprite1:addEventListener("sprite", spriteListener)
eyeSprite2:addEventListener("sprite", spriteListener)
eyeSprite3:addEventListener("sprite", spriteListener)
doorSprite:addEventListener("tap", openDoor)
end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       --timer.performWithDelay(2000, playEyes)
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

