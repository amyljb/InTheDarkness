--BUTTERFLY PAGE
local sceneName = "scene5"
local composer = require( "composer" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local widget = require("widget")
local scene = composer.newScene( "scene5" )
local numTapped = 0
local swipeDistance = 40
local startTouchY = 0
local swiping = false
local transitioned = false
local sceneNumber = 5
local nextSceneNumber = "scenes.scene6"
local previousScene = "scenes.scene4"
local movedPage = false

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})

-------------------------------------------------------------------------------
--SCENE CREATION
function scene:create( event )
    local sceneGroup = self.view
    
        --    Initialize the scene
    local sceneComponents = sceneObject:getText()
    
local overlayOptions =
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
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

--set up background image    
    local backgroundFour = display.newImage("Images/stomach.png", true)
    backgroundFour.x = display.contentWidth/2
    backgroundFour.y = display.contentHeight/2
    
    
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
        
--setup image sheets for butterflies    
    local sheetInfo = require("Sprites.bf2") 
    local sheetInfo2 = require("Sprites.butterfly1")
    local sheetInfo3 = require("Sprites.butterfly2") 
    
    local myButterflySheet = graphics.newImageSheet( "Sprites/bf2.png", sheetInfo:getSheet() )
    local myButterflySheet2 = graphics.newImageSheet("Sprites/butterfly1.png", sheetInfo2:getSheet())
    local myButterflySheet3 = graphics.newImageSheet("Sprites/butterfly2.png", sheetInfo3:getSheet())

    local sequenceData =
    {name="fluttering", start = 1, time = 600, loopCount = 0, count=9}

    local sequenceData2 =
    {name="fluttering", start = 1, time = 500, loopCount = 0, count=6}
    
    local sequenceData3 =
    {name="fluttering", start = 1, time = 800, loopCount = 0, count=10}

    
    local function tapCounter()
    if numTapped == 3 then
       nextClosure()
    end
    return true
end

   --tap handler to remove butterflies and update numTapped variable
    function butterflyTap(event)
        if not ( event.phase ) then
        event.target:pause()
        event.target:removeSelf()
        event.target= nil
        numTapped = numTapped + 1
        timer.performWithDelay(500, tapCounter) 
        end
        return true 
        end      

        --setup butterfly sprites
        local myButterflySprite = display.newSprite(myButterflySheet, sequenceData)
        myButterflySprite.x = display.contentWidth/2 + 150
        myButterflySprite.y = display.contentHeight/2 - 200
        myButterflySprite:play()
    
        local myButterflySprite2 = display.newSprite(myButterflySheet2, sequenceData2)
        myButterflySprite2.x = display.contentWidth/2 + 200
        myButterflySprite2.y = display.contentHeight/2 + 100
        myButterflySprite2:play()
        
        local myButterflySprite3 = display.newSprite(myButterflySheet3, sequenceData3)
        myButterflySprite3.x = display.contentWidth/2 - 100
        myButterflySprite3.y = display.contentHeight/2 + 100
        myButterflySprite3:play()
      
               
   --insert elements into sceneGroup    
    sceneGroup:insert(backgroundFour)
    sceneGroup:insert(myButterflySprite)
    sceneGroup:insert(myButterflySprite2)
    sceneGroup:insert(myButterflySprite3)
    sceneGroup:insert(previousBtn)
    
        --two handlers are attached to each butterfly sprite to handler event propagation 
        myButterflySprite:addEventListener("tap", butterflyTap)
        myButterflySprite2:addEventListener("tap", butterflyTap)
        myButterflySprite3:addEventListener("tap", butterflyTap)
        myButterflySprite:addEventListener("touch", butterflyTap)
        myButterflySprite2:addEventListener("touch", butterflyTap)
        myButterflySprite3:addEventListener("touch", butterflyTap)
end --END OF SCENE CREATIONS
  
--------------------------------------------------------------------------------  
--------------------------------------------------------------------------------
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is off screen and is about to move on screen
    elseif phase == "did" then
        print("scene 4:show did called")
     
        local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
    end 
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        transition.cancel(scaleTrans)
        -- Called when the scene is on screen and is about to move off screen
    elseif phase == "did" then
        -- Called when the scene is now off screen
    end 
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:destroy( event )
    local sceneGroup = self.view
    --transition.cancel(scaleTrans)
end

-------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-------------------------------------------------------------------------------

return scene



