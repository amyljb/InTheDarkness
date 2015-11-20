--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:12973c6334a99d88f5ef9f4b0d3be089:ce8eced3fd37adfa7d5cec7a874656be:024da7c7f0345124c8ff8d3a497abadc$
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
            -- braveryBar1
            x=2,
            y=2,
            width=746,
            height=175,

            sourceX = 28,
            sourceY = 25,
            sourceWidth = 800,
            sourceHeight = 200
        },
        {
            -- braveryBar2
            x=2,
            y=179,
            width=746,
            height=175,

            sourceX = 28,
            sourceY = 25,
            sourceWidth = 800,
            sourceHeight = 200
        },
        {
            -- braveryBar3
            x=2,
            y=356,
            width=746,
            height=175,

            sourceX = 28,
            sourceY = 25,
            sourceWidth = 800,
            sourceHeight = 200
        },
        {
            -- braveryBar4
            x=2,
            y=533,
            width=746,
            height=175,

            sourceX = 28,
            sourceY = 25,
            sourceWidth = 800,
            sourceHeight = 200
        },
        {
            -- braveryBar5
            x=2,
            y=710,
            width=746,
            height=175,

            sourceX = 28,
            sourceY = 25,
            sourceWidth = 800,
            sourceHeight = 200
        },
    },
    
    sheetContentWidth = 750,
    sheetContentHeight = 887
}

SheetInfo.frameIndex =
{

    ["braveryBar1"] = 1,
    ["braveryBar2"] = 2,
    ["braveryBar3"] = 3,
    ["braveryBar4"] = 4,
    ["braveryBar5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
