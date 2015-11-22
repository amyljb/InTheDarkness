--FIND THE BEST WAY TO FIND NEXT PAGE - GO ONE TEXT SCENE - SCENE ONE - NEXT BUTTON LOADS OVERLAY - NEXT BUTTON ON OVERLAY LOADS NEXT SCENE

local composer = require("composer")
local nextSceneButton
local sceneName = "textScene"
local sceneNumber = "textPage"
local sceneData = require("loadData")
local widget = require( "widget" )
local BaseScene = require "BaseScene"
local current =  composer.getSceneName( "current" )
local nextSceneButton
local scene = composer.newScene(sceneName)
--local nextSceneNumber = sceneObject.nextScene

local options = {
    effect = "crossFade",
    time = 3000
}

-------------------------------------------------------------------------------
--CREATE SCENE
function scene:create( event )
    local sceneGroup = self.view
    
    local params = event.params.var1
    local nextScene = event.params.nextScene
    print(current)
    
--    Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {}
})

function exitOverlay()
    composer.gotoScene( nextScene, options )
    --composer.hideOverlay( "fade", 200 )
    composer.removeScene("textPage")
end

background = display.newImage("Images/darkness.png", true) --Images/page1Bk3.png
background.x = display.contentWidth/2
background.y = display.contentHeight/2

    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    overFile = "Images/nextBtnOver.png",
     x = display.contentWidth*0.95,
    y = display.contentHeight*0.85,
    onRelease = exitOverlay
}

sceneGroup:insert(background)
sceneGroup:insert(nextPgBtn)


function loadText(params)
    print(params)
    for i = 1, #params do
            local x = getXCoordinates(params[i].x)
            local y = getYCoordinates(params[i].y)
            local text = display.newText(params[i].value, x, y, 1600, 400, "MoonFlowerBold", params[i].fontSize) --native.systemFont
            text.align = "center"
            --text.width = 1500
            --text.height = 1500
            sceneGroup:insert(text)
        end
    end

    --    Track components on screen so that we can add them to the scene group
   -- for i = 1, #params do
    --    sceneGroup:insert(params[i])
   -- end
    
loadText(params)

--end of scene create
    end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--show scene
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    local sceneText = scene.text

    if phase == "will" then
        -- Called when the scene is off screen and is about to move on screen
    elseif phase == "did" then
    end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        -- Called when the scene is on screen and is about to move off screen
        --
        -- INSERT code here to pause the scene
        -- e.g. stop timers, stop animation, unload sounds, etc.)
    elseif phase == "did" then
    end 
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:destroy( event )
    local sceneGroup = self.view
end

-------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-------------------------------------------------------------------------------

return scene

