-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )
local composer = require "composer"
local widget = require("widget")
local swipeDistance = 40
local startTouchX = 0
local icons = {}
local soundtrack = audio.loadSound( "Sounds/SpookyPlayground2.wav" )
local movedPage = false

local pageChangeOptions = {
    effect = "fade",
    time = 1000
}

local soundOptions =
{
    loops = -1,
    fadein = 2000
}
-- load scene1
composer.gotoScene( "scenes.menu" )

local function changePage( )
        movedPage = true
        transition.to( sidebar, { time=500, x=-200 } )
        transition.to( homeBtn, { time=500, x=-100 } )
        composer.gotoScene( "scenes.menu", pageChangeOptions )
    return true
end

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
                transition.to( sidebar, { time=500, x=-200 } )
                transition.to( homeBtn, { time=500, x=-100 } )
            end
    end
    return true
end

audio.play(soundtrack, soundOptions)
audio.setVolume( 0.1)

local sidebarGroup = display.newGroup()
sidebarGroup:insert(sidebar)
sidebarGroup:insert(homeBtn)

--
---- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc)
--local function checkMem()
--    collectgarbage("collect")
--    local memUsage_str = string.format( "MEMORY= %.3f KB", collectgarbage( "count" ) )
--    print( memUsage_str .. " | TEXTURE= "..(system.getInfo("textureMemoryUsed")/1048576) )
--end
--timer.performWithDelay( 1000, checkMem, 0 )

Runtime:addEventListener("touch", revealSidebar)

