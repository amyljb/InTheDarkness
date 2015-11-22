--TOOLBOX PAGE
local sceneName = "scene4"
local composer = require( "composer" )
local scene = composer.newScene("scene4")
local physics = require("physics")
local nextSceneButton
local sceneNumber = 4
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local nextSceneNumber = "scenes.scene5"
local gameUI = require("gameUI")
local easingx  = require("easingx")
system.activate( "multitouch" )
Random = math.random

-- Load scene with same root filename as this file
local scene = composer.newScene( "scene4" )

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


function scene:create( event )
    local sceneGroup = self.view
    
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

-- Options table for the overlay scene "badgeOverlay.lua"
local overlayOptions2 = {
   isModal = true,
   effect = "crossFade",
   time = 400
}

--change page on button tap --ADD PERFORM WITH DELAY
local function changePage(event)
    if not (event.phase) then
          composer.gotoScene( "scenes.textPage", overlayOptions )
          return true
    end
    return true
end
    
    physics.start()
    physics.setGravity( 0, 0 )

    local backgroundThree = display.newImage("Images/toolboxBkg.png")
    backgroundThree.x = display.contentWidth/2
    backgroundThree.y = display.contentHeight/2
    local flashlight = display.newImage("Images/Tools/flashlight.png")
    flashlight.x = Random(50, display.contentWidth-100)
    flashlight.y = Random(50, display.contentHeight-100)
    local drill = display.newImage("Images/Tools/drill.png")
    drill.x = display.contentWidth/2 - 200
    drill.y = display.contentHeight/2 - 400
    local pliers = display.newImage("Images/Tools/pliers.jpg")
    pliers.x = display.contentWidth/2 + 300
    pliers.y = display.contentHeight/2 +200
    local screws = display.newImage("Images/Tools/screws.png")
    screws.x = display.contentWidth/2 +100
    screws.y = display.contentHeight/2 +100
    local staplegun = display.newImage("Images/Tools/staplegun.png")
    staplegun.x = display.contentWidth/2
    staplegun.y = display.contentHeight/2 
    local screwdriver = display.newImage("Images/Tools/screwdriver.png")
    screwdriver.x = display.contentWidth/2
    screwdriver.y = display.contentHeight/2
    local saw = display.newImage("Images/Tools/saw.jpg")
    saw.x = display.contentWidth/4
    saw.y = display.contentHeight/4
    local spanner = display.newImage("Images/Tools/spanner.png")
    spanner.x = display.contentWidth/2
    spanner.y = display.contentHeight/2
    local gloves = display.newImage("Images/Tools/gloves.png")
    gloves.x = display.contentWidth/3
    gloves.y = display.contentHeight/3
    local hardhat = display.newImage("Images/Tools/hardhat.png")
    hardhat.x = display.contentWidth/5
    hardhat.y = display.contentHeight/5
    local screwdriver2 = display.newImage("Images/Tools/screwdriver2.png")
    screwdriver2.x = display.contentWidth/3
    screwdriver2.y = display.contentHeight/3
    
    
    local text = display.newImage("Images/text3.png")
    text.x = display.contentWidth/2
    text.y = display.contentHeight/2 + 650
    
    local leftWall = display.newRect( 0, display.contentHeight/2, 5, display.contentHeight )
    physics.addBody(leftWall, "static", {friction=0, bounce=0.9 })
    local rightWall = display.newRect( display.contentWidth, display.contentHeight/2, 5, display.contentHeight )
    physics.addBody(rightWall, "static", {friction=0, bounce=0.9 })
    local ceiling = display.newRect(display.contentWidth/2, 0, display.contentWidth, 5 )
    physics.addBody(ceiling, "static", {friction=0, bounce=0.9 })
    local floor = display.newRect( display.contentWidth/2, display.contentHeight, display.contentWidth, 5)
    physics.addBody(floor, "static", {friction=0, bounce=0.9 })
    
    toolMaterial = { density=0.3, friction=0.6, radius=66.0 }
    
    physics.addBody (drill, "dynamic", toolMaterial )
    physics.addBody (pliers, "dynamic", toolMaterial )
    physics.addBody (screws, "dynamic", toolMaterial )
    physics.addBody (staplegun, "dynamic", toolMaterial )
    physics.addBody (screwdriver, "dynamic", toolMaterial )
    physics.addBody (saw, "dynamic", toolMaterial )
    physics.addBody (spanner, "dynamic", toolMaterial )
    physics.addBody (gloves, "dynamic", toolMaterial )
    physics.addBody (screwdriver2, "dynamic", toolMaterial )
    physics.addBody (hardhat, "dynamic", toolMaterial )
    drill.linearDamping = 0.8
    drill.angularDamping = 1
    pliers.linearDamping = 0.8
    pliers.angularDamping = 1
    screws.linearDamping = 0.8
    screws.angularDamping = 1
    staplegun.linearDamping = 0.8
    staplegun.angularDamping = 1
    screwdriver.linearDamping = 0.8
    screwdriver.angularDamping = 1
    saw.linearDamping = 0.8
    saw.angularDamping = 1
    spanner.linearDamping = 0.8
    spanner.angularDamping = 1
    gloves.linearDamping = 0.8
    gloves.angularDamping = 1
    screwdriver2.linearDamping = 0.8
    screwdriver2.angularDamping = 1
    hardhat.linearDamping = 0.8
    hardhat.angularDamping = 1
    
    local instructionText = display.newImage("Images/findTorchText.png")
    instructionText.x = display.contentWidth/2
    instructionText.y = display.contentHeight/2 
    instructionText.alpha = 0
     
        sceneGroup:insert(backgroundThree)
        sceneGroup:insert(flashlight)
        sceneGroup:insert(drill)
        sceneGroup:insert(pliers)
        sceneGroup:insert(screws)
        sceneGroup:insert(staplegun)
        sceneGroup:insert(screwdriver)
        sceneGroup:insert(saw)
        sceneGroup:insert(spanner)
        sceneGroup:insert(gloves)
        sceneGroup:insert(hardhat)
        sceneGroup:insert(screwdriver2)
        sceneGroup:insert(text)
        sceneGroup:insert(instructionText)
        sceneGroup:insert(floor)
        sceneGroup:insert(ceiling)
        sceneGroup:insert(leftWall)
        sceneGroup:insert(rightWall)

