--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:775c08938e5473cb83453f79cf867d31:8e01c30f89a89cb067f8d6d5f76bd3af:9095aae656c8474b498a645598570923$
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
            -- explosion10
            x=2,
            y=2,
            width=1181,
            height=1078,

            sourceX = 11,
            sourceY = 8,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion11
            x=1185,
            y=529,
            width=626,
            height=627,

            sourceX = 333,
            sourceY = 65,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion12
            x=2,
            y=1158,
            width=630,
            height=671,

            sourceX = 328,
            sourceY = 65,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion13
            x=634,
            y=1158,
            width=722,
            height=607,

            sourceX = 285,
            sourceY = 65,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion14
            x=1185,
            y=2,
            width=628,
            height=525,

            sourceX = 332,
            sourceY = 106,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
    },
    
    sheetContentWidth = 1815,
    sheetContentHeight = 1831
}

SheetInfo.frameIndex =
{

    ["explosion10"] = 1,
    ["explosion11"] = 2,
    ["explosion12"] = 3,
    ["explosion13"] = 4,
    ["explosion14"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
