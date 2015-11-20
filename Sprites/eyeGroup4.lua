--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0d22527eda6d614300deffbf3bc70391:8dff56df6b54c9c5e1a50d93fb4f1c8d:acdb217e2c4c1d4e18ef1ad6e8889eef$
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
            -- 4fr1
            x=850,
            y=2,
            width=498,
            height=377,

            sourceX = 31,
            sourceY = 22,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 4fr2
            x=830,
            y=499,
            width=635,
            height=420,

            sourceX = 11,
            sourceY = 28,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 4fr3
            x=2,
            y=2,
            width=846,
            height=495,

            sourceX = 11,
            sourceY = 22,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 4fr4
            x=850,
            y=2,
            width=498,
            height=377,

            sourceX = 31,
            sourceY = 22,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 4fr5
            x=830,
            y=499,
            width=635,
            height=420,

            sourceX = 11,
            sourceY = 28,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 4fr6
            x=2,
            y=499,
            width=826,
            height=495,

            sourceX = 31,
            sourceY = 22,
            sourceWidth = 900,
            sourceHeight = 550
        },
    },
    
    sheetContentWidth = 1467,
    sheetContentHeight = 996
}

SheetInfo.frameIndex =
{

    ["4fr1"] = 1,
    ["4fr2"] = 2,
    ["4fr3"] = 3,
    ["4fr4"] = 4,
    ["4fr5"] = 5,
    ["4fr6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
