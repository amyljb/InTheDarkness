--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:3d1837cb985fe28a175099b554ffe4c9:305a8bea09c0cd0cb57297744f1799f3:d09dcb07adce52f1c43d08e6679990f3$
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
            -- curtain1
            x=2,
            y=893,
            width=740,
            height=833,

            sourceX = 25,
            sourceY = 6,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- curtain2
            x=2,
            y=1728,
            width=736,
            height=810,

            sourceX = 25,
            sourceY = 10,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- curtain3
            x=746,
            y=864,
            width=743,
            height=850,

            sourceX = 25,
            sourceY = 6,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- curtain4
            x=2,
            y=2,
            width=742,
            height=889,

            sourceX = 23,
            sourceY = 1,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- curtain5
            x=746,
            y=2,
            width=739,
            height=860,

            sourceX = 23,
            sourceY = 0,
            sourceWidth = 800,
            sourceHeight = 900
        },
        {
            -- curtain6
            x=744,
            y=1716,
            width=737,
            height=815,

            sourceX = 20,
            sourceY = 4,
            sourceWidth = 800,
            sourceHeight = 900
        },
    },
    
    sheetContentWidth = 1491,
    sheetContentHeight = 2540
}

SheetInfo.frameIndex =
{

    ["curtain1"] = 1,
    ["curtain2"] = 2,
    ["curtain3"] = 3,
    ["curtain4"] = 4,
    ["curtain5"] = 5,
    ["curtain6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
