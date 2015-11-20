--RUB OUT - SWAMP PAGE
local composer = require( "composer" )
local scene = composer.newScene("scene11")
local sceneName = "scene11"
local sceneNumber = 11
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene12"
local rubPrompt = require("rubOutPrompt")
local widget = require("widget")
local swampAmbience = audio.loadSound( "Sounds/swamp_ambience_1.mp3" )
local previousX = 0
local previousY = 0
local numTouch = 0
local tapped = false
local soundPlaying = false
local nextTapped = false
local centerX = display.contentWidth/2 --* 0.5
local centerY = display.contentHeight/2
local lizardsheetInfo = require("Sprites.lizardSprite")
physics.start()
physics.setGravity( 0, 9.8 )
local particleDesigner = require( "particleDesigner" )

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

--change page on button tap
local function changePage( )
    nextTapped = true
    composer.gotoScene( "scenes.textPage", overlayOptions2 )
    if soundPlaying == true then
        audio.stop()
    end
    return true
end
    
    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    x = 1950,
    y = display.contentHeight/2,
    onRelease = changePage,
}
    
    local layer = {}
--layers image for parallax
for i =1, 4 do
    layer[i] = display.newImage("Images/layer" .. i .. ".png", 0, 0)
    --SET REFERENCE POINT
    layer[i].x = centerX
    layer[i].y = centerY
    sceneGroup:insert(layer[i])
end

function accelerometerHandler(event)
    for i=1, #layer do
        local xDamp = 0.2
        local yDamp = 0.15
        
        layer[i].x = centerX + (centerX * event.yGravity * xDamp)
        layer[i].y = centerY + (centerY * event.xGravity * yDamp)
    end
end
    
    local snapshot = display.newSnapshot(2048, 1536)
    snapshot:translate( display.contentCenterX, display.contentCenterY )

    local darkness = display.newImage( "Images/darkness.png" )
    darkness.x = display.contentWidth/2
    darkness.y = display.contentHeight/2
    
    local monsterShadow = display.newImage( "Images/monsterShadow.png" )
    monsterShadow.x = display.contentWidth/2
    monsterShadow.y = display.contentHeight/2

    local frontImage = display.newImage( "Images/monsterHall.png" )
    snapshot.canvas:insert(frontImage)
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
    
    function playSwampSounds()
       -- audio.setVolume(0.0)
       if nextTapped == false then
       soundPlaying = true
        swampPlay = audio.play(swampAmbience)
        audio.fade( {channel = swampPlay, time=3000, volume=1 } )
       end
    end
    --sceneGroup:insert(swampBackground)

local lizardSheet = graphics.newImageSheet("Sprites/lizardSprite.png", lizardsheetInfo:getSheet())

    local sequenceData =
    {name="lizard", start = 1, time = 3000, count=8}
    
    lizardSprite = display.newSprite(lizardSheet, sequenceData)
    lizardSprite.x = display.contentWidth*0.85
    lizardSprite.y = display.contentHeight*0.55
        
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

function monsterFade()
    transition.to(darkness, {alpha = 0, time=6000})
    transition.to(monsterShadow, {alpha = 0, time=9000})
end

function removeListeners()
    snapshot:removeEventListener( "touch", listener ) 
    Runtime:removeEventListener("accelerometer", accelerometerHandler)
end

    
    sceneGroup:insert(lizardSprite)
    sceneGroup:insert(emitter)
    sceneGroup:insert(snapshot)
    sceneGroup:insert(monsterShadow)
    sceneGroup:insert(darkness)
    sceneGroup:insert(nextPgBtn)
    
snapshot:addEventListener( "touch", listener ) 
Runtime:addEventListener("accelerometer", accelerometerHandler)


end
-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       local rubOutClosure = function() return rubPrompt.rubOutIndicator(nextTapped) end
     timer.performWithDelay(5000, rubOutClosure, 1)
    monsterFade()
      timer.performWithDelay(4000, playSwampSounds)
      start_particles()
      lizardSprite:play()
       local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
     --  timer.performWithDelay(20000, changePage10)
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
       audio.fadeOut( { channel=swampAmbience, time=1000 } )
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
    removeListeners()
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



