--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2c4b32e1657aa442b742a14835175c96:8b2af9ca8f25583a6e51c1fb8a9264c1:8ce65f41f70ff582c4713c180f911d86$
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
            -- 15
            x=1,
            y=1,
            width=652,
            height=673,

            sourceX = 4,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 16
            x=655,
            y=1,
            width=652,
            height=673,

            sourceX = 4,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 17
            x=1,
            y=676,
            width=652,
            height=673,

            sourceX = 4,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 18
            x=1,
            y=1351,
            width=652,
            height=673,

            sourceX = 4,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 19
            x=655,
            y=676,
            width=652,
            height=673,

            sourceX = 4,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 20
            x=655,
            y=1351,
            width=652,
            height=673,

            sourceX = 4,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
    },
    
    sheetContentWidth = 1308,
    sheetContentHeight = 2025
}

SheetInfo.frameIndex =
{

    ["15"] = 1,
    ["16"] = 2,
    ["17"] = 3,
    ["18"] = 4,
    ["19"] = 5,
    ["20"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
