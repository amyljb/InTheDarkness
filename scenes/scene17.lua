--GHOST REVEALED
local composer = require( "composer" )
local widget = require("widget")
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local scene = composer.newScene("scene17")
local sceneName = "scene17"
local sceneNumber = 17
local nextSceneNumber = "scenes.scene18"
local previousScene = "scenes.scene16"

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

local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

local function changePage()
        composer.gotoScene( "scenes.textPage", overlayOptions )
    return true
end

local bkg = display.newImage("Images/kitchen.png", true)
bkg.x= display.contentWidth/2
bkg.y= display.contentHeight/2

local sheetInfo = require("Sprites.kitchenGhost")
local kitchenGhostSheet = graphics.newImageSheet( "Sprites/kitchenGhost.png", sheetInfo:getSheet() )
 
 local sequenceData =
    {name="floating", start = 1, time = 1000, loopCount = 0, count=6}  
        kitchenGhostSprite = display.newSprite(kitchenGhostSheet, sequenceData)
        kitchenGhostSprite.x = display.contentWidth - display.contentWidth/4
        kitchenGhostSprite.y = display.contentHeight/3 
        
local sheetInfo2 = require("Sprites.curtain1")
local curtainSheet = graphics.newImageSheet( "Sprites/curtain1.png", sheetInfo2:getSheet() )
local sheetInfo3 = require("Sprites.curtain2")
local curtainSheet2 = graphics.newImageSheet( "Sprites/curtain2.png", sheetInfo3:getSheet() )
local sheetInfo4 = require("Sprites.curtain3")
local curtainSheet3 = graphics.newImageSheet( "Sprites/curtain3.png", sheetInfo4:getSheet() )
 
 local sequenceData2 = {
    {name="blowing1", sheet=curtainSheet, start = 1, time = 700, loopCount = 0, count=6},  
    {name="blowing2", sheet=curtainSheet2, start = 1, time = 700, loopCount = 0, count=6}, 
    {name="blowing3", sheet=curtainSheet3, start = 1, time = 600, loopCount = 0, count=5} 
    }
    
        curtainSprite = display.newSprite(curtainSheet, sequenceData2)
        curtainSprite.x = display.contentWidth - display.contentWidth/4
        curtainSprite.y = display.contentHeight/3 
        curtainSprite.alpha=0
                
local hotspot = display.newCircle( display.contentWidth - display.contentWidth/4, display.contentHeight/3, 300 )
hotspot:setFillColor( 0.5 )
hotspot.alpha = 0 

local torchLight = display.newImage("Images/torchLight.png", true)
torchLight.x = display.contentWidth/8
torchLight.y = display.contentHeight*0.6

    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
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
    --onRelease = loadPrevious(previousScene)
    onRelease = previousClosure
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
explosionAnim.x = display.contentWidth - display.contentWidth/4
explosionAnim.y = display.contentHeight/3
explosionAnim.alpha=0

local function ghostShake(kitchenGhostSprite)
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
        local x = (event.x - event.xStart) + self.markX
        local y = (event.y - event.yStart) + self.markY
        if hasCollided( event.target, hotspot ) then
            print("moved and collided")
            ghostShake(kitchenGhostSprite)
        end
        
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


function swapCurtain2()
    curtainSprite:setSequence("blowing3")
    curtainSprite:play()
end

function swapCurtain()
    curtainSprite:setSequence("blowing2")
    curtainSprite:play()
    timer.performWithDelay(700, swapCurtain2)
end

function playCurtain()
    curtainSprite:setSequence("blowing1")
    curtainSprite:play()
    timer.performWithDelay(700, swapCurtain)
end

function swapSheet4()
    explosionAnim:setSequence( "seq5" )
    explosionAnim:play()
    transition.to(explosionAnim, {time = 500, alpha = 0})
    transition.to(curtainSprite, {time = 300, alpha = 1})
    playCurtain()
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
    kitchenGhostSprite:removeSelf()
    explosionAnim:play()
    timer.performWithDelay( 100, swapSheet )
    
end


sceneGroup:insert(bkg)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(kitchenGhostSprite)
sceneGroup:insert(hotspot)
sceneGroup:insert(torchLight)
sceneGroup:insert(explosionAnim)
sceneGroup:insert(curtainSprite)
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
       kitchenGhostSprite:play()
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




