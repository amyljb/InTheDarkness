--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4c63c73eaff7ba331608361c0c83ba9c:8f637b9fa9d954600baff11a4cdbd221:e48a078b71eb74a185cb0df7d0486ff7$
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
            -- spider1
            x=1300,
            y=236,
            width=207,
            height=245,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider10
            x=1509,
            y=229,
            width=206,
            height=249,

            sourceX = 15,
            sourceY = 1,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider11
            x=668,
            y=2,
            width=214,
            height=247,

            sourceX = 13,
            sourceY = 3,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider12
            x=2,
            y=248,
            width=219,
            height=244,

            sourceX = 10,
            sourceY = 3,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider13
            x=446,
            y=2,
            width=220,
            height=246,

            sourceX = 6,
            sourceY = 2,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider14
            x=1101,
            y=2,
            width=223,
            height=232,

            sourceX = 6,
            sourceY = 10,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider15
            x=1082,
            y=249,
            width=216,
            height=226,

            sourceX = 6,
            sourceY = 10,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider2
            x=233,
            y=2,
            width=211,
            height=244,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider3
            x=439,
            y=250,
            width=209,
            height=242,

            sourceX = 9,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider4
            x=884,
            y=2,
            width=215,
            height=245,

            sourceX = 7,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider5
            x=223,
            y=248,
            width=214,
            height=244,

            sourceX = 11,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider6
            x=2,
            y=2,
            width=229,
            height=244,

            sourceX = 1,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider7
            x=1326,
            y=2,
            width=218,
            height=225,

            sourceX = 8,
            sourceY = 9,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider8
            x=869,
            y=251,
            width=211,
            height=232,

            sourceX = 15,
            sourceY = 9,
            sourceWidth = 250,
            sourceHeight = 250
        },
        {
            -- spider9
            x=650,
            y=251,
            width=217,
            height=241,

            sourceX = 14,
            sourceY = 0,
            sourceWidth = 250,
            sourceHeight = 250
        },
    },
    
    sheetContentWidth = 1719,
    sheetContentHeight = 494
}

SheetInfo.frameIndex =
{

    ["spider1"] = 1,
    ["spider10"] = 2,
    ["spider11"] = 3,
    ["spider12"] = 4,
    ["spider13"] = 5,
    ["spider14"] = 6,
    ["spider15"] = 7,
    ["spider2"] = 8,
    ["spider3"] = 9,
    ["spider4"] = 10,
    ["spider5"] = 11,
    ["spider6"] = 12,
    ["spider7"] = 13,
    ["spider8"] = 14,
    ["spider9"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
