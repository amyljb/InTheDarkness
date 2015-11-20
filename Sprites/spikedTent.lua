--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1d41e58d6723b9fca23c8a8e6fa09bd2:0c15b80deab6efec64a0e015154201f1:3e5459fcc5e01963ef462ca2d84f555b$
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
            -- spikedTent1
            x=250,
            y=2,
            width=246,
            height=450,

            sourceX = 26,
            sourceY = 0,
            sourceWidth = 300,
            sourceHeight = 470
        },
        {
            -- spikedTent2
            x=2,
            y=2,
            width=246,
            height=460,

            sourceX = 26,
            sourceY = 10,
            sourceWidth = 300,
            sourceHeight = 470
        },
        {
            -- spikedTent3
            x=498,
            y=2,
            width=267,
            height=425,

            sourceX = 23,
            sourceY = 8,
            sourceWidth = 300,
            sourceHeight = 470
        },
        {
            -- spikedTent4
            x=767,
            y=2,
            width=268,
            height=396,

            sourceX = 23,
            sourceY = 8,
            sourceWidth = 300,
            sourceHeight = 470
        },
        {
            -- spikedTent5
            x=498,
            y=2,
            width=267,
            height=425,

            sourceX = 23,
            sourceY = 8,
            sourceWidth = 300,
            sourceHeight = 470
        },
        {
            -- spikedTent6
            x=2,
            y=2,
            width=246,
            height=460,

            sourceX = 26,
            sourceY = 10,
            sourceWidth = 300,
            sourceHeight = 470
        },
    },
    
    sheetContentWidth = 1037,
    sheetContentHeight = 464
}

SheetInfo.frameIndex =
{

    ["spikedTent1"] = 1,
    ["spikedTent2"] = 2,
    ["spikedTent3"] = 3,
    ["spikedTent4"] = 4,
    ["spikedTent5"] = 5,
    ["spikedTent6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
