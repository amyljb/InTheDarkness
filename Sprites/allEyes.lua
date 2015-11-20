--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a7822d0fd0cd503c31fae6514d9b8521:c3fe95fb533ee812abeff6fd4b4d59de:2fc32d4ab0d0e9e212cac8e7ad7e2ecd$
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
            -- allEyes1
            x=1758,
            y=1088,
            width=1571,
            height=1042,

            sourceX = 27,
            sourceY = 14,
            sourceWidth = 1800,
            sourceHeight = 1100
        },
        {
            -- allEyes2
            x=2,
            y=2178,
            width=1669,
            height=1035,

            sourceX = 111,
            sourceY = 16,
            sourceWidth = 1800,
            sourceHeight = 1100
        },
        {
            -- allEyes3
            x=2,
            y=2,
            width=1754,
            height=1086,

            sourceX = 26,
            sourceY = 14,
            sourceWidth = 1800,
            sourceHeight = 1100
        },
        {
            -- allEyes4
            x=1758,
            y=2132,
            width=1537,
            height=568,

            sourceX = 60,
            sourceY = 527,
            sourceWidth = 1800,
            sourceHeight = 1100
        },
        {
            -- allEyes5
            x=1758,
            y=2,
            width=1571,
            height=1084,

            sourceX = 27,
            sourceY = 16,
            sourceWidth = 1800,
            sourceHeight = 1100
        },
        {
            -- allEyes6
            x=2,
            y=1090,
            width=1754,
            height=1086,

            sourceX = 27,
            sourceY = 9,
            sourceWidth = 1800,
            sourceHeight = 1100
        },
    },
    
    sheetContentWidth = 3331,
    sheetContentHeight = 3215
}

SheetInfo.frameIndex =
{

    ["allEyes1"] = 1,
    ["allEyes2"] = 2,
    ["allEyes3"] = 3,
    ["allEyes4"] = 4,
    ["allEyes5"] = 5,
    ["allEyes6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
