--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2798fe8782fe043d4de174d6793e700b:f9340f684a2438ed65a6ae6b4249f61d:2fc66d22cfd9f7880779e7b506db5dc3$
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
            -- sh1
            x=468,
            y=1437,
            width=78,
            height=114,

            sourceX = 139,
            sourceY = 1534,
            sourceWidth = 500,
            sourceHeight = 1700
        },
        {
            -- sh2
            x=935,
            y=1199,
            width=184,
            height=325,

            sourceX = 33,
            sourceY = 1323,
            sourceWidth = 500,
            sourceHeight = 1700
        },
        {
            -- sh3
            x=1269,
            y=1115,
            width=184,
            height=526,

            sourceX = 33,
            sourceY = 1122,
            sourceWidth = 500,
            sourceHeight = 1700
        },
        {
            -- sh4
            x=1588,
            y=923,
            width=185,
            height=756,

            sourceX = 33,
            sourceY = 892,
            sourceWidth = 500,
            sourceHeight = 1700
        },
        {
            -- sh5
            x=1588,
            y=1,
            width=317,
            height=920,

            sourceX = 33,
            sourceY = 728,
            sourceWidth = 500,
            sourceHeight = 1700
        },
        {
            -- sh6
            x=1269,
            y=1,
            width=317,
            height=1112,

            sourceX = 33,
            sourceY = 536,
            sourceWidth = 500,
            sourceHeight = 1700
        },
        {
            -- sh7
            x=935,
            y=1,
            width=332,
            height=1196,

            sourceX = 33,
            sourceY = 452,
            sourceWidth = 500,
            sourceHeight = 1700
        },
        {
            -- sh8
            x=468,
            y=1,
            width=465,
            height=1434,

            sourceX = 33,
            sourceY = 214,
            sourceWidth = 500,
            sourceHeight = 1700
        },
        {
            -- sh9
            x=1,
            y=1,
            width=465,
            height=1595,

            sourceX = 33,
            sourceY = 53,
            sourceWidth = 500,
            sourceHeight = 1700
        },
    },
    
    sheetContentWidth = 1906,
    sheetContentHeight = 1680
}

SheetInfo.frameIndex =
{

    ["sh1"] = 1,
    ["sh2"] = 2,
    ["sh3"] = 3,
    ["sh4"] = 4,
    ["sh5"] = 5,
    ["sh6"] = 6,
    ["sh7"] = 7,
    ["sh8"] = 8,
    ["sh9"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
