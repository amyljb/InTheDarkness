--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:11916dcbd65d7f1cc2d229f0d3c5dc92:4ad6561565ed03612d7751dada861180:1642d6a12398dda40c91a4f25eae391d$
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
            -- dustCloud1
            x=1729,
            y=749,
            width=316,
            height=312,

            sourceX = 311,
            sourceY = 313,
            sourceWidth = 900,
            sourceHeight = 900
        },
        {
            -- dustCloud2
            x=2,
            y=792,
            width=868,
            height=725,

            sourceX = 11,
            sourceY = 66,
            sourceWidth = 900,
            sourceHeight = 900
        },
        {
            -- dustCloud3
            x=1647,
            y=2,
            width=853,
            height=745,

            sourceX = 27,
            sourceY = 66,
            sourceWidth = 900,
            sourceHeight = 900
        },
        {
            -- dustCloud4
            x=872,
            y=769,
            width=855,
            height=737,

            sourceX = 21,
            sourceY = 81,
            sourceWidth = 900,
            sourceHeight = 900
        },
        {
            -- dustCloud5
            x=2,
            y=2,
            width=816,
            height=788,

            sourceX = 43,
            sourceY = 44,
            sourceWidth = 900,
            sourceHeight = 900
        },
        {
            -- dustCloud6
            x=820,
            y=2,
            width=825,
            height=765,

            sourceX = 41,
            sourceY = 68,
            sourceWidth = 900,
            sourceHeight = 900
        },
    },
    
    sheetContentWidth = 2502,
    sheetContentHeight = 1519
}

SheetInfo.frameIndex =
{

    ["dustCloud1"] = 1,
    ["dustCloud2"] = 2,
    ["dustCloud3"] = 3,
    ["dustCloud4"] = 4,
    ["dustCloud5"] = 5,
    ["dustCloud6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
