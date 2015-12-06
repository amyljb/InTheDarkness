--TIRED - Z'S
--change?? bridging pg
local composer = require( "composer" )
local widget = require("widget")
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local scene = composer.newScene("scene18")
local sceneName = "scene18"
local sceneNumber = 18
local nextSceneNumber = "scenes.scene19"
local previousScene = "scenes.scene17"
local myZ
--Find device display height and width
_H = display.contentHeight
_W = display.contentWidth
Random = math.random
--Number of Zs variable
numZs = 0
-- How many Zs do we start with?
totalZs = 20

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

local function changePage( event )
        composer.gotoScene( "scenes.textPage", overlayOptions )
    return true
end

-- 1. Start the physics engine
physics.start()
-- 2. Set gravity to be inverted
physics.setGravity(0, -0.8)
local tiredBkg = display.newImage( "Images/tired.png", true )
tiredBkg.x=display.contentWidth/2
tiredBkg.y=display.contentHeight/2
local leftWall = display.newRect (0, 0, 1, display.contentHeight)
local rightWall = display.newRect (display.contentWidth, 0, 1, display.contentHeight)

    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.85,
    onRelease = nextClosure
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

--leftWall:setStrokeColor( 1, 0, 0 )
--rightWall:setStrokeColor( 1, 0, 0 )

-- Add physics to the walls. They will not move so they will be "static"
physics.addBody (leftWall, "static",  { bounce = 1 } );
physics.addBody (rightWall, "static", { bounce = 1 } );

sceneGroup:insert(tiredBkg)
sceneGroup:insert(leftWall)
sceneGroup:insert(rightWall)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(previousBtn)

function startZs()
-- Create an image, 250 pixels by 250 pixels
myZ = display.newImageRect("Images/z.png", 250, 250)
	-- Set the reference point to the center of the image
        myZ.anchorX = _W/2
	
	-- Generate Zs randomly on the X-coordinate
	myZ.x = Random(50, _W-50)
	
	-- Generate Zs 10 pixels off screen on the Y-Coordinate
	myZ.y = (_H+300)
	
	-- Apply physics engine to the Zs, set density, friction, bounce and radius
	physics.addBody(myZ, "dynamic", {density=0.1, friction=0.1, bounce=1.5, radius=125})

	-- Increment the Zs variable by 1 for each balloon created
	numZs = numZs + 1
        sceneGroup:insert(myZ)
end

end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       zTimer = timer.performWithDelay(20, startZs, totalZs);
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
   timer.cancel(zTimer)

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene

