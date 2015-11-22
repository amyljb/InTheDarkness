--SYMPTOMS?
local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene("scene10")
local sceneName = "scene10"
local sceneNumber = 10
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene11"

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
   
local background = display.newImage("Images/page9.png", true)
background.x = display.contentWidth/2
background.y = display.contentHeight/2

local sheetInfo = require("Sprites.heartbeat")
    local heartbeatSheet = graphics.newImageSheet( "Images/heartbeat.png", sheetInfo:getSheet() )

    local sequenceData =
    {name="beating", start = 1, time = 600, loopCount = 0, count=17}
    
heartbeatSprite = display.newSprite(heartbeatSheet, sequenceData)
heartbeatSprite.x = display.contentWidth/2 + 750
heartbeatSprite.y = display.contentHeight/2 - 400
        
function loadOverlay()
composer.showOverlay( "scenes.overlay", overlayOptions1 )
end

-- swipe handler function 
        function changePage()
            composer.gotoScene( "scenes.textPage", overlayOptions2 )
        return true
    end

local infoButton = widget.newButton
{
    width = 190,
    height = 190,
    id ="gate",
    defaultFile = "Images/infoButton.png",
    x = 175,
    y = 225,
    onRelease = loadOverlay
}

     local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    x = 1950,
    y = display.contentHeight/2,
    onRelease = changePage,
}

    
sceneGroup:insert(background)
sceneGroup:insert(infoButton)    
sceneGroup:insert(heartbeatSprite)
sceneGroup:insert(nextPgBtn)
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
       heartbeatSprite:pause()
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
     
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

