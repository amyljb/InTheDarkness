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
                else if event.target.id == "playChapters" then
                    composer.gotoScene( "scenes.chapterMenu", pageChangeOptions ) 
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
       composer.gotoScene("scenes.scene16", pageChangeOptions)
       -- composer.showOverlay( "scenes.menuOverlay", overlayOptions )
    end

local menuBackground = display.newImage("Images/menuBkg.png", true)
menuBackground.x = display.contentWidth/2
menuBackground.y = display.contentHeight/2

local menuLight = display.newImage("Images/menuLight.png", true)
menuLight.x = display.contentWidth/2
menuLight.y = display.contentHeight/2
    

   local playFullBtn = widget.newButton
{
    width = 1500,
    height = 400,
    id ="playFull",
    defaultFile = "Images/fullStoryBtn.png",
    x = display.contentWidth/2,
    y = display.contentHeight/3,
    onRelease = changePage
}

   local chapterBtn = widget.newButton
{
    width = 1500,
    height = 400,
    id ="playChapters",
    defaultFile = "Images/chapterBtn.png",
    x = display.contentWidth/2,
    y = display.contentHeight*0.6,
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
    sceneGroup:insert(menuBackground)
    sceneGroup:insert(playFullBtn)
    sceneGroup:insert(chapterBtn)
    sceneGroup:insert(helpBtn)
    sceneGroup:insert(menuLight)
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

