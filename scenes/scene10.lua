--BRAIN
local composer = require( "composer" )
local widget = require("widget")
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene11"
local tapIndicatorFunc = require("modules.tapIndicatorFunc")
local scene = composer.newScene("scene10")
local sceneName = "scene10"
local sceneNumber = 10
local previousScene = "scenes.scene9"

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})

--Options table for the overlay scene "overlay.lua"
local overlayOptions1 = {
   isModal = true,
   effect = "crossFade",
   time = 400
}

--options table for next page transitions
local pageChangeOptions = {
    effect = "crossFade",
    time = 3000
}
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
local sceneGroup = self.view
   
    --Initialize the scene
    local sceneComponents = sceneObject:getText()
    
local overlayOptions2 =
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
local nextClosure = function() return changePg.loadNext( overlayOptions2, movedPage ) end  

local background = display.newImage("Images/page9.png", true)
background.x = display.contentWidth/2
background.y = display.contentHeight/2

local brain = display.newImage("Images/brain.png", true)
brain.x = display.contentWidth/4
brain.y = display.contentHeight/3.6

tapIndicator = display.newImage("Images/tapButton.png", true)
tapIndicator.x= display.contentWidth/4
tapIndicator.y= display.contentHeight/3.6
tapIndicator.alpha = 0


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
        
function loadOverlay()
composer.showOverlay( "scenes.brainOverlay", overlayOptions1 )
end

-- swipe handler function 
        function changePage()
            composer.gotoScene( "scenes.textPage", overlayOptions2 )
        return true
    end

     local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.85,
    onRelease = changePage,
}
    
sceneGroup:insert(background)   
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(brain)
sceneGroup:insert(tapIndicator)
sceneGroup:insert(previousBtn)

brain:addEventListener("tap", loadOverlay)
--event listeners

  --  function removeEventListeners9()  
    --    background:removeEventListener("touch", tapHandler)
    --end
end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       local myClosure = function() return tapIndicatorFunc.pulsateFunction( tapIndicator ) end
        timer.performWithDelay(2000, myClosure, 1)
       local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
        --heartbeatSprite:play()
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
   elseif ( phase == "did" ) then
       transition.cancel(scaleTrans)
   --    tapIndicator:removeSelf()
    --   tapIndicator = nil
     
   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view
   --removeEventListeners9()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene

