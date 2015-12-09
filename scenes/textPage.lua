--THIS SCENE ACTS AS A TEMPLATE FOR THE TEXT SCENES

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
local previous =  composer.getSceneName( "previous" )


local options = {
    effect = "crossFade",
    time = 1500
}

-------------------------------------------------------------------------------
--CREATE SCENE
function scene:create( event )
    local sceneGroup = self.view
    --gets params set from previous scene, text data and scene number 
    local params = event.params.var1
    local nextScene = event.params.nextScene
    
function exitOverlay()
    --goes to next scene
    composer.gotoScene( nextScene, options )
    composer.removeScene("textPage")
end

function loadPrevious()
    composer.gotoScene( previous, options )
    composer.removeScene("textPage")
end

--background image
background = display.newImage("Images/darkness.png", true) --Images/page1Bk3.png
background.x = display.contentWidth/2
background.y = display.contentHeight/2

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
    onRelease = exitOverlay
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
    onRelease = loadPrevious
}
previousBtn.rotation = -180

--add elements to scene group
sceneGroup:insert(background)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(previousBtn)

--gets params and creates text objects, loads custom font
function loadText(params)
    print(params)
    for i = 1, #params do
            local x = getXCoordinates(params[i].x)
            local y = getYCoordinates(params[i].y)
            local text = display.newText(params[i].value, x, y, 1600, 500, "MoonFlowerBold", params[i].fontSize) --native.systemFont
            text.align = "center"
            sceneGroup:insert(text)
        end
    end
    
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

    elseif phase == "did" then
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
    end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then

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

