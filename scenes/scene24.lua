--underbed monster revealed
local composer = require( "composer" )
local scene = composer.newScene("scene24")
local sceneName = "scene24"
local sceneNumber = 24
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene25"
local widget = require("widget")
local growl = audio.loadSound( "Sounds/growl.mp3" )
local centerX = display.contentCenterX
local centerY = display.contentCenterY

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})
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
        composer.gotoScene( "scenes.textPage", overlayOptions )
    return true
end

local radiusMax = math.sqrt( centerX*centerX + centerY*centerY )

local bkg = display.newImage( "Images/caveDefeated.png", true )
bkg.x=display.contentWidth/2
bkg.y=display.contentHeight/2

local monster = display.newImage("Images/monsterDefeated.png", true)
monster.x = display.contentWidth/2
monster.y = display.contentHeight/2

local pile = display.newImage("Images/pileClothes.png", true)
pile.x = display.contentWidth/2
pile.y = display.contentHeight/2
pile.alpha = 0

local sheetInfo = require("Sprites.dizzy")
local dizzySheet = graphics.newImageSheet( "Sprites/dizzy.png", sheetInfo:getSheet() )

local sequenceData =
    {name="spinning", start = 1, time = 500, loopCount = 0, count=6}  
        dizzySprite = display.newSprite(dizzySheet, sequenceData)
    
        dizzySprite.x = display.contentWidth/2
        dizzySprite.y = display.contentHeight/8

local hotspot = display.newCircle( display.contentWidth/2, display.contentHeight/2, 350 )
hotspot:setFillColor( 0.5 )
hotspot.alpha = 0 

local torchLight = display.newImage("Images/torchLight.png", true)
torchLight.x = display.contentWidth/8
torchLight.y = display.contentHeight*0.6
torchLight.alpha=0

local instructions = display.newImage("Images/revealInstruct.png", true)
instructions.x = display.contentWidth/2
instructions.y = display.contentHeight/2
instructions.alpha=0

function turnOn()
    transition.to(torchLight, {time=10, alpha=1})
end
    
    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    onRelease = changePage
}

nextPgBtn.x = 1950
nextPgBtn.y = display.contentHeight/2

    local torchBtn = widget.newButton
{
    width = 200,
    height = 200,
    id ="torchBtn",
    defaultFile = "Images/torchBtnOff.png",
    overFile = "Images/torchBtnOn.png",
    onRelease = turnOn
}

torchBtn.x = 200
torchBtn.y = display.contentHeight*0.9
        
-- 1st image sheet
local sheetData1 = require("Sprites.explosion1")
local explosion1 = graphics.newImageSheet( "Sprites/explosion1.png", sheetData1:getSheet() )

-- 2nd image sheet
local sheetData2 = require("Sprites.explosion2")
local explosion2 = graphics.newImageSheet( "Sprites/explosion2.png", sheetData2:getSheet() )

-- 3rd image sheet
local sheetData3 = require("Sprites.explosion3")
local explosion3 = graphics.newImageSheet( "Sprites/explosion3.png", sheetData3:getSheet() )

-- 4th image sheet
local sheetData4 = require("Sprites.explosion4")
local explosion4 = graphics.newImageSheet( "Sprites/explosion4.png", sheetData4:getSheet() )

-- 5th image sheet
local sheetData5 = require("Sprites.explosion5")
local explosion5 = graphics.newImageSheet( "Sprites/explosion5.png", sheetData5:getSheet() )

local sequenceData = {
                { name="seq1", sheet=explosion1, start=1, count=5, time=500, loopCount=1 },
                { name="seq2", sheet=explosion2, start=1, count=1, time=500, loopCount=1 },
                { name="seq3", sheet=explosion3, start=1, count=1, time=500, loopCount=1 },
                { name="seq4", sheet=explosion4, start=1, count=2, time=500, loopCount=1 },
                { name="seq5", sheet=explosion5, start=1, count=5, time=500, loopCount=1 }
                      }

