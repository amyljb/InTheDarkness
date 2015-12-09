local composer = require( "composer" )

local scene = composer.newScene()
local widget = require("widget")

--options table for next page transitions
local pageChangeOptions = {
    effect = "crossFade",
    time = 3000
}

function exitOverlay()
    -- hide the overlay
        composer.hideOverlay( "fade", 200 )
        composer.removeScene("overlay")
        composer.gotoScene( "scenes.menu")

end

-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   local background = display.newImage("Images/InteractionsInstruct.png", true)
    background.x = display.contentWidth/2
    background.y = display.contentHeight/2
    
    local exitButton = widget.newButton
{
    width = 200,
    height = 200,
    id ="exit",
    defaultFile = "Images/exitButton2.png",
    x = 1620,
    y = 320,
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
scene:addEventListener( "hide", scene )
---------------------------------------------------------------------------------

return scene



