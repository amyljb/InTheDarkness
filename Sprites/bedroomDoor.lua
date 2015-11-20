--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d270a4eb1fdd464930827da013cfbf5a:a85757879d0ebb0ab0423dabd1119860:fc3e8dcc44e06c2f093a7560f2a95b48$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- door1
            x=577,
            y=1190,
            width=550,
            height=1044,

            sourceX = 46,
            sourceY = 222,
            sourceWidth = 650,
            sourceHeight = 1450
        },
        {
            -- door2
            x=577,
            y=2,
            width=580,
            height=1186,

            sourceX = 52,
            sourceY = 141,
            sourceWidth = 650,
            sourceHeight = 1450
        },
        {
            -- door3
            x=2,
            y=2,
            width=573,
            height=1417,

            sourceX = 55,
            sourceY = 19,
            sourceWidth = 650,
            sourceHeight = 1450
        },
        {
            -- door4
            x=1159,
            y=2,
            width=575,
            height=1414,

            sourceX = 58,
            sourceY = 16,
            sourceWidth = 650,
            sourceHeight = 1450
        },
    },
    
    sheetContentWidth = 1736,
    sheetContentHeight = 2236
}

SheetInfo.frameIndex =
{

    ["door1"] = 1,
    ["door2"] = 2,
    ["door3"] = 3,
    ["door4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
