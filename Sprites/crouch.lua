--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e4d51ba7d8f0a6aa45a8b930a156fdff:109792d3f46d0bfccb4f8e580869dfe6:aac6570822ba4250cc6915d2c73bf2c9$
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
            -- crouch1
            x=650,
            y=2,
            width=324,
            height=929,

            sourceX = 7,
            sourceY = 52,
            sourceWidth = 350,
            sourceHeight = 1000
        },
        {
            -- crouch2
            x=1314,
            y=2,
            width=401,
            height=737,

            sourceX = 20,
            sourceY = 263,
            sourceWidth = 450,
            sourceHeight = 1000
        },
        {
            -- crouch3
            x=1314,
            y=2,
            width=401,
            height=737,

            sourceX = 20,
            sourceY = 263,
            sourceWidth = 450,
            sourceHeight = 1000
        },
        {
            -- crouch4
            x=2,
            y=2,
            width=322,
            height=935,

            sourceX = 7,
            sourceY = 46,
            sourceWidth = 350,
            sourceHeight = 1000
        },
        {
            -- wobble1
            x=326,
            y=2,
            width=322,
            height=930,

            sourceX = 7,
            sourceY = 51,
            sourceWidth = 350,
            sourceHeight = 1000
        },
        {
            -- wobble2
            x=976,
            y=2,
            width=336,
            height=920,

            sourceX = 7,
            sourceY = 61,
            sourceWidth = 350,
            sourceHeight = 1000
        },
    },
    
    sheetContentWidth = 1717,
    sheetContentHeight = 939
}

SheetInfo.frameIndex =
{

    ["crouch1"] = 1,
    ["crouch2"] = 2,
    ["crouch3"] = 3,
    ["crouch4"] = 4,
    ["wobble1"] = 5,
    ["wobble2"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
