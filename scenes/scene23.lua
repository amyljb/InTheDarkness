--DUST BALLS
local composer = require( "composer" )
local scene = composer.newScene("scene23")
local widget = require("widget")
local sceneName = "scene23"
local sceneNumber = 23
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene24"
local movedPage = false
local dustballTapped = false
local numTapped = 0
Random = math.random

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})

--options table for next page transitions
local pageChangeOptions = {
    effect = "crossFade",
    time = 3000
}

-- Options table for the overlay scene "badgeOverlay.lua"
local overlayOptions = {
   isModal = true,
   effect = "crossFade",
   time = 400
}
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
local sceneGroup = self.view

    --Initialize the scene
    local sceneComponents = sceneObject:getText()
    
local overlayOptions2 =
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
    movedPage = true
    composer.gotoScene( "scenes.textPage", overlayOptions2 )
    return true
end

local dustBkg = display.newImage( "Images/dustBkg.png", true )
dustBkg.x=display.contentWidth/2
dustBkg.y=display.contentHeight/2

local myText = display.newText( "0", 1885, 150, native.systemFont, 150 )
myText:setFillColor( 0, 0, 0 )

local instructions = display.newImage("Images/dustInstructions.png", true)
    instructions.x = display.contentWidth/2
    instructions.y = display.contentHeight/2
    instructions.alpha=0

    local nextPgBtn = widget.newButton
{
    width = 150,
    height = 150,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.9,
    onRelease = changePage
}
  
function textDelete()
   instructions.alpha = 0
   instructions:removeSelf()
   timer.performWithDelay(2000, generateDustballs, 15)
end   

function scaleDown()
    transition.scaleTo( instructions, { xScale=1.0, yScale=1.0, time=2000, onComplete=textDelete } )    
end    

function playInstructions()
    instructions.alpha = 1
    transition.scaleTo( instructions, { xScale=1.1, yScale=1.1, time=2000, onComplete=scaleDown}) 
end 

local sheetInfo = require("Sprites.dustExplosion")
local explosionSheet = graphics.newImageSheet( "Sprites/dustExplosion.png", sheetInfo:getSheet() )
 local sequenceData = 
    {name="explode", start = 1, time = 1000, loopCount = 1, count=12}
    explosionSprite = display.newSprite(explosionSheet, sequenceData)

function splatDustball(dustBall)
    if movedPage == false then
        print("splat")
        dustBall.alpha=0
        local splat = display.newImage("Images/splat2.png", true)
        splat.x = dustBall.x
        splat.y = dustBall.y
        sceneGroup:insert(splat) 
        return splat 
    end
end

function checkTaps()
    if numTapped == 10 then
        print("loading overlay")
        composer.showOverlay( "scenes.badgeOverlay", overlayOptions )
    end
end

function removeDustball(event)
    explosionSprite.x = event.target.x
    explosionSprite.y = event.target.y
    sceneGroup:insert(explosionSprite)
    explosionSprite:play()
    numTapped = numTapped + 1
    myText.text = numTapped
    checkTaps()
    event.target:removeSelf()
    event.target = nil
    return explosionSprite
end

function generateDustballs()
      if movedPage == false and numTapped < 10 then
        dustBall = display.newImage("Images/fuzzBall.png")
        dustBall.x =  Random(100, display.contentWidth-200)
        dustBall.y = Random(100, display.contentHeight-200)
        sceneGroup:insert(dustBall)
        dustBall:addEventListener("tap", removeDustball)
        transition.to(dustBall, {time = 1000, xScale=2.5, yScale = 2.5, onComplete = function(dustBall) splatDustball(dustBall) end})
        return dustBall
    end
end

sceneGroup:insert(dustBkg)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(myText)
end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       timer.performWithDelay(1000, playInstructions)
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






