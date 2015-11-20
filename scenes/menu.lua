local composer = require( "composer" )
local scene = composer.newScene()
local scene = composer.newScene( "menu" )
local widget = require("widget")

local pageChangeOptions = {
    effect = "fade",
    time = 1000
}

-- Options table for the overlay scene "overlay.lua"
local overlayOptions = {
   isModal = true,
   effect = "crossFade",
   time = 400
}

local function changePage( event )
    if event.phase == "ended" then
        if event.target.id == "playFull" then
            composer.gotoScene( "scenes.scene1", pageChangeOptions ) 
                else if event.target.id == "soundStory" then
                    composer.gotoScene( "scenes.scene6", pageChangeOptions ) 
                else if event.target.id == "monstersStory" then
                    composer.gotoScene( "scenes.scene10", pageChangeOptions )
                else
                    composer.gotoScene( "scenes.scene21", pageChangeOptions )
                    end
                end 
        end
    end
return true
end
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
   local sceneGroup = self.view
   local menuBackground = display.newImage("Images/menuBkg.png", true)
   menuBackground.x = display.contentWidth/2
    menuBackground.y = display.contentHeight/2

   local playFullBtn = widget.newButton
{
    width = 1500,
    height = 400,
    id ="playFull",
    defaultFile = "Images/fullStoryBtn.png",
    x = display.contentWidth/2,
    y = display.contentHeight/2 - 450,
    onRelease = changePage
}

   local soundStory = widget.newButton
{
    width = 580,
    height = 580,
    id ="soundStory",
    defaultFile = "Images/storyButton.png",
    x = display.contentWidth/2-650,
    y = display.contentHeight*0.6,
    onRelease = changePage
}
   local monstersStory = widget.newButton
{
    width = 580,
    height = 580,
    id ="monstersStory",
    defaultFile = "Images/storyButton.png",
    x = display.contentWidth/2,
    y = display.contentHeight*0.6,
    onRelease = changePage
}
   local underbedStory = widget.newButton
{
    width = 580,
    height = 580,
    id ="underbedStory",
    defaultFile = "Images/storyButton.png",
    x = display.contentWidth/2+ 650,
    y = display.contentHeight*0.6,
    onRelease = changePage
}

function loadOverlay()
composer.showOverlay( "scenes.menuOverlay", overlayOptions )
end

--timer.performWithDelay(1500, loadOverlay)



   sceneGroup:insert(menuBackground)
   sceneGroup:insert(playFullBtn)
   sceneGroup:insert(soundStory)
   sceneGroup:insert(monstersStory)
   sceneGroup:insert(underbedStory)
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
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

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

---------------------------------------------------------------------------------

return scene

