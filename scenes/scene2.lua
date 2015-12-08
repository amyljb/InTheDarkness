--HOUSE IMAGE
local composer = require( "composer" )
local tapIndicatorFunc = require("modules.tapIndicatorFunc")
local sfx = require("modules.sfx")
local changePg = require("changePg")
local scene = composer.newScene()
local sceneName = "scene2"
local tapIndicator
local indTapped = false
local xSpeed = .1
local ySpeed = -.15
local movedPage = false
local rain = require("modules.rain")
local sceneNumber = 2
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local widget = require("widget")
local nextSceneNumber = "scenes.scene3"
local previousScene = "scenes.scene1"

--options table for next page transitions
local pageChangeOptions = {
    effect = "fade",
    time = 1500
}

--    Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber,
    previousScene = previousScene
})
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
       --    Initialize the scene
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
    if event.target.id == "door" then
      nextClosure()  
    else if event.target.id == "previous" then
        previousClosure()
    end
    return true
    end
end

    group = display.newGroup()
    
    local niceHouse = display.newImage("Images/niceHouse.png", true)
    niceHouse.x = display.contentWidth/2
    niceHouse.y = display.contentHeight/2
    
   local backgroundOne = display.newImage("Images/page2.png", true)
    backgroundOne.x = display.contentWidth/2
    backgroundOne.y = display.contentHeight/2
    
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
    
    local clouds = display.newImage("Images/clouds.png", true)
    clouds.anchorX = 0
    clouds.anchorY = 0
    clouds.x = display.contentWidth/2
    clouds.y =0
    
   local house = display.newImage("Images/house.png", true)
    house.x = display.contentWidth/2
    house.y = display.contentHeight/2 - 200
    
   local forestL = display.newImage("Images/forestL.png", true)
   forestL.x = display.contentWidth/2 
    forestL.y = display.contentHeight/2 
    
   local forestR = display.newImage("Images/forestR.png", true)
    forestR.x = display.contentWidth/2 
    forestR.y = display.contentHeight/2
    
    local doorClosed = display.newImage("Images/door_closed.png", true)
    doorClosed.x= display.contentWidth/2 - 250
    doorClosed.y= display.contentHeight/2 + 125
    doorClosed.id = "door"
    
    tapIndicator = display.newImage("Images/tapButton.png", true)
    tapIndicator.x= display.contentWidth/2 - 250
    tapIndicator.y= display.contentHeight/2 + 125
    tapIndicator.alpha = 0
    
  local sheetInfo = require("Sprites.lightning1")
   local lightningSheet = graphics.newImageSheet( "Sprites/lightning1.png", sheetInfo:getSheet() )
   local sequenceData =
   {name="striking", start = 1, time = 500, loopCount = 0, count=2}  
   
    lightningSprite = display.newSprite(lightningSheet, sequenceData)
    lightningSprite.x = display.contentWidth/2
    lightningSprite.y = display.contentHeight/4

local function closeDoor()
            indTapped = true
            doorClosed:removeSelf()
            --changePage()
            nextClosure()
            --composer.gotoScene( "scenes.textPage", overlayOptions )
    end

local function beginAnimations()
    if movedPage == false then
        transition.to(niceHouse, {alpha=0, time=1500})
        transition.to(clouds, { time=40000, x=-3000 } )
        lightningSprite:play()
        return true
        end
end

   function animateForest()
       if movedPage == false then
        transition.to(forestR, { time=5000, x=display.contentWidth+150 } )
        transition.to(forestL, { time=5000, x=-230 } )
        timer.performWithDelay(6000, beginAnimations)
        return true
        end
   end
   
   function playRainSounds()
        audio.play(sfx.rainSound, {loops=-1, channel = 2})
    end
        
    rain.new(group, {})    
    
    sceneGroup:insert(backgroundOne)
    sceneGroup:insert(clouds)
    sceneGroup:insert(house)
    sceneGroup:insert(doorClosed)
    sceneGroup:insert(lightningSprite)
    sceneGroup:insert(niceHouse)
    sceneGroup:insert(group)
    sceneGroup:insert(forestL)
    sceneGroup:insert(forestR)
    sceneGroup:insert(tapIndicator)
    sceneGroup:insert(previousBtn)
           
doorClosed:addEventListener("tap", closeDoor)
--snapshot:addEventListener( "touch", listener )
--Runtime:addEventListener("enterFrame", screenWideEffect)
end

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------- 
-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
       
   elseif ( phase == "did" ) then
       
      print("scene1.2 did phase")    
       local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
        timer.performWithDelay(1000, animateForest)
        timer.performWithDelay(500, playRainSounds)
       local myClosure = function() return tapIndicatorFunc.pulsateFunction( tapIndicator ) end
     timer.performWithDelay(8000, myClosure, 1)
   end
end

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------- 
-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
    rain.pause()
   elseif ( phase == "did" ) then
       audio.stop(2)
       transition.cancel(scaleTrans)
       tapIndicator:removeSelf()
       tapIndicator = nil
   end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
 
-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view
   print("destroying scene1.2")
end

---------------------------------------------------------------------------------
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene



