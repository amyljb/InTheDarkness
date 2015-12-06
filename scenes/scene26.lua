local composer = require( "composer" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local widget = require("widget")
local scene = composer.newScene("scene26")
local sceneName = "scene26"
local sceneNumber = 26
local nextSceneNumber = "scenes.scene26"
local previousScene = "scenes.scene25"

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})

--options table for next page transitions
local pageChangeOptions = {
    effect = "fade",
    time = 6000
}
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

local freddieBed = display.newImage( "Images/freddieBed.png", true )
freddieBed.x=display.contentWidth/2
freddieBed.y=display.contentHeight/2

local torch = display.newImage( "Images/flashlight.png", true )
torch.x=display.contentWidth*0.75
torch.y=display.contentHeight*0.6
torch.rotation = 120

local blackOut = display.newImage( "Images/blackOut.png", true )
blackOut.x=display.contentWidth/2
blackOut.y=display.contentHeight/2
blackOut.alpha=0

local endText = display.newImage( "Images/endText.png", true )
endText.x=display.contentWidth/2
endText.y=display.contentHeight/2
endText.alpha=0

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

sceneGroup:insert(freddieBed)
sceneGroup:insert(torch)
sceneGroup:insert(blackOut)
sceneGroup:insert(endText)
sceneGroup:insert(previousBtn)

function returnMenu()
    composer.gotoScene( "scenes.menu", pageChangeOptions )
end

function endTextDisplay()
     transition.to(endText, {alpha=1, time=2000, onComplete=returnMenu})
end

function fadeOut(event)
    if event.phase == "began" and event.time >= 2000 then
        transition.to(freddieBed, {alpha=0, time=2000})
        transition.to(torch, {alpha=0, time=2000})
        transition.to(blackOut, {alpha=1, time=2000, onComplete=endTextDisplay})
        end
    end
torch:addEventListener("touch", fadeOut)
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





