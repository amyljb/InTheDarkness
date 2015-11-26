--GAME INSTRUCTIONS
local composer = require( "composer" )
local widget = require( "widget" )
local sceneName = "gameInstructions"
local scene = composer.newScene("gameInstructions")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    
--local function changePage()
 --       print("changing pg")
   --     composer.gotoScene( "scenes.textPage", overlayOptions )
  --  return true
--end

    local background = display.newImage("Images/puckInstructions.png", true)
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2
    
    sceneGroup:insert(background)
    
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


