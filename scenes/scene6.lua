--SOUNDS PAGE
local sceneName = "scene5"
local composer = require( "composer" )
local scene = composer.newScene("scene6")
local widget = require ("widget")
local swipePrompt = require("swipePrompt")
local tapIndicatorFunc = require("tapIndicatorFunc")
local swipeDistance = 40
local startTouchY = 0
local swiping = false
local transitioned = false
local swipePrompt = require("swipePrompt")
local sceneNumber = 6
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene7"

local swipeDistance = 40
local startTouchY = 0
local curtainOpen = false
local transitioned = false
local swiped = false

local snoreSound = audio.loadSound( "Sounds/male_snoring.mp3" )
local clockSound = audio.loadSound( "Sounds/clock.wav" )
local windSound = audio.loadSound( "Sounds/windSound.mp3" )
local lightSwitchSound = audio.loadSound( "Sounds/switch-1.wav" )
local bedSound = audio.loadSound( "Sounds/creak.mp3" )
local tvSound = audio.loadSound( "Sounds/static_noise.mp3" )
local toyBoxSound = audio.loadSound( "Sounds/toy_raygun.mp3" )
local radioSound = audio.loadSound( "Sounds/radio.mp3" )
local dumSound = audio.loadSound( "Sounds/dum.mp3" )

--    Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})


--------------------------------------------------------------------------------
-- "scene:create()"
function scene:create( event )

local sceneGroup = self.view

        --    Initialize the scene
    local sceneComponents = sceneObject:getText()
    
local overlayOptions =
{
    effect = "fade",
    time = 600,
    params =
    {
        var1 = sceneComponents,
        nextScene = nextSceneNumber
    }
}

local function changePage( event )
    if event.phase == "ended" then
        transitioned = true
        audio.play(lightSwitchSound)
        composer.gotoScene( "scenes.textPage", overlayOptions )
    end
    return true
end

local background = display.newImage("Images/pg5NEW.png", true)
background.x = display.contentWidth/2
background.y = display.contentHeight

local bed = display.newImage("Images/bed.png", true)
bed.x = display.contentWidth/3.5
bed.y = display.contentHeight*0.65

local dad = display.newImage("Images/dad.png", true)
dad.x = display.contentWidth/6
dad.y = display.contentHeight*2 -- /2 + 200

local clock = display.newImage("Images/clock.png", true)
clock.x = display.contentWidth/5
clock.y = display.contentHeight*2

local tv = display.newImage("Images/tv.png", true)
tv.x = display.contentWidth*0.9
tv.y = display.contentHeight*2

local instructions = display.newImage("Images/soundInstruction.png", true)
instructions.x = display.contentWidth/2
instructions.y = display.contentHeight/2
instructions.alpha=0
    
local tapIndicator = display.newImage("Images/tapButton.png", true)
tapIndicator.x= display.contentWidth/2 
tapIndicator.y= display.contentHeight/8
tapIndicator.alpha = 0    

local sheetInfo = require("Sprites.curtains")
local curtainsSheet = graphics.newImageSheet( "Sprites/curtains.png", sheetInfo:getSheet() )

local sequenceData =
    {name="curtainsOpen", start = 1, time = 800, loopCount = 1, count=8}  
        curtainSprite = display.newSprite(curtainsSheet, sequenceData)
    
        curtainSprite.x = display.contentWidth/2 + 550
        curtainSprite.y = display.contentHeight/2 - 500

 local sheetInfo2 = require("Sprites.snoring")
 local snoringSheet = graphics.newImageSheet( "Sprites/snoring.png", sheetInfo2:getSheet() )
 
 local sequenceData2 =
    {name="snoring", start = 1, time = 800, loopCount = 1, count=5}  
        snoringSprite = display.newSprite(snoringSheet, sequenceData2)
    
        snoringSprite.x = display.contentWidth/4
        snoringSprite.y = display.contentHeight/3 
        snoringSprite.alpha = 0
        
local sheetInfo3 = require("Sprites.shh")
        local shhSheet1 = graphics.newImageSheet( "Sprites/shh.png", sheetInfo3:getSheet() )
        local sequenceData3 = 
            {name="shh", start = 1, time = 2000, loopCount = 1, count=8}
        shhSprite = display.newSprite(shhSheet1, sequenceData3)
        shhSprite.x = display.contentWidth*0.8 
        shhSprite.y =display.contentHeight-250   
        
local sheetInfo4 = require("Sprites.grr1") 
local grrSheet1 = graphics.newImageSheet( "Sprites/grr1.png", sheetInfo4:getSheet() )
local sheetInfo5 = require("Sprites.grr2") 
local grrSheet2 = graphics.newImageSheet( "Sprites/grr2.png", sheetInfo5:getSheet() )

