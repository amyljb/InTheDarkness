-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- require the composer library
local composer = require "composer"
local widget = require("widget")
local swipeDistance = 40
local startTouchX = 0
local icons = {}
local pageChangeOptions = {
    effect = "fade",
    time = 1000
}
-- load scene1
composer.gotoScene( "scenes.menu" )

local function changePage( )
        composer.gotoScene( "scenes.menu", pageChangeOptions )
    return true
end

--local function goBack( )
 --   local previous =  composer.getSceneName( "previous" )
             --if previous ~= "main" and previous then
    --            composer.gotoScene(previous, pageChangeOptions)       -- remove previous scene from memory
            --end
   -- return true
--end

 local sidebar = display.newImage("Images/sidebar.png", true)
    sidebar.x = -200
    sidebar.y = display.contentHeight/2


   local homeBtn = widget.newButton
{
    width = 100,
    height = 100,
    id ="playFull",
    defaultFile = "Images/homeBtn.png",
    x = -100,
    y = 100,
    onEvent = changePage
}

-- swipe handler function - launches parallax effect
function revealSidebar(event)
    if event.phase== "began" then
        startTouchX = event.x
    end
    if event.phase == "ended" and startTouchX <=100 then
        if event.x > startTouchX + swipeDistance then
            print("swiped right")
            transition.to( sidebar, { time=500, x=100 } )
            transition.to( homeBtn, { time=500, x=100 } )
        end
        else if startTouchX > 0 and event.x < startTouchX + swipeDistance then
                transition.to( sidebar, { time=500, x=-100 } )
                transition.to( homeBtn, { time=500, x=-100 } )
            end
    end
    return true
end

local sidebarGroup = display.newGroup()
sidebarGroup:insert(sidebar)
sidebarGroup:insert(homeBtn)

Runtime:addEventListener("touch", revealSidebar)