function textDelete()
   instructionText.alpha = 0
end   
function scaleDown()
    transition.scaleTo( instructionText, { xScale=1.0, yScale=1.0, time=1000, onComplete=textDelete } )    
end    
function textPlay()
    instructionText.alpha = 1
    transition.scaleTo( instructionText, { xScale=1.1, yScale=1.1, time=1000, onComplete=scaleDown}) 
end  

    
    local function dragBody( event )
	return gameUI.dragBody( event )
    end
    
    function foundTorch()
        transition.scaleTo( flashlight, { xScale=2, yScale=2, rotation =720, time=700}) 
        composer.showOverlay( "scenes.badgeOverlay", overlayOptions2 )
        timer.performWithDelay(2500, changePage)
end

--CAUSES LOADS OF PROBLEMS - FIRES NEXT SCENE TWICE???/
--function torchAnimate()
  -- transition.scaleTo( flashlight, { xScale=2, yScale=2, rotation =720, time=700, onComplete=changePage}) 
--end
     
    drill:addEventListener("touch", dragBody)
    pliers:addEventListener("touch", dragBody)
    screws:addEventListener("touch", dragBody)
    staplegun:addEventListener("touch", dragBody)
    screwdriver:addEventListener("touch", dragBody)
    saw:addEventListener("touch", dragBody)
    spanner:addEventListener("touch", dragBody)
    gloves:addEventListener("touch", dragBody)
    screwdriver2:addEventListener("touch", dragBody)
    hardhat:addEventListener("touch", dragBody)
    flashlight:addEventListener("tap", foundTorch)
    flashlight:addEventListener("touch", foundTorch)
    
    function removeEventListeners3()
        print("removeEventListeners called scene 3")  
        drill:removeEventListener("touch", dragBody)
        pliers:removeEventListener("touch", dragBody)
        screws:removeEventListener("touch", dragBody)
        staplegun:removeEventListener("touch", dragBody)
        screwdriver:removeEventListener("touch", dragBody)
        saw:removeEventListener("touch", dragBody)
        spanner:removeEventListener("touch", dragBody)
        gloves:removeEventListener("touch", dragBody)
        hardhat:removeEventListener("touch", dragBody)
        screwdriver2:removeEventListener("touch", dragBody)
      --  flashlight:removeEventListener("touch", changePage)
    end
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is off screen and is about to move on screen
    elseif phase == "did" then
        local previous =  composer.getSceneName( "previous" )
             if previous ~= "main" and previous then
                composer.removeScene(previous, false)       -- remove previous scene from memory
            end
        timer.performWithDelay(1000,textPlay)
    end 
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
    elseif phase == "did" then
        -- Called when the scene is now off screen
    end 
end


function scene:destroy( event )
    local sceneGroup = self.view
    removeEventListeners3()
end

-------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-------------------------------------------------------------------------------

return scene