local sequenceData4 = {
        {name="seqOne", sheet= grrSheet1, start = 1, time = 500, loopCount = 1, count=4},
        {name="seqTwo", sheet= grrSheet2, start = 1, time = 1000, loopCount = 1, count=8}
        }
        
      grrSprite = display.newSprite(grrSheet1, sequenceData4)
      grrSprite.x = display.contentWidth/3
      grrSprite.y = display.contentHeight

local sheetInfo6 = require("Sprites.suddenlyText")
        local suddenlySheet = graphics.newImageSheet( "Sprites/suddenlyText.png", sheetInfo6:getSheet() )
        local sequenceData5 = 
            {name="shh", start = 1, time = 4000, loopCount = 1, count=2}
        suddenlySprite = display.newSprite(suddenlySheet, sequenceData5)
        suddenlySprite.x = display.contentWidth/2
        suddenlySprite.y =display.contentHeight/2  
        suddenlySprite.alpha=0

local lightButton = widget.newButton
{
    width = 250,
    height = 350,
    id = "clock",
    defaultFile = "Images/overhead_light.png",
    x =display.contentWidth/2,
    y = display.contentHeight/8,
    onRelease = changePage
}

local function playBox()
    print("toybox")
    audio.play(toyBoxSound, {duration=2000})
end

local function playRadio()
    audio.play(radioSound, {duration=2000})
end

local  toyBox = widget.newButton
{
    width = 650,
    height = 1100,
    id = "toyBox",
    defaultFile = "Images/toyBox.png",
    x =display.contentWidth*0.75,
    y = display.contentHeight*0.6,
    overFile =  "Images/toyBoxOn.png",
    onRelease = playBox
}

local radio = widget.newButton
{
    width = 300,
    height = 700,
    id = "radio",
    defaultFile = "Images/radio.png",
    x =display.contentWidth/2,
    y = display.contentHeight*2,
    overFile =  "Images/radioOn.png",
    onRelease = playRadio
}

local function swapSheet()
        grrSprite:setSequence( "seqTwo" )
        grrSprite:play()
        print("seq2")
        transition.to(grrSprite, {alpha = 0, time = 2000})
        transition.to(shhSprite, {alpha = 0, time = 2000})
        transition.to(suddenlySprite, {alpha = 0, time = 1000})
        --timer.performWithDelay( 1000, playGrr )
end

function playGrr()
    if transitioned == false then
    if swiped == false then
        print("playing grr")
        grrSprite.alpha = 1
        grrSprite:setSequence( "seqOne" )
        grrSprite:play()
        shhSprite:play()
        timer.performWithDelay( 700, swapSheet )
        print("seq1") 
    end
end
end

--swipe handler
function swipeHandler(event)
        if event.phase == "began" then
        startTouchY = event.y
       swiped = true
        end
    if event.phase == "ended"  then
        if event.y < startTouchY - swipeDistance then
            print("swiped down")
            transition.to( background , { time=700, y=0 } )
            transition.to( tv , { time=700, y=display.contentHeight*0.6 } )
            transition.to( curtainSprite , { time=700, y=-display.contentHeight } )
            transition.to( lightButton , { time=700, y=-display.contentHeight } )
            transition.to( dad , { time=700, y=display.contentHeight/2+200 } )
            transition.to( clock , { time=700, y=display.contentHeight/2-450 } )
            transition.to( bed , { time=1000, y=-display.contentHeight} )
            transition.to( toyBox , { time=1000, y=-display.contentHeight} )
            transition.to( radio , { time=1000, y=display.contentHeight*0.6} )
        else if event.y > startTouchY + swipeDistance then
            print("swiped up")
            transition.to( background , { time=700, y=display.contentHeight } )
            transition.to( curtainSprite , { time=700, y=display.contentHeight/2 - 500 } )
            transition.to( lightButton , { time=700, y=display.contentHeight/9 } )
            transition.to( dad , { time=700, y=display.contentHeight*2 } )
            transition.to( clock , { time=700, y=display.contentHeight*2 } )
            transition.to( bed , { time=700, y=display.contentHeight*0.65} )
            transition.to( tv , { time=700, y=display.contentHeight*2} )
            transition.to( toyBox , { time=1000, y=display.contentHeight*0.6} )
            transition.to( radio , { time=1000, y=display.contentHeight*2} )
            local myTapClosure = function() return tapIndicatorFunc.pulsateFunction( tapIndicator ) end
            timer.performWithDelay(500, myTapClosure, 1)
            end
            end
        end
        return true
    end

