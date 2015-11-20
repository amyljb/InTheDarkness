--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:bd55cdade2b5d80832793c815673c018:69339c0785d2437be4abd15b19166c38:1bf81ec260ed7010a9b0b94bd7ff79e3$
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
            -- soundText1
            x=1755,
            y=1,
            width=136,
            height=156,

            sourceX = 352,
            sourceY = 728,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- soundText2
            x=1224,
            y=343,
            width=322,
            height=306,

            sourceX = 352,
            sourceY = 578,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- soundText3
            x=1224,
            y=1,
            width=529,
            height=340,

            sourceX = 352,
            sourceY = 544,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- soundText4
            x=1131,
            y=664,
            width=775,
            height=340,

            sourceX = 352,
            sourceY = 544,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- soundText5
            x=1010,
            y=1261,
            width=873,
            height=435,

            sourceX = 352,
            sourceY = 449,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- soundText6
            x=1,
            y=1261,
            width=1007,
            height=498,

            sourceX = 352,
            sourceY = 386,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- soundText7
            x=1,
            y=664,
            width=1128,
            height=595,

            sourceX = 352,
            sourceY = 289,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- soundText8
            x=1,
            y=1,
            width=1221,
            height=661,

            sourceX = 352,
            sourceY = 223,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
    },
    
    sheetContentWidth = 1907,
    sheetContentHeight = 1760
}

SheetInfo.frameIndex =
{

    ["soundText1"] = 1,
    ["soundText2"] = 2,
    ["soundText3"] = 3,
    ["soundText4"] = 4,
    ["soundText5"] = 5,
    ["soundText6"] = 6,
    ["soundText7"] = 7,
    ["soundText8"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
