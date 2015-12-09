--TOOLBOX PAGE
local sceneName = "scene4"
local composer = require( "composer" )
local sceneData = require("loadData")
local BaseScene = require "BaseScene"
local instructionFunc = require("modules.instructionFunc")
local gameUI = require("gameUI")
local easingx  = require("easingx")
local physics = require("physics")
local changePg = require("changePg")
local widget = require("widget")
local scene = composer.newScene("scene4")
local nextSceneButton
local sceneNumber = 4
local nextSceneNumber = "scenes.scene5"
local previousScene = "scenes.scene3"
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

--closures that pass params to changePg module
local previousClosure = function() return changePg.loadPrevious( previousScene, movedPage ) end
local nextClosure = function() return changePg.loadNext( overlayOptions, movedPage ) end  

--change page on button tap
local function changePage()
        nextClosure()
        return true
end
    --start physics and set gravity
    physics.start()
    physics.setGravity( 0, 0 )
    
    --setup buttons
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
 
 --setup page images
    local backgroundThree = display.newImage("Images/toolboxBkg.png")
    backgroundThree.x = display.contentWidth/2
    backgroundThree.y = display.contentHeight/2
    local flashlight = display.newImage("Images/Tools/flashlight.png")
    flashlight.x = Random(50, display.contentWidth-100)
    flashlight.y = Random(50, display.contentHeight-100)
    local drill = display.newImage("Images/Tools/drill.png")
    drill.x = Random(50, display.contentWidth-100)
    drill.y = Random(50, display.contentHeight-100)
    local pliers = display.newImage("Images/Tools/pliers.jpg")
    pliers.x = Random(50, display.contentWidth-100)
    pliers.y = Random(50, display.contentHeight-100)
    local screws = display.newImage("Images/Tools/screws.png")
    screws.x = Random(50, display.contentWidth-100)
    screws.y = Random(50, display.contentHeight-100)
    local staplegun = display.newImage("Images/Tools/staplegun.png")
    staplegun.x = Random(50, display.contentWidth-100)
    staplegun.y = Random(50, display.contentHeight-100)
    local screwdriver = display.newImage("Images/Tools/screwdriver.png")
    screwdriver.x = Random(50, display.contentWidth-100)
    screwdriver.y = Random(50, display.contentHeight-100)
    local saw = display.newImage("Images/Tools/saw.jpg")
    saw.x = Random(50, display.contentWidth-100)
    saw.y = Random(50, display.contentHeight-100)
    local spanner = display.newImage("Images/Tools/spanner.png")
    spanner.x = Random(50, display.contentWidth-100)
    spanner.y = Random(50, display.contentHeight-100)
    local gloves = display.newImage("Images/Tools/gloves.png")
    gloves.x = Random(50, display.contentWidth-100)
    gloves.y = Random(50, display.contentHeight-100)
    local hardhat = display.newImage("Images/Tools/hardhat.png")
    hardhat.x = Random(50, display.contentWidth-100)
    hardhat.y = Random(50, display.contentHeight-100)
    local screwdriver2 = display.newImage("Images/Tools/screwdriver2.png")
    screwdriver2.x = Random(50, display.contentWidth-100)
    screwdriver2.y = Random(50, display.contentHeight-100)
    
    local drill2 = display.newImage("Images/Tools/drill.png")
    drill2.x = Random(50, display.contentWidth-100)
    drill2.y = Random(50, display.contentHeight-100)
    local pliers2 = display.newImage("Images/Tools/pliers.jpg")
    pliers2.x = Random(50, display.contentWidth-100)
    pliers2.y = display.contentHeight/2 +200
    local screws2 = display.newImage("Images/Tools/screws.png")
    screws2.x = Random(50, display.contentWidth-100)
    screws2.y = display.contentHeight/2 +100
    local staplegun2 = display.newImage("Images/Tools/staplegun.png")
    staplegun2.x = Random(50, display.contentWidth-100)
    staplegun2.y = display.contentHeight/2 
    local saw2 = display.newImage("Images/Tools/saw.jpg")
    saw2.x = Random(50, display.contentWidth-100)
    saw2.y = display.contentHeight/4
    local spanner2 = display.newImage("Images/Tools/spanner.png")
    spanner2.x = Random(50, display.contentWidth-100)
    spanner2.y = display.contentHeight/2
    local gloves2 = display.newImage("Images/Tools/gloves.png")
    gloves2.x = Random(50, display.contentWidth-100)
    gloves2.y = display.contentHeight/3
    local hardhat2 = display.newImage("Images/Tools/hardhat.png")
    hardhat2.x = Random(50, display.contentWidth-100)
    hardhat2.y = display.contentHeight/5
    local screwdriver3 = display.newImage("Images/Tools/screwdriver2.png")
    screwdriver3.x = Random(50, display.contentWidth-100)
    screwdriver3.y = display.contentHeight/3
    
    --create static walls as boundaries for objects
    local leftWall = display.newRect( 0, display.contentHeight/2, 5, display.contentHeight )
    physics.addBody(leftWall, "static", {friction=0, bounce=0.9 })
    local rightWall = display.newRect( display.contentWidth, display.contentHeight/2, 5, display.contentHeight )
    physics.addBody(rightWall, "static", {friction=0, bounce=0.9 })
    local ceiling = display.newRect(display.contentWidth/2, 0, display.contentWidth, 5 )
    physics.addBody(ceiling, "static", {friction=0, bounce=0.9 })
    local floor = display.newRect( display.contentWidth/2, display.contentHeight, display.contentWidth, 5)
    physics.addBody(floor, "static", {friction=0, bounce=0.9 })
    
    --properties for tools
    toolMaterial = { density=0.3, friction=0.6, radius=66.0 }
    
    --add physics to tools
    physics.addBody (drill, "dynamic", toolMaterial )
    physics.addBody (pliers, "dynamic", toolMaterial )
    physics.addBody (screws, "dynamic", toolMaterial )
    physics.addBody (staplegun, "dynamic", toolMaterial )
    physics.addBody (screwdriver, "dynamic", toolMaterial )
    physics.addBody (saw, "dynamic", toolMaterial )
    physics.addBody (spanner, "dynamic", toolMaterial )
    physics.addBody (gloves, "dynamic", toolMaterial )
    physics.addBody (hardhat, "dynamic", toolMaterial )
    physics.addBody (drill2, "dynamic", toolMaterial )
    physics.addBody (pliers2, "dynamic", toolMaterial )
    physics.addBody (screws2, "dynamic", toolMaterial )
    physics.addBody (staplegun2, "dynamic", toolMaterial )
    physics.addBody (screwdriver2, "dynamic", toolMaterial )
    physics.addBody (saw2, "dynamic", toolMaterial )
    physics.addBody (spanner2, "dynamic", toolMaterial )
    physics.addBody (gloves2, "dynamic", toolMaterial )
    physics.addBody (screwdriver3, "dynamic", toolMaterial )
    physics.addBody (hardhat2, "dynamic", toolMaterial )
    --apply angular/linear damping 
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
    drill2.linearDamping = 0.8
    drill2.angularDamping = 1
    pliers2.linearDamping = 0.8
    pliers2.angularDamping = 1
    screws2.linearDamping = 0.8
    screws2.angularDamping = 1
    staplegun2.linearDamping = 0.8
    staplegun2.angularDamping = 1
    screwdriver2.linearDamping = 0.8
    screwdriver2.angularDamping = 1
    saw2.linearDamping = 0.8
    saw2.angularDamping = 1
    spanner2.linearDamping = 0.8
    spanner2.angularDamping = 1
    gloves2.linearDamping = 0.8
    gloves2.angularDamping = 1
    screwdriver3.linearDamping = 0.8
    screwdriver3.angularDamping = 1
    hardhat2.linearDamping = 0.8
    hardhat2.angularDamping = 1
    
    instructions = display.newImage("Images/findTorchText.png")
    instructions.x = display.contentWidth/2
    instructions.y = display.contentHeight/2 
    instructions.alpha = 0
     
    --insert display objects into sceneGroup  
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
        sceneGroup:insert(drill2)
        sceneGroup:insert(pliers2)
        sceneGroup:insert(screws2)
        sceneGroup:insert(staplegun2)
        sceneGroup:insert(saw2)
        sceneGroup:insert(spanner2)
        sceneGroup:insert(gloves2)
        sceneGroup:insert(hardhat2)
        sceneGroup:insert(screwdriver3)      
        sceneGroup:insert(instructions)
        sceneGroup:insert(floor)
        sceneGroup:insert(ceiling)
        sceneGroup:insert(leftWall)
        sceneGroup:insert(rightWall)
        sceneGroup:insert(previousBtn)
  
  --adds drag to each objects using corona's gameUI
    local function dragBody( event )
	return gameUI.dragBody( event )
    end    
    
    function foundTorch()
        transition.scaleTo( flashlight, { xScale=2, yScale=2, rotation =720, time=700}) 
        composer.showOverlay( "scenes.badgeOverlay", overlayOptions2 )
        timer.performWithDelay(2500, changePage)
end

--add event listeners to all tools
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
    drill2:addEventListener("touch", dragBody)
    pliers2:addEventListener("touch", dragBody)
    screws2:addEventListener("touch", dragBody)
    staplegun2:addEventListener("touch", dragBody)
    saw2:addEventListener("touch", dragBody)
    spanner2:addEventListener("touch", dragBody)
    gloves2:addEventListener("touch", dragBody)
    screwdriver3:addEventListener("touch", dragBody)
    hardhat2:addEventListener("touch", dragBody)
    
    flashlight:addEventListener("touch", foundTorch)
    
    --function to remove event listeners
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
            
        local instructionsClosure = function() return instructionFunc.playInstructions(instructions) end
        timer.performWithDelay(1000, instructionsClosure, 1)
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




