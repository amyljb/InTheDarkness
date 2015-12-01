--HALLWAY PAGE 
--CHANGE JOINT SECTION NAMES
local composer = require( "composer" )
local physics = require('physics')
local widget = require("widget")
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local changePg = require("changePg")
local instructionFunc = require("modules.instructionFunc")
local scene = composer.newScene( "scene3" )
local sceneName = "scene3"
local ropeParts = display.newGroup()
local nextSceneButton
local sceneNumber = 3
local nextSceneNumber = "scenes.scene4"
local previousScene = "scenes.scene2"
local nextSceneButton
local numTapped = 0
local light = 5
Random = math.random
local movedPage = false

-- Load scene with same root filename as this file
local scene = composer.newScene( "scene2" )
local l1 = {{0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 2, 0, 0, 0, 0, 0},}
--options table for next page transitions
local options = {
    effect = "crossFade",
    time = 2000
}

--    Create a scene object based on data read from data.json
local sceneObject = BaseScene:new({
    name = sceneName,
    data = sceneData[sceneNumber],
    transitions = {},
    nextScene = nextSceneNumber
})

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:create( event )
    local sceneGroup = self.view
    physics.start()
    --    Initialize the scene
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

--change page on button tap --ADD PERFORM WITH DELAY
local function changePage()
    print("changing pg")
    movedPage = true
    nextClosure()
    return true
end

    local spawnTable = {}

    local backgroundOne = display.newImage("Images/page3_hall.png", true)
    backgroundOne.x = display.contentWidth/2
    backgroundOne.y = display.contentHeight/2
    
    instructions = display.newImage("Images/ghostInstructions.png", true)
    instructions.x = display.contentWidth/2
    instructions.y = display.contentHeight/2
    instructions.alpha=0
    
    local myText = display.newText( "0", 1875, 150, native.systemFont, 150 )
    myText:setFillColor( 0, 0, 0 )
 
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
           
    sceneGroup:insert(backgroundOne)
    sceneGroup:insert(nextPgBtn) 
    sceneGroup:insert(myText)
    sceneGroup:insert(instructions)
    sceneGroup:insert(previousBtn)
  
 local function checkTaps()
    if numTapped == 10 then
        composer.showOverlay( "scenes.badgeOverlay", overlayOptions )
    end
end

--Function to spawn first ghost
function spawnGhost1()
    if movedPage == false and numTapped < 10 then
        local sheetInfo = require("Sprites.ghost1Sprite")
        local ghostSheet1 = graphics.newImageSheet( "Sprites/ghost1Sprite.png", sheetInfo:getSheet() )
        local sequenceDataG1 =
            {name="floating", start = 1, time = 800, loopCount = 0, count=6}  
    
        local ghostSprite1 = display.newSprite(ghostSheet1, sequenceDataG1)
        ghostSprite1.x = display.contentWidth*1.5 --Random(50, _W-50)
        ghostSprite1.y = Random(100, display.contentHeight-200) --display.contentHeight/5  
        ghostSprite1:play()
        
        transition.to(ghostSprite1, {x=-display.contentWidth, time=12000})
        sceneGroup:insert(ghostSprite1)
        ghostSprite1:addEventListener("tap", removeGhost)
    return ghostSprite1  
    end 
end  
    
--Function to spawn first ghost
function spawnGhost2()
    if movedPage == false and numTapped < 10 then
        local sheetInfo3 = require("Sprites.smallGhost")
        local smallGhostSheet = graphics.newImageSheet( "Sprites/smallGhost.png", sheetInfo3:getSheet() )
        local sequenceData3 =
            {name="smallGhost", start = 1, time = 1000, loopCount = 0, count=4}  
    
        smallGhost = display.newSprite(smallGhostSheet, sequenceData3)
        smallGhost.x = -200
        smallGhost.y = Random(100, display.contentHeight)
        smallGhost:play()
        transition.to(smallGhost, {x=display.contentWidth+1000, time=12000})    
        sceneGroup:insert(smallGhost)
        smallGhost:addEventListener("tap", removeGhost)
    return smallGhost  
    end 
end      
           
function loadLight()
	for i = 1, 10 do
            for j = 1, 10 do
		if(l1[j][i] == 1) then
				hang = display.newImage('Images/hang.png', i*31, j*32)
                                hang.x = display.contentWidth/2
                                hang.y = - 100
				physics.addBody(hang, 'static', {radius = 8})
                                sceneGroup:insert(hang)
				
				shade = display.newImage('Images/shade.png', display.contentWidth/2, 700 + (90))
				physics.addBody(shade, 'dynamic', {shape = {-21.5, -5.5, 18.5, -12.5, 20.5, 2.5, -18.5, 11.5}})
                                sceneGroup:insert(shade)
                        end
		end
	end
	
	-- Add Rope
	
	for k = 1, 8 do
		local ropePart = display.newImage('Images/rope.png', hang.x - 3, (hang.y-3) + k*10) --10 = rope part height
		ropePart.name = 'rope'
		
		physics.addBody(ropePart)
		ropeParts:insert(ropePart)
                sceneGroup:insert(ropeParts)
		
		-- Hang joint
		
		if(k == 1) then
			local hangJoint = physics.newJoint('pivot', hang, ropePart, hang.x - 3, hang.y)
		end
		
		-- Rope Joints
		
		if(k > 1) then
			local joint = physics.newJoint('pivot', ropeParts[k-1], ropeParts[k], hang.x - 3, ropePart.y)
		end
		
		-- Bone joint
		
		if(k == 8) then
			local boneJoint = physics.newJoint('pivot', ropePart, shade, hang.x - 3, ropePart.y)
		end
	end
end
   
     --remove event listeners - called in scene destroy   
    function removeEventListeners2()
        print("removeEventListeners called scene 2")
        backgroundOne:removeEventListener("touch", changePage)
    end
    
    function removeGhost(event)
        event.target:removeSelf()
        numTapped = numTapped + 1
        myText.text = numTapped
        checkTaps()
    end
    
   loadLight() 

end 

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        
    elseif phase == "did" then
        local instructionsClosure = function() return instructionFunc.playInstructions(instructions) end
        timer.performWithDelay(1000, instructionsClosure, 1)
        timer.performWithDelay(4500, spawnGhost1, 10)
        timer.performWithDelay(4000, spawnGhost2, 10)
       -- timer.performWithDelay(1000, playInstructions)
         local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
        
    end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        physics.pause()
    elseif phase == "did" then
    
    end 
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function scene:destroy( event )
    local sceneGroup = self.view
    print("destroying scene2") 
    transition.cancel(scaleTrans)
    removeEventListeners2()  
end

-------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-------------------------------------------------------------------------------

return scene

