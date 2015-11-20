--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d5b17e9edd72bf0eaf48aea6c1e1ffc3:4c517d073bee21a80770f0508008dcf3:dc6dbf01aedcb9d498a3715608582f08$
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
            -- ghost1
            x=589,
            y=1096,
            width=569,
            height=527,

            sourceX = 32,
            sourceY = 9,
            sourceWidth = 620,
            sourceHeight = 550
        },
        {
            -- ghost2
            x=2,
            y=1096,
            width=585,
            height=532,

            sourceX = 33,
            sourceY = 10,
            sourceWidth = 620,
            sourceHeight = 550
        },
        {
            -- ghost3
            x=591,
            y=545,
            width=566,
            height=518,

            sourceX = 32,
            sourceY = 10,
            sourceWidth = 620,
            sourceHeight = 550
        },
        {
            -- ghost4
            x=2,
            y=552,
            width=587,
            height=542,

            sourceX = 33,
            sourceY = 7,
            sourceWidth = 620,
            sourceHeight = 550
        },
        {
            -- ghost5
            x=577,
            y=2,
            width=575,
            height=541,

            sourceX = 33,
            sourceY = 8,
            sourceWidth = 620,
            sourceHeight = 550
        },
        {
            -- ghost6
            x=2,
            y=2,
            width=573,
            height=548,

            sourceX = 35,
            sourceY = 2,
            sourceWidth = 620,
            sourceHeight = 550
        },
    },
    
    sheetContentWidth = 1160,
    sheetContentHeight = 1630
}

SheetInfo.frameIndex =
{

    ["ghost1"] = 1,
    ["ghost2"] = 2,
    ["ghost3"] = 3,
    ["ghost4"] = 4,
    ["ghost5"] = 5,
    ["ghost6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
