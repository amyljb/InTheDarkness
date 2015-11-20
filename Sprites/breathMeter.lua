--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:97f863b558cccb2c86aff48bdafdab26:bf3c09871b28571c6196361dc7f3bb81:7573bddc3531771d6ed01932927045b1$
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
            -- breathingBar1
            x=2,
            y=1004,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        
        {
            -- breathingBar2
            x=563,
            y=2,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar3
            x=563,
            y=986,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar4
            x=750,
            y=2,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar5
            x=750,
            y=986,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar6
            x=937,
            y=2,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar7
            x=1124,
            y=2,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar8
            x=937,
            y=986,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar9
            x=1124,
            y=986,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar10
            x=189,
            y=2,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar11
            x=189,
            y=986,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar12
            x=376,
            y=2,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar13
            x=376,
            y=986,
            width=185,
            height=982,

            sourceX = 2,
            sourceY = 10,
            sourceWidth = 190,
            sourceHeight = 1000
        },
        {
            -- breathingBar14
            x=2,
            y=2,
            width=185,
            height=1000,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 190,
            sourceHeight = 1000
        },
    },
    
    sheetContentWidth = 1311,
    sheetContentHeight = 1988
}

SheetInfo.frameIndex =
{

    ["breathingBar1"] = 1,
    ["breathingBar2"] = 2,
    ["breathingBar3"] = 3,
    ["breathingBar4"] = 4,
    ["breathingBar5"] = 5,
    ["breathingBar6"] = 6,
    ["breathingBar7"] = 7,
    ["breathingBar8"] = 8,
    ["breathingBar9"] = 9,
    ["breathingBar10"] = 10,
    ["breathingBar11"] = 11,
    ["breathingBar12"] = 12,
    ["breathingBar13"] = 13,
    ["breathingBar14"] = 14,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
