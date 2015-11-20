--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f8294e2282acdcb0419e94712849d6ff:9b5aa1837bfadfa9767c199ae085e301:995826e0a4b896864d79ea2c8c0a3e68$
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
            -- 1
            x=480,
            y=1351,
            width=110,
            height=69,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        
        {
            -- 2
            x=276,
            y=1351,
            width=202,
            height=113,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 3
            x=1,
            y=1351,
            width=273,
            height=185,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 4
            x=816,
            y=1339,
            width=317,
            height=269,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 5
            x=1145,
            y=1283,
            width=327,
            height=337,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 6
            x=1474,
            y=1184,
            width=327,
            height=423,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 7
            x=1474,
            y=676,
            width=327,
            height=506,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 8
            x=1145,
            y=676,
            width=327,
            height=605,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 9
            x=816,
            y=676,
            width=327,
            height=661,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 10
            x=487,
            y=676,
            width=327,
            height=673,

            sourceX = 329,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 11
            x=1,
            y=676,
            width=484,
            height=673,

            sourceX = 172,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 12
            x=1292,
            y=1,
            width=582,
            height=673,

            sourceX = 74,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 13
            x=655,
            y=1,
            width=635,
            height=673,

            sourceX = 21,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
        {
            -- 14
            x=1,
            y=1,
            width=652,
            height=673,

            sourceX = 4,
            sourceY = 14,
            sourceWidth = 660,
            sourceHeight = 700
        },
    },
    
    sheetContentWidth = 1875,
    sheetContentHeight = 1621
}

SheetInfo.frameIndex =
{

    ["1"] = 1,
    ["2"] = 2,
    ["3"] = 3,
    ["4"] = 4,
    ["5"] = 5,
    ["6"] = 6,
    ["7"] = 7,
    ["8"] = 8,
    ["9"] = 9,
    ["10"] = 10,
    ["11"] = 11,
    ["12"] = 12,
    ["13"] = 13,
    ["14"] = 14,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