local explosionAnim = display.newSprite( explosion1, sequenceData )
explosionAnim.x = display.contentWidth/2 
explosionAnim.y = display.contentHeight/2
explosionAnim.alpha=0

local function monsterShake(target)
local firstTran, secondTran, thirdTran

--Third Transition
thirdTran = function()
        if target.shakeType == "Loop" then
            transition.to(target, {transition = inOutExpo, time = 100, rotation = 0, onComplete = firstTran})
        else
            transition.to(target, {transition = inOutExpo, time = 100, rotation = 0})
        end
end

--Second Transition
secondTran = function()
transition.to(target, {transition = inOutExpo, time = 100, alpha = 1, rotation = -5, onComplete = thirdTran})
end

--First Transtion
firstTran = function()
audio.setVolume( 0.5 ) 
audio.play(growl)
transition.to(target, {transition = inOutExpo, time = 100, rotation = 5, onComplete = secondTran})
end

--Do the first transition
firstTran()
end 

-- touch listener function
function torchLight:touch( event )
    if event.phase == "began" then
	
        self.markX = self.x    -- store x location of object
        self.markY = self.y    -- store y location of object
	
    elseif event.phase == "moved" then
        print("just moved")
	if hasCollided( event.target, hotspot ) then
            print("moved and collided")
            monsterShake(monster)
        end
        local x = (event.x - event.xStart) + self.markX
        local y = (event.y - event.yStart) + self.markY
        
        self.x, self.y = x, y    -- move object based on calculations above
    elseif event.phase == "ended" then
         if hasCollided( event.target, hotspot ) then
                    -- Pick up coin!
                    print("collided with hotspot")
                    playExplode()
                    hotspot:removeSelf()
                    hotspot = nil
   
        end
    end
     return true
end

-- collision detection
function hasCollided( torchLight, hotspot )
    if ( torchLight == nil ) then  -- Make sure the first object exists
        return false
    end
    if ( hotspot == nil ) then  -- Make sure the other object exists
        return false
    end

    local dx = torchLight.x - hotspot.x
    local dy = torchLight.y - hotspot.y

    local distance = math.sqrt( dx*dx + dy*dy )
    local objectSize = (hotspot.contentWidth/2) + (torchLight.contentWidth/2)

    if ( distance < objectSize ) then
        return true
    end
    return false
end

function swapSheet4()
    explosionAnim:setSequence( "seq5" )
    explosionAnim:play()
    transition.to(explosionAnim, {time = 500, alpha = 0})
    transition.to(pile, {time = 300, alpha = 1})
end

function swapSheet3()
    explosionAnim:setSequence( "seq4" )
    explosionAnim:play()
    timer.performWithDelay( 100, swapSheet4 )
end

function swapSheet2()
    explosionAnim:setSequence( "seq3" )
    explosionAnim:play()
    timer.performWithDelay( 100, swapSheet3 )
end

function swapSheet()
    explosionAnim:setSequence( "seq2" )
    explosionAnim:play()
    timer.performWithDelay( 100, swapSheet2 )
end

function playExplode()
    explosionAnim.alpha=1
    monster:removeSelf()
    explosionAnim:play()
    timer.performWithDelay( 100, swapSheet )
end

    function removeEventListeners()
        print("removeEventListeners called scene 13")
    end  
    

local function textDelete()
   instructions.alpha = 0
   --instructions:removeSelf()
end   

local function scaleDown()
    transition.scaleTo( instructions, { xScale=1.0, yScale=1.0, time=2500, onComplete=textDelete } )    
end    

function playInstructions()
    instructions.alpha = 1
    transition.scaleTo( instructions, { xScale=1.1, yScale=1.1, time=2500, onComplete=scaleDown}) 
end     
      
sceneGroup:insert(bkg)
sceneGroup:insert(pile)
sceneGroup:insert(monster)
sceneGroup:insert(hotspot)
sceneGroup:insert(explosionAnim)
sceneGroup:insert(torchLight)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(torchBtn)
sceneGroup:insert(dizzySprite)

torchLight:addEventListener( "touch", torchLight )
end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       dizzySprite:play()
       local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene



