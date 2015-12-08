--FREDDIE COLD - bridging scene
local composer = require( "composer" )
local changePg = require("changePg")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local scene = composer.newScene("scene14")
local sceneName = "scene14"
local sceneNumber = 14
local nextSceneNumber = "scenes.scene15"
local previousScene = "scenes.scene13"
local widget = require("widget")
local movedPage = false
local previousX, previousY
local threshold = 10
local thresholdSq = threshold*threshold
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
        print("next page")
        nextClosure()  
    else if event.target.id == "previous" then
        previousClosure()
        print("previous")
    end
    return true
    end
end

freddieCold = display.newImage( "Images/freddieCold.png", true )
freddieCold.x=display.contentWidth/2
freddieCold.y=display.contentHeight/2

local breath = display.newImage( "Images/breath.png" )

local snapshot = display.newSnapshot(2048, 1536)
snapshot:translate( display.contentWidth/2, display.contentHeight/2 )
snapshot.alpha=0
snapshot.canvas:insert(breath)
snapshot:invalidate( "canvas" )
    
    local nextPgBtn = widget.newButton
{
    width = 120,
    height = 250,
    id ="nextPage",
    defaultFile = "Images/nextBtn.png",
    overFile = "Images/nextBtnOver.png",
    x = display.contentWidth*0.95,
    y = display.contentHeight*0.85,
    id = "next",
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
    id = "previous",
    onRelease = changePage
}
previousBtn.rotation = -180

    local function draw( x, y )
	local o = display.newImage( "Images/brush.png", x, y )
	o.fill.blendMode = { srcColor = "zero", dstColor="oneMinusSrcAlpha" }

	snapshot.canvas:insert( o )
	snapshot:invalidate( "canvas" ) -- accumulate changes w/o clearing
    end

    local function listener( event )
        print("listening")
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
                       
		end
	end
    end

function changeAlpha()
   transition.to(snapshot, {alpha=1, time = 4500})
end

sceneGroup:insert(freddieCold)
sceneGroup:insert(snapshot)
sceneGroup:insert(nextPgBtn)
sceneGroup:insert(previousBtn)

snapshot:addEventListener( "touch", listener ) 

end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
       timer.performWithDelay(1000, changeAlpha)
       
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

