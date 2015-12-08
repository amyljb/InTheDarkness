local composer = require( "composer" )
local scene = composer.newScene( "chapterMenu" )
local widget = require("widget")

local pageChangeOptions = {
    effect = "fade",
    time = 500
}

-- Options table for the overlay scene "overlay.lua"
local overlayOptions = {
   isModal = true,
   effect = "crossFade",
   time = 400
}

local function changePage( event )
    if event.phase == "ended" then
        if event.target.id == "soundStory" then
            composer.gotoScene( "scenes.scene6", pageChangeOptions ) 
                else if event.target.id == "monsterStory" then
                    composer.gotoScene( "scenes.scene11", pageChangeOptions ) 
                    else if event.target.id == "underbedStory" then
                        composer.gotoScene( "scenes.scene19", pageChangeOptions ) 
                        else if event.target.id == "previous" then
                            composer.gotoScene( "scenes.menu", pageChangeOptions ) 
                        end
                    end
                end
        end
    return true
end
end
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
   local sceneGroup = self.view

local menuBackground = display.newImage("Images/menuBkg.png", true)
menuBackground.x = display.contentWidth/2
menuBackground.y = display.contentHeight/2

   local soundStory = widget.newButton
{
    width = 600,
    height = 850,
    id ="soundStory",
    defaultFile = "Images/soundChapter.png",
    overFile = "Images/soundsBtnOn.png",
    x = display.contentWidth/2-650,
    y = display.contentHeight/2,
    onRelease = changePage
}
   local monsterStory = widget.newButton
{
    width = 600,
    height = 850,
    id ="monsterStory",
    defaultFile = "Images/monstersBtn.png",
    overFile = "Images/monstersOn.png",
    x = display.contentWidth/2,
    y = display.contentHeight/2,
    onRelease = changePage
}
   local underbedStory = widget.newButton
{
    width = 600,
    height = 850,
    id ="underbedStory",
    defaultFile = "Images/bedStory.png",
    overFile = "Images/underbedOn.png",
    x = display.contentWidth/2+ 650,
    y = display.contentHeight/2,
    onRelease = changePage
}

    local previousBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="previous",
    defaultFile = "Images/nextBtn.png",
    overFile = "Images/nextBtnOver.png",
    x = display.contentWidth*0.9,
    y = display.contentHeight*0.85,
    onRelease = changePage
}
previousBtn.rotation = -180

--timer.performWithDelay(1500, loadOverlay)

    sceneGroup:insert(menuBackground)
    sceneGroup:insert(soundStory)
    sceneGroup:insert(monsterStory)
    sceneGroup:insert(underbedStory)
    sceneGroup:insert(previousBtn)
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

