--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4525b21adba0998d76e35347f6e2cf46:85ade81219741a02b23380954f813f22:03d605659571cc2fd02db1a389086394$
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
            -- dustExplosion1
            x=1,
            y=1172,
            width=63,
            height=63,

            sourceX = 267,
            sourceY = 267,
            sourceWidth = 600,
            sourceHeight = 600
        },
        
        {
            -- dustExplosion2
            x=1503,
            y=517,
            width=370,
            height=403,

            sourceX = 107,
            sourceY = 95,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion3
            x=1583,
            y=1,
            width=459,
            height=514,

            sourceX = 76,
            sourceY = 43,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion4
            x=1,
            y=591,
            width=548,
            height=579,

            sourceX = 31,
            sourceY = 11,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion5
            x=1,
            y=1,
            width=555,
            height=588,

            sourceX = 29,
            sourceY = 1,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion6
            x=1694,
            y=922,
            width=307,
            height=295,

            sourceX = 147,
            sourceY = 153,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion7
            x=1076,
            y=500,
            width=425,
            height=415,

            sourceX = 88,
            sourceY = 93,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion8
            x=558,
            y=536,
            width=478,
            height=463,

            sourceX = 62,
            sourceY = 69,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion9
            x=1076,
            y=1,
            width=505,
            height=497,

            sourceX = 49,
            sourceY = 52,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion10
            x=1038,
            y=917,
            width=348,
            height=350,

            sourceX = 128,
            sourceY = 27,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion11
            x=1388,
            y=922,
            width=304,
            height=302,

            sourceX = 150,
            sourceY = 27,
            sourceWidth = 600,
            sourceHeight = 600
        },
        {
            -- dustExplosion12
            x=558,
            y=1,
            width=516,
            height=533,

            sourceX = 45,
            sourceY = 13,
            sourceWidth = 600,
            sourceHeight = 600
        },
    },
    
    sheetContentWidth = 2043,
    sheetContentHeight = 1268
}

SheetInfo.frameIndex =
{

    ["dustExplosion1"] = 1,
    ["dustExplosion2"] = 2,
    ["dustExplosion3"] = 3,
    ["dustExplosion4"] = 4,
    ["dustExplosion5"] = 5,
    ["dustExplosion6"] = 6,
    ["dustExplosion7"] = 7,
    ["dustExplosion8"] = 8,
    ["dustExplosion9"] = 9,
    ["dustExplosion10"] = 10,
    ["dustExplosion11"] = 11,
    ["dustExplosion12"] = 12,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
