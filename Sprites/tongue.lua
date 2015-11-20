--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:dad5acd164c98398179ca1c2703d91da:fb349a12851121069ffb312bc19d8c05:d08a6158697603c6553326f00ab92091$
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
            -- tongue1
            x=1231,
            y=1109,
            width=461,
            height=255,

            sourceX = 25,
            sourceY = 595,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue2
            x=1128,
            y=1728,
            width=445,
            height=305,

            sourceX = 33,
            sourceY = 545,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue3
            x=1128,
            y=1366,
            width=459,
            height=360,

            sourceX = 33,
            sourceY = 490,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue4
            x=1175,
            y=2,
            width=520,
            height=554,

            sourceX = 33,
            sourceY = 290,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue5
            x=2,
            y=1527,
            width=471,
            height=512,

            sourceX = 33,
            sourceY = 281,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue6
            x=633,
            y=667,
            width=596,
            height=594,

            sourceX = 25,
            sourceY = 256,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue7
            x=1231,
            y=558,
            width=509,
            height=549,

            sourceX = 39,
            sourceY = 201,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue8
            x=633,
            y=2,
            width=540,
            height=663,

            sourceX = 13,
            sourceY = 87,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue9
            x=2,
            y=792,
            width=611,
            height=733,

            sourceX = 39,
            sourceY = 0,
            sourceWidth = 650,
            sourceHeight = 850
        },
         {
            -- tongue10
            x=2,
            y=2,
            width=629,
            height=788,

            sourceX = 13,
            sourceY = 5,
            sourceWidth = 650,
            sourceHeight = 850
        },
        {
            -- tongue11
            x=615,
            y=1263,
            width=511,
            height=543,

            sourceX = 13,
            sourceY = 207,
            sourceWidth = 650,
            sourceHeight = 850
        },
    },
    
    sheetContentWidth = 1742,
    sheetContentHeight = 2041
}

SheetInfo.frameIndex =
{

    ["tongue1"] = 1,
    ["tongue2"] = 2,
    ["tongue2"] = 3,
    ["tongue4"] = 4,
    ["tongue5"] = 5,
    ["tongue6"] = 6,
    ["tongue7"] = 7,
    ["tongue8"] = 8,
    ["tongue9"] = 9,
    ["tongue10"] = 10,
    ["tongue11"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
