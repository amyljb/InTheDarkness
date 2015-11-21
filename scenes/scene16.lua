--HEART
local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene("scene16")
local sceneName = "scene16"
local sceneNumber = 16
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene17"
local breathText
local scaleNum = 0
numTapped = 0
local heartSound = audio.loadSound( "heartbeating.mp3" )

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})

local options = {
   text = "Tap the button when it appears to help slow Freddie's heart!",
   x = display.contentWidth*0.75,
   y = display.contentHeight*0.8,
   fontSize = 52,
   width = 800,
   height = 0,
   align = "center"
}
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

 local sceneGroup = self.view
 
         --Initialize the scene
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

local function changePage()
    print("pressed next pg btn")
    composer.gotoScene("scenes.textPage", overlayOptions )     
    return true
end

    local bkg = display.newImage("Images/breathingBkg.png", true)
    bkg.x = display.contentWidth/2
    bkg.y = display.contentHeight/2
    
    local freddie = display.newImage("Images/freddieHalf.png", true)
    freddie.x = display.contentWidth/2.5
    freddie.y = display.contentHeight/2
    
    local myText = display.newText( "0!", 1900, 200, native.systemFont, 82 )
    myText:setFillColor( 1, 0, 0 )
    local instructionText = display.newText(options)
    instructionText:setFillColor( 1, 0, 0 )
    
        local nextPgBtn = widget.newButton
{
    width = 150,
    height = 150,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    x = 1900,
    y = display.contentHeight/2,
    onRelease = changePage
}
    
local sheetInfo = require("Sprites.heartbeat")
local heartbeatSheet = graphics.newImageSheet( "Sprites/heartbeat.png", sheetInfo:getSheet() )
 
 local sequenceData = {
    {name="beatingFast", start = 1, time = 200, loopCount = 0, count=3},
    {name="beatingSlower", start = 1, time = 400, loopCount = 0, count=3},
    {name="beatingSlow", start = 1, time = 800, loopCount = 0, count=3}
    }
        beatSprite = display.newSprite(heartbeatSheet, sequenceData)
        beatSprite.x = display.contentWidth/4
        beatSprite.y = display.contentHeight*0.8 
        
local sheetInfo2 = require("Sprites.circleTimer")
local timerSheet1 = graphics.newImageSheet( "Sprites/circleTimer.png", sheetInfo2:getSheet() )

local sheetInfo3 = require("Sprites.circleTimer2")
local timerSheet2 = graphics.newImageSheet( "Sprites/circleTimer2.png", sheetInfo3:getSheet() )
 
 local sequenceData2 = {
    {name="seq1", sheet = timerSheet1, start = 1, time = 1000, loopCount = 1, count=14},
    {name="seq2", sheet = timerSheet2, start = 1, time = 700, loopCount = 1, count=6}
    }
        timerSprite = display.newSprite(timerSheet1, sequenceData2)
        timerSprite.x = display.contentWidth*0.7
        timerSprite.y = display.contentHeight/2  
        
local function swapSheet()
    print("swapped sheet")
    timerSprite:setSequence("seq2")
    timerSprite:play()
end

function playTimer()
    timerSprite:setSequence("seq1")
    timerSprite:play()
    timer.performWithDelay(700, swapSheet)
end

function removeButton(button)
    button:removeSelf()
end

function generateButton()
    if numTapped < 4 then
        playTimer()
       local button = display.newImage("Images/heartBtn.png", true)
        button.x=display.contentWidth*0.7
        button.y=display.contentHeight/2
        button.id = "green"
        button:addEventListener("tap", slowBeat)
        sceneGroup:insert(button)
        local myClosure = function() return removeButton( button ) end
        timer.performWithDelay( 1000, myClosure, 1 )
        return button  
    end
end

function slowBeat()
   numTapped = numTapped + 1
   myText.text = numTapped
    if numTapped == 2 then
        beatSprite:setSequence("beatingSlower")
        beatSprite:play()
    end
    if numTapped == 3 then
        beatSprite:setSequence("beatingSlow")
        beatSprite:play()
    end
    if numTapped == 4 then
        myText.text = "Great job! Freddie is feeling better!"
    end
end

sceneGroup:insert(bkg)
sceneGroup:insert(myText)
sceneGroup:insert(instructionText)
sceneGroup:insert(freddie)
sceneGroup:insert(beatSprite)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(timerSprite)
end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      beatSprite:play()
      audio.play(heartSound)
      playTimer()
     timer.performWithDelay(2000, generateButton, 20)
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
   transition.cancel(scaleBreath)
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view
   transition.cancel(scaleBreath)
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene



