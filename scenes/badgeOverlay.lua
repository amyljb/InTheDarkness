local composer = require( "composer" )

local scene = composer.newScene()
local widget = require("widget")

--options table for next page transitions
local pageChangeOptions = {
    effect = "fromRight",
    time = 3000
}

function exitOverlay()
        composer.hideOverlay( "fade", 200 )
         local previous =  composer.getSceneName( "previous" )
            if previous == "scene23" then
                composer.gotoScene( "scenes.scene23") 
            else if previous == "scene25" then
                composer.gotoScene( "scenes.scene25") 
            end
            end
end


-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   local badge = display.newImage("Images/badge.png", true)
    badge.x = display.contentWidth/2
    badge.y = display.contentHeight/2
    
    local sheetInfo = require("Sprites.littleMonster")
        local monsterSheet = graphics.newImageSheet( "Sprites/littleMonster.png", sheetInfo:getSheet() )
        local sequenceData =
            {name="dancing", start = 1, time = 1000, loopCount = 0, count=10}  
            monsterSprite = display.newSprite( monsterSheet, sequenceData)
            monsterSprite.x = display.contentWidth/2 
            monsterSprite.y = display.contentHeight/2.3
            monsterSprite:play()
    
    local exitButton = widget.newButton
{
    width = 150,
    height = 150,
    id ="exit",
    defaultFile = "Images/exitButton.png",
    x = display.contentWidth*0.65,
    y = display.contentWidth/4,
    onRelease = exitOverlay
}

sceneGroup:insert(badge)
sceneGroup:insert(exitButton)
sceneGroup:insert(monsterSprite)
end


-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
       
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



