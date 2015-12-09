--negative thoughts
local composer = require( "composer" )
local widget = require( "widget" )
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local changePg = require("changePg")
local sceneName = "scene7"
local scene = composer.newScene("scene7")
local sceneNumber = 7
local nextSceneNumber = "scenes.scene8"
local previousScene = "scenes.scene6"

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

local function changePage()
        print("changing pg")
        nextClosure()
    return true
end
    --setup images
    local background = display.newImage("Images/page6.png", true)
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2
    
    --setup sprite sheet
    local sheetInfo = require("Sprites.thoughtBubble")
    local bubbleSheet1 = graphics.newImageSheet( "Sprites/thoughtBubble.png", sheetInfo:getSheet() )
    local sequenceData =
    {name="bubble", start = 1, time = 2500, loopCount = 1, count=5}  
    
    bubbleSprite = display.newSprite(bubbleSheet1, sequenceData)
    bubbleSprite.x = display.contentWidth/2
    bubbleSprite.y = display.contentHeight/4
    bubbleSprite.alpha=0
    
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

--play sprite
function playBubble()
    bubbleSprite.alpha=1
    bubbleSprite:play()
end
--bob sprite
function bobAgain()
   bobTrans= transition.to(bubbleSprite, {time = 500, y = display.contentHeight/4, onComplete = bobFunction})
end

function bobFunction()
     bobTrans = transition.to(bubbleSprite, {time = 500, y = (display.contentHeight/4)-10, onComplete = bobAgain})
end
    
 --insert scene elements into sceneGroup
    sceneGroup:insert(background)
    sceneGroup:insert(bubbleSprite)
    sceneGroup:insert(nextPgBtn)
    sceneGroup:insert(previousBtn)   
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
            timer.performWithDelay(1000, playBubble)
            timer.performWithDelay(2000, bobFunction)
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
   elseif ( phase == "did" ) then
       transition.cancel(scaleTrans)
       transition.cancel(bobTrans)
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

