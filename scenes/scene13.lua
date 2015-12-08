--MONSTER REVEAL
local composer = require( "composer" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local instructionFunc = require("modules.instructionFunc")
local sfx = require("modules.sfx")
local scene = composer.newScene("scene13")
local sceneName = "scene13"
local sceneNumber = 13
local nextSceneNumber = "scenes.scene14"
local previousScene = "scenes.scene12"
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local spawnedObjects = {}
local widget = require("widget")
--local growl = audio.loadSound( "Sounds/growl.mp3" )
local growlPlaying = false
local movedPage = false


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
    time = 1500,
    params =
    {
        var1 = sceneComponents,
        nextScene = nextSceneNumber
    }
}

local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

local function changePage(event)
    movedPage = true
    if event.target.id == "nextPage" then
        nextClosure()  
    else if event.target.id == "previous" then
        previousClosure()
         print("previous scene was: " .. previousScene)
    end
    return true
    end
end

local radiusMax = math.sqrt( centerX*centerX + centerY*centerY )

local bkg = display.newImage("Images/hallReveal.png", true)
bkg.x= display.contentWidth/2
bkg.y= display.contentHeight/2

local monster = display.newImage("Images/swampMonster.png", true)
monster.x = display.contentWidth/2
monster.y = display.contentHeight/2

local coatRack = display.newImage("Images/coatRack.png", true)
coatRack.x = display.contentWidth/2
coatRack.y = display.contentHeight/2
coatRack.alpha = 0

local hotspot = display.newCircle( display.contentWidth/2, display.contentHeight/2, 350 )
hotspot:setFillColor( 0.5 )
hotspot.alpha = 0 

local torchLight = display.newImage("Images/torchLight.png", true)
torchLight.x = display.contentWidth/8
torchLight.y = display.contentHeight*0.6

instructions = display.newImage("Images/revealInstruct.png", true)
instructions.x = display.contentWidth/2
instructions.y = display.contentHeight/2
instructions.alpha=0
    
    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.85,
    defaultFile = "Images/nextBtn.png",
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

local function playGrowl()
    if growlPlaying == false then
        audio.setVolume( 0.5 ) 
        audio.play(sfx.growl)
        growlPlaying = true
    end
end

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
    playGrowl()

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
    transition.to(coatRack, {time = 300, alpha = 1})
end

local function swapSheet3()
    explosionAnim:setSequence( "seq4" )
    explosionAnim:play()
    timer.performWithDelay( 100, swapSheet4 )
end

local function swapSheet2()
    explosionAnim:setSequence( "seq3" )
    explosionAnim:play()
    timer.performWithDelay( 100, swapSheet3 )
end

local function swapSheet()
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
      
sceneGroup:insert(bkg)
sceneGroup:insert(coatRack)
sceneGroup:insert(monster)
sceneGroup:insert(hotspot)
sceneGroup:insert(explosionAnim)
sceneGroup:insert(torchLight)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(previousBtn)

torchLight:addEventListener( "touch", torchLight )

end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       local instructionsClosure = function() return instructionFunc.playInstructions(instructions) end
        timer.performWithDelay(1000, instructionsClosure, 1)
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
    removeEventListeners()
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





