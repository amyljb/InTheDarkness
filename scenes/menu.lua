local composer = require( "composer" )
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
                    composer.gotoScene( "scenes.scene11", pageChangeOptions )
                else
                    composer.gotoScene( "scenes.scene19", pageChangeOptions )
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
   
   local function loadOverlay()
       composer.gotoScene("scenes.scene8", pageChangeOptions)
       -- composer.showOverlay( "scenes.menuOverlay", overlayOptions )
    end

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
    y = display.contentHeight/6,
    onRelease = changePage
}

   local helpBtn = widget.newButton
{
    width = 190,
    height = 190,
    id ="playHelp",
    defaultFile = "Images/menuHelp.png",
    x = display.contentWidth*0.94,
    y = display.contentHeight/9,
    onRelease = loadOverlay
}

   local soundStory = widget.newButton
{
    width = 600,
    height = 850,
    id ="soundStory",
    defaultFile = "Images/soundChapter.png",
    x = display.contentWidth/2-650,
    y = display.contentHeight*0.7,
    onRelease = changePage
}
   local monstersStory = widget.newButton
{
    width = 600,
    height = 850,
    id ="monstersStory",
    defaultFile = "Images/monstersBtn.png",
    x = display.contentWidth/2,
    y = display.contentHeight*0.7,
    onRelease = changePage
}
   local underbedStory = widget.newButton
{
    width = 600,
    height = 850,
    id ="underbedStory",
    defaultFile = "Images/bedStory.png",
    x = display.contentWidth/2+ 650,
    y = display.contentHeight*0.7,
    onRelease = changePage
}

--timer.performWithDelay(1500, loadOverlay)

   sceneGroup:insert(menuBackground)
   sceneGroup:insert(playFullBtn)
   sceneGroup:insert(soundStory)
   sceneGroup:insert(monstersStory)
   sceneGroup:insert(underbedStory)
    sceneGroup:insert(helpBtn)
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

