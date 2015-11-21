--FREDDIE COLD - bridging scene
--change or add game
local composer = require( "composer" )
local scene = composer.newScene("scene14")
local sceneName = "scene14"
local sceneNumber = 14
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene15"
local widget = require("widget")

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

local function changePage()
        composer.gotoScene( "scenes.textPage", overlayOptions )
    return true
end

freddieCold = display.newImage( "Images/freddieCold.png", true )
freddieCold.x=display.contentWidth/2
freddieCold.y=display.contentHeight/2
local breath = display.newImage( "Images/breath.png" )
breath.x=display.contentWidth/2
breath.y=display.contentHeight/2
breath.alpha = 0
local pageText = display.newImage( "Images/coldText.png" )
pageText.x=display.contentWidth/2
pageText.y=display.contentHeight - 125
    
    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    onRelease = changePage
}

nextPgBtn.x = 1950
nextPgBtn.y = display.contentHeight/2

sceneGroup:insert(freddieCold)
sceneGroup:insert(breath)
sceneGroup:insert(pageText)
sceneGroup:insert(nextPgBtn)

function changeAlpha()
   transition.to(breath, {alpha=1, time = 5000})
end

end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       timer.performWithDelay(1000, changeAlpha)
       
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

