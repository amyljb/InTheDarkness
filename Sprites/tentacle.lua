--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:28137b43f1eee88a7dc5e71cb7213798:6ef2342a29da1acc602988ce63d49895:a93db3e529f3a3b17c5afd32d0888831$
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
            -- tent1
            x=709,
            y=312,
            width=532,
            height=457,

            sourceX = 129,
            sourceY = 143,
            sourceWidth = 750,
            sourceHeight = 600
        },
        
        {
            -- tent2
            x=1243,
            y=346,
            width=532,
            height=471,

            sourceX = 115,
            sourceY = 129,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent3
            x=279,
            y=771,
            width=575,
            height=468,

            sourceX = 158,
            sourceY = 132,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent4
            x=1228,
            y=819,
            width=551,
            height=528,

            sourceX = 148,
            sourceY = 72,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent5
            x=1174,
            y=1349,
            width=505,
            height=541,

            sourceX = 127,
            sourceY = 59,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent6
            x=218,
            y=1241,
            width=335,
            height=532,

            sourceX = 266,
            sourceY = 68,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent7
            x=818,
            y=1306,
            width=354,
            height=534,

            sourceX = 258,
            sourceY = 66,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent8
            x=555,
            y=1241,
            width=261,
            height=537,

            sourceX = 257,
            sourceY = 63,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent9
            x=1054,
            y=771,
            width=172,
            height=533,

            sourceX = 260,
            sourceY = 67,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent10
            x=856,
            y=771,
            width=196,
            height=531,

            sourceX = 244,
            sourceY = 69,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent11
            x=2,
            y=1183,
            width=214,
            height=536,

            sourceX = 285,
            sourceY = 64,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent12
            x=2,
            y=690,
            width=275,
            height=491,

            sourceX = 287,
            sourceY = 109,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent13
            x=398,
            y=303,
            width=309,
            height=442,

            sourceX = 286,
            sourceY = 158,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent14
            x=2,
            y=299,
            width=394,
            height=389,

            sourceX = 286,
            sourceY = 211,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent15
            x=1269,
            y=2,
            width=429,
            height=342,

            sourceX = 283,
            sourceY = 258,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent16
            x=850,
            y=2,
            width=417,
            height=308,

            sourceX = 283,
            sourceY = 292,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent17
            x=405,
            y=2,
            width=443,
            height=299,

            sourceX = 283,
            sourceY = 301,
            sourceWidth = 750,
            sourceHeight = 600
        },
        {
            -- tent18
            x=2,
            y=2,
            width=401,
            height=295,

            sourceX = 289,
            sourceY = 305,
            sourceWidth = 750,
            sourceHeight = 600
        },
    },
    
    sheetContentWidth = 1781,
    sheetContentHeight = 1892
}

SheetInfo.frameIndex =
{

    ["tent1"] = 1,
    ["tent2"] = 2,
    ["tent3"] = 3,
    ["tent4"] = 4,
    ["tent5"] = 5,
    ["tent6"] = 6,
    ["tent7"] = 7,
    ["tent8"] = 8,
    ["tent9"] = 9,
    ["tent10"] = 10,
    ["tent11"] = 11,
    ["tent12"] = 12,
    ["tent13"] = 13,
    ["tent14"] = 14,
    ["tent15"] = 15,
    ["tent16"] = 16,
    ["tent17"] = 17,
    ["tent18"] = 18,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
