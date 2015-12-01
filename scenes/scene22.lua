--IN CAVE
local composer = require( "composer" )
local widget = require("widget")
local changePg = require("changePg")
local physics = require("physics")
local tapIndicatorFunc = require("modules.tapIndicatorFunc")
local sfx = require("modules.sfx")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local scene = composer.newScene("scene22")
local sceneName = "scene22"
local sceneNumber = 22
local nextSceneNumber = "scenes.scene23"
local previousScene = "scenes.scene21"
--local sneeze = audio.loadSound( "Sounds/sneezing.mp3" )
local dustSprite
local movedPage = false


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
physics.start()
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
        movedPage = true
        nextClosure()
    return true
end

local caveBkg = display.newImage( "Images/cave.png", true )
caveBkg.x=display.contentWidth/2
caveBkg.y=display.contentHeight/2

local cloud1 = display.newImage( "Images/cloud1.png", true )
cloud1.x=display.contentWidth/3
cloud1.y=display.contentHeight/2

local cloud2 = display.newImage( "Images/cloud2.png", true )
cloud2.x=display.contentWidth*0.3
cloud2.y=display.contentHeight/4

local cloud3 = display.newImage( "Images/cloud3.png", true )
cloud3.x=display.contentWidth/6
cloud3.y=display.contentHeight/2

local cloud4 = display.newImage( "Images/cloud4.png", true )
cloud4.x=display.contentWidth/4
cloud4.y=display.contentHeight*0.7

local cloud5 = display.newImage( "Images/cloud5.png", true )
cloud5.x=display.contentWidth/4
cloud5.y=display.contentHeight/4

local cloudHotspot = display.newCircle(display.contentWidth/4, display.contentHeight/2, 400)
cloudHotspot.alpha = 0.1

tapIndicator = display.newImage("Images/tapButton.png", true)
tapIndicator.x= display.contentWidth/4
tapIndicator.y= display.contentHeight/2
tapIndicator.alpha = 0

    local nextPgBtn = widget.newButton
{
    width = 150,
    height = 150,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.9,
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
    onRelease = previousClosure
}
previousBtn.rotation = -180

local sheetInfo = require("Sprites.dustCloud") 
local dustCloudSheet = graphics.newImageSheet( "Sprites/dustCloud.png", sheetInfo:getSheet() )
local sequenceData = {name="explode", start = 1, time = 1000, loopCount = 1, count=6}
    
local dustSprite = display.newSprite(dustCloudSheet, sequenceData)
      dustSprite.x = display.contentWidth*0.75
      dustSprite.y = display.contentHeight - display.contentHeight/3
      dustSprite.alpha=0
      
local sheetInfo2 = require("Sprites.underbedMons") 
local monsterSheet = graphics.newImageSheet( "Sprites/underbedMons.png", sheetInfo2:getSheet() )
local sequenceData2 = {
        {name="throw", start = 1, time = 500, loopCount = 1, frames = {1, 2, 3, 4, 5, 6}, count=7},
        {name="reverseThrow", time = 500, loopCount = 1, frames = {6, 5, 4, 3, 2, 1}}
        }
    
      monsterSprite = display.newSprite(monsterSheet, sequenceData2)
      monsterSprite.x = display.contentWidth*0.25
      monsterSprite.y = display.contentHeight/2
      
 local sheetInfo3 = require("Sprites.wobble") 
local wobbleSheet = graphics.newImageSheet( "Sprites/wobble.png", sheetInfo3:getSheet() )
local sequenceData3 = {name="wobble", start = 1, time = 600, loopCount = 3, count=4}
    
local wobbleSprite = display.newSprite(wobbleSheet, sequenceData3)
      wobbleSprite.x = display.contentWidth*0.8
      wobbleSprite.y = display.contentHeight*0.6
    
    physics.addBody(wobbleSprite, "kinematic", {bounce = 0})

function moveClouds()
    print("hotspot tapped")
    transition.to( cloud1, {time=4000, x =-display.contentWidth, onComplete= function(self) self.parent:remove(self); self = nil; end} )  
    transition.to( cloud2, {time=4000, x =-display.contentWidth, onComplete= function(self) self.parent:remove(self); self = nil; end} )  
    transition.to( cloud3, {time=5000, x =display.contentWidth*1.5, onComplete= function(self) self.parent:remove(self); self = nil; end} )  
    transition.to( cloud4, {time=4000, x =-display.contentWidth, onComplete= function(self) self.parent:remove(self); self = nil; end} )  
    transition.to( cloud5, {time=3000, x =display.contentWidth*1.5, onComplete= function(self) self.parent:remove(self); self = nil; end} )
    cloudHotspot:removeSelf()
    monsterSprite:play()
    timer.performWithDelay(3000, reverseSequence, 5)
end

function reverseSequence()
    if movedPage == false then
    print("reversing")
    monsterSprite:setSequence( "reverseThrow" )
    monsterSprite:play()
    timer.performWithDelay(500, loadDustballs)
    end
end

--detect collision - play dust explosion sprite
function onCollision(event)
    if event.phase == "began" then
    wobbleSprite:play()
    print("collided!!")
    print(event.phase)
    dustBall.alpha = 0
    dustSprite.alpha = 1
    dustSprite:play()
    audio.play(sfx.sneeze)
    end
end

function loadDustballs()
    if movedPage == false then
        dustBall = display.newImage("Images/fuzzBall.png")
        dustBall.x = monsterSprite.x
        dustBall.y = display.contentHeight/3
        physics.addBody(dustBall, "dynamic", {bounce = 0})
        dustBall.name = "dustBall"
        dustBall.isBullet = true
        dustBallGroup = display.newGroup()
        dustBallGroup:insert(dustBall)
    -- When the movement is complete, it will remove itself: the onComplete event
    -- creates a function to store information about this dustball and then remove it.
    transition.to(dustBall, {time = 2000, x= display.contentWidth, y = display.contentHeight/2, onComplete = function(self) self.parent:remove(self); self = nil; end})
    end
end

sceneGroup:insert(caveBkg)
sceneGroup:insert(monsterSprite)
sceneGroup:insert(cloud1)
sceneGroup:insert(cloud2)
sceneGroup:insert(cloud3)
sceneGroup:insert(cloud4)
sceneGroup:insert(cloud5)
sceneGroup:insert(wobbleSprite)
sceneGroup:insert(dustSprite) 
sceneGroup:insert(cloudHotspot) 
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(tapIndicator)
sceneGroup:insert(previousBtn)

--freddie:addEventListener("touch", touchFreddie)
cloudHotspot:addEventListener("tap", moveClouds)
Runtime:addEventListener( "collision", onCollision )


end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- timer.performWithDelay(2000, loadDustballs, 10)
      
      local myClosure = function() return tapIndicatorFunc.pulsateFunction( tapIndicator ) end
        timer.performWithDelay(1000, myClosure, 1)
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




