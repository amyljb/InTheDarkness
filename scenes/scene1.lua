
local sceneName = "scene1"
local composer = require( "composer" )
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local scene = composer.newScene( "scene1" )
local sfx = require("modules.sfx")
local widget = require( "widget" )
local nextSceneButton
local sceneName = "textScene"
local sceneNumber = 1
local nextSceneNumber = "scenes.scene2"
local nextSceneButton
local scene = composer.newScene(sceneName)

local textOptions = {
   text = "This is Freddie.",
   x = display.contentWidth/2,
   y = display.contentHeight*0.8,
   fontSize = 72,
   width = 1800,
   font = "MoonFlowerBold",
   height = 0,
   align = "center"
}

--    Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})

-------------------------------------------------------------------------------
--CREATE SCENE
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
    
backgroundOne = display.newImage("Images/darkness.png", true) 
backgroundOne.x = display.contentWidth/2
backgroundOne.y = display.contentHeight/2 -- - 770

freddie = display.newImage("Images/freddie.png", true) 
freddie.x = display.contentWidth/2
freddie.y = display.contentHeight/2 
freddie.alpha=0

function loadOverlay()
   composer.gotoScene("scenes.textPage", overlayOptions )
end

    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    overFile = "Images/nextBtnOver.png",
    onRelease = loadOverlay
}

nextPgBtn.x = display.contentWidth*0.95
nextPgBtn.y = display.contentHeight*0.85

local pageText = display.newText( textOptions )
pageText:setFillColor( 1, 1, 1 )
pageText.alpha=0

local function textFunc()
         pageText.text = "Freddie is the kind of boy that gets scared very easily.\n Sometimes, he gets so frightened that he imagines things that aren't really there."
end 

function loadText()
    transition.to(pageText, {alpha =1, time = 100})
    timer.performWithDelay(4000, textFunc)
end

function loadFreddie()
    transition.to(freddie, {alpha =1, time = 10})
    audio.play(sfx.ping)
end  

    --insert display objects into sceneGroup
    sceneGroup:insert(backgroundOne)
    sceneGroup:insert(freddie)
    sceneGroup:insert(pageText)
    sceneGroup:insert(nextPgBtn)
     
--end of scene create
    end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--show scene
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is off screen and is about to move on screen
    elseif phase == "did" then
        timer.performWithDelay(1000, loadText)
        timer.performWithDelay(2000, loadFreddie)
         local previous =  composer.getSceneName( "previous" )
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
        print("hiding scene1")-- Called when the scene is now off screen
    end 
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:destroy( event )
    local sceneGroup = self.view
    print("destroying scene1")
end

-------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-------------------------------------------------------------------------------

return scene

