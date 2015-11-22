local composer = require( "composer" )

local scene = composer.newScene()
local widget = require("widget")

--options table for next page transitions
local pageChangeOptions = {
    effect = "fromRight",
    time = 3000
}

function exitOverlay()
    -- By some method (a "resume" button, for example), hide the overlay
        composer.hideOverlay( "fade", 200 )
       -- composer.removeScene("overlay")
        composer.gotoScene( "scenes.scene23")
        --sceneGroup:removeSelf()
        --sceneGroup=nil
end


-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   local background = display.newImage("Images/spiderInstructions.png", true)
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2
    
    local exitButton = widget.newButton
{
    width = 190,
    height = 190,
    id ="exit",
    defaultFile = "Images/exitButton.png",
    x = 1900,
    y = 150,
    onRelease = exitOverlay
}
sceneGroup:insert(background)
sceneGroup:insert(exitButton)
end


-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase
   local sceneGroup = self.view
   local phase = event.phase
   local parent = event.parent 

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view
   

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
scene:addEventListener( "hide", scene )
---------------------------------------------------------------------------------

return scene



