--COBWEB PAGE
local composer = require( "composer" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local widget = require("widget")
local rubPrompt = require("rubOutPrompt")
local scene = composer.newScene("scene21")
local sceneName = "scene21"
local sceneNumber = 21
local nextSceneNumber = "scenes.scene22"
local previousScene = "scenes.scene20"
local nextTapped = false
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

local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions2, movedPage ) end  

local function changePage( )
    nextTapped = true
    nextClosure()
    return true
end

local bkg = display.newImage("Images/spiderweb.png", true)
bkg.x = display.contentWidth/2
bkg.y = display.contentHeight/2

local instructions = display.newImage("Images/spiderInstructions.png", true)
instructions.x = display.contentWidth/2
instructions.y = display.contentHeight/2
instructions.alpha=0
    
local myText = display.newText( "0", 1875, 150, native.systemFont, 150 )
myText:setFillColor( 0, 0, 0 )

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


    local previousBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="previous",
    defaultFile = "Images/nextBtn.png",
    overFile = "Images/nextBtnOver.png",
    x = display.contentWidth/14,
    y = display.contentHeight*0.85,
    --onRelease = loadPrevious(previousScene)
    onRelease = previousClosure
}
previousBtn.rotation = -180

function loadOverlay()
composer.showOverlay( "scenes.spiderOverlay", overlayOptions )
end
  
function textDelete()
   instructions.alpha = 0
   --instructions:removeSelf()
   timer.performWithDelay(2000, generateSpiders, 20)
end   

function scaleDown()
    transition.scaleTo( instructions, { xScale=1.0, yScale=1.0, time=2000, onComplete=textDelete } )    
end    

function playInstructions()
    instructions.alpha = 1
    transition.scaleTo( instructions, { xScale=1.1, yScale=1.1, time=2000, onComplete=scaleDown}) 
end 

function generateSpiders()
    if  nextTapped == false and numTapped < 10 then        
        local sheetInfo = require("Sprites.spiderNew")
        local spiderSheet = graphics.newImageSheet( "Sprites/spiderNew.png", sheetInfo:getSheet() )
        local sequenceData =
            {name="spider", start = 1, time = 500, loopCount = 0, count=3}  
            spiderSprite = display.newSprite(spiderSheet, sequenceData)
            spiderSprite.x = display.contentWidth/2 
            spiderSprite.y = display.contentHeight/2 
            spiderSprite:play()
            transition.to(spiderSprite, {x = Random(0, display.contentWidth+100), y = Random(0, display.contentHeight+100), rotation = 15, time = 2500})
            sceneGroup:insert(spiderSprite)
            spiderSprite:addEventListener( "tap", spiderTap )
            return spiderSprite
    end
end

function checkTaps()
    if numTapped == 10 then
        composer.showOverlay( "scenes.badgeOverlay", overlayOptions )
    end
end

function spiderTap(event)
    numTapped = numTapped + 1
    myText.text = numTapped
    checkTaps()
    event.target:removeSelf()
    local splat = display.newImage("Images/splat.png", true)
    splat.x = event.target.x
    splat.y = event.target.y
    sceneGroup:insert(splat)
end

sceneGroup:insert(bkg)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(myText)
sceneGroup:insert(instructions)
sceneGroup:insert(previousBtn)

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





