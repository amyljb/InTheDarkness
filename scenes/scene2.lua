--HOUSE IMAGE
local composer = require( "composer" )
local tapIndicatorFunc = require("tapIndicatorFunc")
local rubPrompt = require("rubOutPrompt")
local scene = composer.newScene()
local sceneName = "scene2"
local tapIndicator
local indTapped = false
local xSpeed = .1
local ySpeed = -.15
local nextTapped = false
local rain = require("rain")
local rainSound = audio.loadStream("Sounds/rain.wav")
local sceneNumber = 2
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local current =  composer.getSceneName( "current" )
local nextSceneNumber = "scenes.scene3"

--options table for next page transitions
local pageChangeOptions = {
    effect = "fade",
    time = 3000
}

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
       --    Initialize the scene
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
    group = display.newGroup()
  
    local snapshot = display.newSnapshot(2048, 1536)
    snapshot:translate( display.contentCenterX, display.contentCenterY )
    
    local niceHouse = display.newImage("Images/niceHouse.png", true)
  --  niceHouse.x = display.contentWidth/2
   -- niceHouse.y = display.contentHeight/2
    
   local backgroundOne = display.newImage("Images/page2.png", true)
    backgroundOne.x = display.contentWidth/2
    backgroundOne.y = display.contentHeight/2
    
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
    
    tapIndicator = display.newImage("Images/tapButton.png", true)
    tapIndicator.x= display.contentWidth/2 - 250
    tapIndicator.y= display.contentHeight/2 + 125
    tapIndicator.alpha = 0
    
    local myText = display.newImage("Images/textBk2.png", true)
    myText.x= display.contentWidth/2 
    myText.y= display.contentHeight-125
    myText.alpha = 0
    
  local sheetInfo = require("Sprites.lightning1")
   local lightningSheet = graphics.newImageSheet( "Sprites/lightning1.png", sheetInfo:getSheet() )
   local sequenceData =
   {name="striking", start = 1, time = 500, loopCount = 0, count=2}  
   
    lightningSprite = display.newSprite(lightningSheet, sequenceData)
    lightningSprite.x = display.contentWidth/2
    lightningSprite.y = display.contentHeight/4

    snapshot.canvas:insert(niceHouse)
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
       
    function closeDoor()
            indTapped = true
            doorClosed:removeSelf()
            nextTapped = true
            composer.gotoScene( "scenes.textPage", overlayOptions )
    end

   function beginAnimations()
        transition.to(clouds, { time=40000, x=-3000 } )
        transition.to(forestR, { time=5000, x=display.contentWidth+150 } )
        transition.to(forestL, { time=5000, x=-230 } )
        transition.to(myText, { alpha=1, time = 15000 } )
        lightningSprite:play()
        return true
   end
   
   function playRainSounds()
        audio.play(rainSound, {loops=-1})
    end
        
    rain.new(group, {})    
    
    sceneGroup:insert(backgroundOne)
    sceneGroup:insert(clouds)
    sceneGroup:insert(house)
    sceneGroup:insert(doorClosed)
    sceneGroup:insert(lightningSprite)
    sceneGroup:insert(snapshot)
    sceneGroup:insert(group)
    sceneGroup:insert(forestL)
    sceneGroup:insert(forestR)
    sceneGroup:insert(tapIndicator)
    sceneGroup:insert(myText)
   
    
         
doorClosed:addEventListener("tap", closeDoor)
snapshot:addEventListener( "touch", listener )
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
       timer.performWithDelay(800, beginAnimations)
       timer.performWithDelay(500, playRainSounds)
       local myClosure = function() return tapIndicatorFunc.pulsateFunction( tapIndicator ) end
     timer.performWithDelay(15000, myClosure, 1)
     local rubOutClosure = function() return rubPrompt.rubOutIndicator(nextTapped) end
     timer.performWithDelay(10000, rubOutClosure, 1)
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
    audio.stop()
   elseif ( phase == "did" ) then
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