function openCurtain(event)
    if not ( event.phase ) and curtainOpen == false then
        curtainSprite:play()
        curtainSprite:removeEventListener("touch", openCurtain)
        curtainOpen = true
        audio.play(windSound, {duration=6000})
        end
        return true
end

local function removeLight(tvLight)
    tvLight.alpha = 0
    tvLight:removeSelf()
end

local function removeShh()
    shhSprite.alpha=0
end

local function playTv()
    audio.play(tvSound, {duration=2000})
    shhSprite.x = display.contentWidth*0.9 
    shhSprite.y =display.contentHeight/7
    shhSprite:play()
    local tvLight = display.newImage("Images/tvLight.png", true)
    tvLight.x = display.contentWidth*0.68
    tvLight.y = display.contentHeight*0.59
    sceneGroup:insert(tvLight)
    local lightClosure = function() return removeLight(tvLight) end
     timer.performWithDelay(2000, lightClosure, 1)
     timer.performWithDelay(2000, removeShh)
    return tvLight
end

--play snoring sound and snoring sprite
local function snoringSounds()
    print("playing snore")
    audio.play(snoreSound, {duration=2000})
    grrSprite.y = display.contentHeight/6
    grrSprite.x = display.contentWidth/2
    --grrSprite:setSequence( "seqOne" )
    grrSprite.alpha = 1
    playGrr()
    --snoringSprite.alpha = 1
    --snoringSprite:play()
    transition.to(grrSprite, {alpha = 0, time = 2000})
    return true
end

--play clock sounds
local function clockSounds()
    print("playing clock")
    audio.play(clockSound, {duration=2000})
    return true
end

local function rotateBack()
    transition.to(bed, {time =200, rotation = 0})
end

local function bedCreak(event)
    if not ( event.phase ) then
        transition.to(bed, {time =200, rotation = 5, onComplete = rotateBack})
         audio.play(bedSound)
    end  
end

local function textDelete()
   instructions.alpha = 0
   --instructions:removeSelf()
end   

local function scaleDown()
    transition.scaleTo( instructions, { xScale=1.0, yScale=1.0, time=2500, onComplete=textDelete } )    
end    

function playInstructions()
    if swiped == false and  transitioned == false then
        instructions.alpha = 1
        transition.scaleTo( instructions, { xScale=1.1, yScale=1.1, time=2500, onComplete=scaleDown}) 
    end
end 

function playSuddenText()
    if swiped == false  and transitioned == false then
    suddenlySprite.alpha=1
    suddenlySprite:play()
    audio.play(dumSound)
    end
end

function removeInstructions(downInstructions)
    downInstructions.alpha=0
    downInstructions:removeSelf()
    downInstructions = nil
end

function swipeInstruction()
    if swiped == false and transitioned == false then
    local downInstructions = display.newImage("Images/downInstruct.png", true)
    downInstructions.x = display.contentWidth/2
    downInstructions.y = display.contentHeight/2
    local swipeClosure = function() return  removeInstructions(downInstructions) end
    timer.performWithDelay(3000, swipeClosure, 1)
    background:addEventListener("touch", swipeHandler)
    end
end

--insert scene elements into sceneGroup
sceneGroup:insert(background)
sceneGroup:insert(bed)
sceneGroup:insert(curtainSprite)
sceneGroup:insert(toyBox)
sceneGroup:insert(lightButton)
sceneGroup:insert(dad)
sceneGroup:insert(tv)
sceneGroup:insert(clock)
sceneGroup:insert(radio)
sceneGroup:insert(snoringSprite)
sceneGroup:insert(shhSprite)
sceneGroup:insert(suddenlySprite)
sceneGroup:insert(tapIndicator)

--Add event listeners
tv:addEventListener("tap", playTv)
clock:addEventListener("tap", clockSounds)
dad:addEventListener("tap", snoringSounds)
bed:addEventListener("touch", bedCreak)
bed:addEventListener("tap", bedCreak)
curtainSprite:addEventListener("touch", openCurtain)
curtainSprite:addEventListener("tap", openCurtain)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
    timer.performWithDelay(1000, playInstructions)
    timer.performWithDelay(15000, playSuddenText)
    timer.performWithDelay(20000, playGrr )
    timer.performWithDelay(25000, swipeInstruction )
    --local swipeClosure = function() return swipePrompt.swipeIndicator(sceneName, transitioned) end
    -- timer.performWithDelay(4000, swipeClosure, 1)
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



