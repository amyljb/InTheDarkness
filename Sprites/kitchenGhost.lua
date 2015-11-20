--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7538e6129bce891681921a91e0ae93f9:c8f270ca64ca297f59debadc4e7ec9a6:e85d4dd7652e46097414d71993e7a644$
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
            -- kitchenGhost1
            x=1490,
            y=866,
            width=740,
            height=830,

            sourceX = 25,
            sourceY = 11,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- kitchenGhost2
            x=1492,
            y=2,
            width=738,
            height=813,

            sourceX = 22,
            sourceY = 10,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- kitchenGhost3
            x=747,
            y=866,
            width=741,
            height=841,

            sourceX = 21,
            sourceY = 11,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- kitchenGhost4
            x=2,
            y=2,
            width=743,
            height=881,

            sourceX = 21,
            sourceY = 11,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- kitchenGhost5
            x=747,
            y=2,
            width=743,
            height=862,

            sourceX = 22,
            sourceY = 11,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- kitchenGhost6
            x=2,
            y=885,
            width=743,
            height=818,

            sourceX = 22,
            sourceY = 14,
            sourceWidth = 800,
            sourceHeight = 900
        },
    },
    
    sheetContentWidth = 2232,
    sheetContentHeight = 1709
}

SheetInfo.frameIndex =
{

    ["kitchenGhost1"] = 1,
    ["kitchenGhost2"] = 2,
    ["kitchenGhost3"] = 3,
    ["kitchenGhost4"] = 4,
    ["kitchenGhost5"] = 5,
    ["kitchenGhost6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
