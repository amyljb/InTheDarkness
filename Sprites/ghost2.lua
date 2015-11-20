--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0d531dd02d9d8b88389e38e420015dac:fd9beddc8eeeac3f28f5b5f5b7ab2d89:d8a011082517804a41f2f53baf606852$
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
            -- ghost_1
            x=707,
            y=2,
            width=262,
            height=523,

            sourceX = 241,
            sourceY = 68,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_10
            x=2,
            y=1670,
            width=613,
            height=350,

            sourceX = 282,
            sourceY = 194,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_11
            x=2,
            y=2022,
            width=560,
            height=419,

            sourceX = 338,
            sourceY = 130,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_12
            x=2,
            y=2952,
            width=427,
            height=350,

            sourceX = 453,
            sourceY = 159,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_13
            x=508,
            y=3070,
            width=423,
            height=348,

            sourceX = 449,
            sourceY = 165,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_14
            x=2,
            y=343,
            width=686,
            height=289,

            sourceX = 199,
            sourceY = 253,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_15
            x=2,
            y=2,
            width=703,
            height=339,

            sourceX = 53,
            sourceY = 194,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_16
            x=2,
            y=1214,
            width=622,
            height=454,

            sourceX = 46,
            sourceY = 61,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_17
            x=2,
            y=2443,
            width=452,
            height=507,

            sourceX = 42,
            sourceY = 0,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_18
            x=2,
            y=3304,
            width=252,
            height=499,

            sourceX = 46,
            sourceY = 0,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_19
            x=256,
            y=3304,
            width=250,
            height=485,

            sourceX = 46,
            sourceY = 0,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_2
            x=690,
            y=527,
            width=262,
            height=523,

            sourceX = 241,
            sourceY = 68,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_3
            x=640,
            y=1052,
            width=262,
            height=523,

            sourceX = 241,
            sourceY = 68,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_4
            x=626,
            y=1577,
            width=372,
            height=551,

            sourceX = 136,
            sourceY = 53,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_5
            x=564,
            y=2130,
            width=434,
            height=543,

            sourceX = 83,
            sourceY = 55,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_6
            x=508,
            y=3420,
            width=400,
            height=477,

            sourceX = 81,
            sourceY = 91,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_7
            x=456,
            y=2675,
            width=435,
            height=393,

            sourceX = 98,
            sourceY = 203,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_8
            x=2,
            y=944,
            width=636,
            height=268,

            sourceX = 132,
            sourceY = 308,
            sourceWidth = 900,
            sourceHeight = 700
        },
        {
            -- ghost_9
            x=2,
            y=634,
            width=636,
            height=308,

            sourceX = 250,
            sourceY = 255,
            sourceWidth = 900,
            sourceHeight = 700
        },
    },
    
    sheetContentWidth = 1000,
    sheetContentHeight = 3899
}

SheetInfo.frameIndex =
{

    ["ghost_1"] = 1,
    ["ghost_10"] = 2,
    ["ghost_11"] = 3,
    ["ghost_12"] = 4,
    ["ghost_13"] = 5,
    ["ghost_14"] = 6,
    ["ghost_15"] = 7,
    ["ghost_16"] = 8,
    ["ghost_17"] = 9,
    ["ghost_18"] = 10,
    ["ghost_19"] = 11,
    ["ghost_2"] = 12,
    ["ghost_3"] = 13,
    ["ghost_4"] = 14,
    ["ghost_5"] = 15,
    ["ghost_6"] = 16,
    ["ghost_7"] = 17,
    ["ghost_8"] = 18,
    ["ghost_9"] = 19,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
