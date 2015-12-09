--HEART
local composer = require( "composer" )
local widget = require( "widget" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local sfx = require("modules.sfx")
local instructionFunc = require("modules.instructionFunc")
local scene = composer.newScene("scene12")
local sceneName = "scene12"
local sceneNumber = 12
local nextSceneNumber = "scenes.scene13"
local previousScene = "scenes.scene11"
local breathText
local scaleNum = 0
local movedPage = false
numTapped = 0

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
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


-- Options table for the overlay scene "badgeOverlay.lua"
local overlayOptions2 = {
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
    
local overlayOptions =
{
    effect = "fade",
    time = 1500,
    params =
    {
        var1 = sceneComponents,
        nextScene = nextSceneNumber
    }
}

--closures that pass params to changePg module
local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

--function to change pg based on button id
local function changePage(event)
    movedPage = true
    if event.target.id == "nextPage" then
      nextClosure()  
    else if event.target.id == "previous" then
        previousClosure()
    end
    return true
    end
end

--set up images 
    local bkg = display.newImage("Images/heartBkg.png", true)
    bkg.x = display.contentWidth/2
    bkg.y = display.contentHeight/2
    
    local redBkg = display.newImage("Images/redBkg.png", true)
    redBkg.x = display.contentWidth/2
    redBkg.y = display.contentHeight/2
    redBkg.alpha = 0
    
    local freddie = display.newImage("Images/freddieHalf.png", true)
    freddie.x = display.contentWidth/2
    freddie.y = display.contentHeight/2
    
    local happier = display.newImage("Images/happier.png", true)
    happier.x = display.contentWidth/2
    happier.y = display.contentHeight/2
    happier.alpha=0
    
    local myText = display.newText( "0", 1890, 150, native.systemFont, 150 )
    myText:setFillColor( 0, 0, 0 )
    
    instructions = display.newImage("Images/heartInstructions.png", true)
    instructions.x = display.contentWidth/2
    instructions.y = display.contentHeight/2
    instructions.alpha=0
    
--setup page buttons  
    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    overFile = "Images/nextBtnOver.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.85,
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
    onRelease = changePage
}
previousBtn.rotation = -180
    
--setup sprite sheets    
local sheetInfo = require("Sprites.heartbeat")
local heartbeatSheet = graphics.newImageSheet( "Sprites/heartbeat.png", sheetInfo:getSheet() )
 
 local sequenceData = {
    {name="beatingFast", start = 1, time = 200, loopCount = 0, count=3},
    {name="beatingSlower", start = 1, time = 400, loopCount = 0, count=3},
    {name="beatingSlow", start = 1, time = 800, loopCount = 0, count=3}
    }
        beatSprite = display.newSprite(heartbeatSheet, sequenceData)
        beatSprite.x = display.contentWidth/2
        beatSprite.y = display.contentHeight*0.8 
         
--remove button
function removeButton(button)
    button:removeSelf()
    transition.to(bkg, {time = 500, alpha = 1})
    transition.to(redBkg, {time = 500, alpha = 0})
end

--generate button and remove button
function generateButton()
    if numTapped < 3 and movedPage == false then
        --setup button
       local button = display.newImage("Images/heartBtn.png", true)
        button.x=display.contentWidth/2
        button.y=display.contentHeight*0.8
        button:addEventListener("tap", slowBeat)
        button.alpha = 0.1
        --change background colour
        transition.to(bkg, {time = 500, alpha = 0})
        transition.to(redBkg, {time = 500, alpha = 1})
        sceneGroup:insert(button)
        --add closure to remove button
        local myClosure = function() return removeButton( button ) end
        timer.performWithDelay( 1000, myClosure, 1 )
        return button  
    end
end

--slow heartbeat sprite based on number of taps to button
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
        composer.showOverlay( "scenes.badgeOverlay", overlayOptions2 )
        happier.alpha = 1
        freddie.alpha = 0
    end
end

--insert display objects into sceneGroup
sceneGroup:insert(redBkg)
sceneGroup:insert(bkg)
sceneGroup:insert(myText)
sceneGroup:insert(freddie)
sceneGroup:insert(happier)
sceneGroup:insert(beatSprite)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(previousBtn)
end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      beatSprite:play()
      audio.play(sfx.heartSound)
      --generate button on timer 20 times
      timer.performWithDelay(3500, generateButton, 20)
     --closure passes instructions to instructionFunc.lua, plays instructions
        local instructionsClosure = function() return instructionFunc.playInstructions(instructions) end
        timer.performWithDelay(1000, instructionsClosure, 1)
         -- remove previous scene from memory
         local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)      
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

