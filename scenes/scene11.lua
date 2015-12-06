--RUB OUT - SWAMP PAGE
local composer = require( "composer" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local sfx = require("modules.sfx")
local rubPrompt = require("modules.rubOutPrompt")
local particleDesigner = require( "particleDesigner" )
local lizardsheetInfo = require("Sprites.lizardSprite")
local widget = require("widget")
local scene = composer.newScene("scene11")
local sceneName = "scene11"
local sceneNumber = 11
local nextSceneNumber = "scenes.scene12"
local previousScene = "scenes.scene10"
local previousX = 0
local previousY = 0
local numTouch = 0
local tapped = false
local soundPlaying = false
local movedPage = false
local centerX = display.contentWidth/2 --* 0.5
local centerY = display.contentHeight/2
physics.start()
physics.setGravity( 0, 9.8 )

local movePath = {}
movePath[1] = { x=-100, y=200 }
movePath[2] = { x=200, y=-300 }
movePath[3] = { x=200, y=200 }
movePath[4] = { x=400, y=-200 }
movePath[5] = { x=500, y=400 }
movePath[6] = { x=700, y=-100 }

--Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})

--options table for next page transitions
local options = {
    effect = "crossFade",
    time = 2000
}

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

--change page on button tap
local function changePage()
    movedPage = true
    nextClosure()
    if soundPlaying == true then
        audio.stop(sfx.swampPlay)
    end
    return true
end
    
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
    onRelease = previousClosure
}
previousBtn.rotation = -180
    
    
    local snapshot = display.newSnapshot(2048, 1536)
    snapshot:translate( display.contentCenterX, display.contentCenterY )

    local hall = display.newImage( "Images/monsterHall.png" )
    hall.x = display.contentWidth/2
    hall.y = display.contentHeight/2
    
    local mist1 = display.newImage( "Images/mist1.png", true )
    mist1.x=display.contentWidth/2
    mist1.y=display.contentHeight/4

    local mist2 = display.newImage( "Images/mist2.png", true )
    mist2.x=display.contentWidth/2
    mist2.y=display.contentHeight/2

    local mist3 = display.newImage( "Images/mist3.png", true )
    mist3.x=display.contentWidth*0.6
    mist3.y=display.contentHeight*0.6

    local mist4 = display.newImage( "Images/mist4.png", true )
    mist4.x=display.contentWidth/4
    mist4.y=display.contentHeight*0.8

    local mist5 = display.newImage( "Images/mist5.png", true )
    mist5.x=display.contentWidth/3
    mist5.y=display.contentHeight/9

    local swampImage = display.newImage( "Images/swamp.png" )

    snapshot.canvas:insert(swampImage)
    snapshot:invalidate( "canvas" )

    local previousX, previousY
    local threshold = 10
    local thresholdSq = threshold*threshold

    local function draw( x, y )
	local o = display.newImage( "Images/brush.png", x, y )
	o.fill.blendMode = { srcColor = "zero", dstColor="oneMinusSrcAlpha" }

	snapshot.canvas:insert( o )
	snapshot:invalidate( "canvas" ) -- accumulate changes w/o clearing
    end

    local function listener( event )
        local x,y = event.x - snapshot.x, event.y - snapshot.y  
	if ( event.phase == "began" ) then
		previousX = x
                previousY = y
		draw( x, y )
	elseif ( event.phase == "moved" ) then
		local dx = x - previousX
		local dy = y - previousY
		local deltaSq = dx*dx + dy*dy
		if ( deltaSq > thresholdSq ) then
			draw( x, y )
			previousX,previousY = x,y
                        numTouch = 1
		end
	end
    end
    
    function moveMist()
    transition.to( mist1, {time=4000, x =display.contentWidth*1.5, onComplete= function(self) self.parent:remove(self); self = nil; end} )  
    transition.to( mist2, {time=4000, x =-display.contentWidth, onComplete= function(self) self.parent:remove(self); self = nil; end} )  
    transition.to( mist3, {time=5000, x =display.contentWidth*1.5, onComplete= function(self) self.parent:remove(self); self = nil; end} )  
    transition.to( mist4, {time=4000, x =-display.contentWidth, onComplete= function(self) self.parent:remove(self); self = nil; end} )  
    transition.to( mist5, {time=3000, x =-display.contentWidth, onComplete= function(self) self.parent:remove(self); self = nil; end} )
end
    
    function playSwampSounds()
       -- audio.setVolume(0.0)
       if movedPage == false then
       soundPlaying = true
        swampPlay = audio.play(sfx.swampAmbience)
        audio.fade( {channel = swampPlay, time=3000, volume=0.7 } )
       end
    end

local lizardSheet = graphics.newImageSheet("Sprites/lizardSprite.png", lizardsheetInfo:getSheet())

    local sequenceData =
    {name="lizard", start = 1, time = 3000, count=8}
    
    lizardSprite = display.newSprite(lizardSheet, sequenceData)
    lizardSprite.x = display.contentWidth*0.85
    lizardSprite.y = display.contentHeight*0.55
     
     
    local headsheetInfo = require("Sprites.monsterHead")
    local headSheet = graphics.newImageSheet("Sprites/monsterHead.png", headsheetInfo:getSheet())

    local sequenceData2 =
    {name="headMoving", start = 1, time = 4500, count=12}
    
    headSprite = display.newSprite(headSheet, sequenceData2)
    headSprite.x = display.contentWidth/2
    headSprite.y = display.contentHeight/2.5
        
local emitter = particleDesigner.newEmitter( "bp_firefly_final.json" )
emitter.x = display.contentWidth / 2
emitter.y = display.contentHeight / 2

function start_particles( event )
	emitter:start()
end
function stop_particles( event )
	emitter:stop()
end

local original_rate = emitter.emissionRateInParticlesPerSeconds

local function set_original_rate( event )
	emitter.emissionRateInParticlesPerSeconds = original_rate
end

local function removeLizard()
    lizardSprite.alpha=0
end

   sceneGroup:insert(hall)
    sceneGroup:insert(snapshot)
    sceneGroup:insert(lizardSprite)
    sceneGroup:insert(headSprite)
    sceneGroup:insert(emitter)
    sceneGroup:insert(mist1)
    sceneGroup:insert(mist2)
    sceneGroup:insert(mist3)
    sceneGroup:insert(mist4)
    sceneGroup:insert(mist5)
    sceneGroup:insert(nextPgBtn)
    sceneGroup:insert(previousBtn)
    
snapshot:addEventListener( "touch", listener ) 
snapshot:addEventListener( "tap", removeLizard ) 


end
-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       local rubOutClosure = function() return rubPrompt.rubOutIndicator(movedPage) end
        timer.performWithDelay(3000, rubOutClosure, 1)
        timer.performWithDelay(2500, playSwampSounds)
        timer.performWithDelay(700, moveMist)
        start_particles()
        lizardSprite:play()
        headSprite:play()
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
       physics.pause()
     --  audio.fadeOut( { channel=swampAmbience, time=1000 } )
       --lizardSprite:stop()
       --audio.stop(swampAmbience)
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )
local sceneGroup = self.view
    stop_particles()
    display.remove(particleSystem)
    particleSystem = nil
end

---------------------------------------------------------------------------------
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------
return scene



