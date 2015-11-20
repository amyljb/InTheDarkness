--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1bf0131cadf8273ba15fd1fb47298375:9d5b2d40d15ec0713e649ea3218d8459:ac8271ab034f689f82e72234cdf19122$
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
            x=1884,
            y=1012,
            width=934,
            height=992,

            sourceX = 120,
            sourceY = 65,
            sourceWidth = 1200,
            sourceHeight = 1100
        },
        {
            -- curtain2
            x=2,
            y=1016,
            width=934,
            height=983,

            sourceX = 120,
            sourceY = 70,
            sourceWidth = 1200,
            sourceHeight = 1100
        },
        {
            -- curtain3
            x=2820,
            y=1008,
            width=944,
            height=994,

            sourceX = 110,
            sourceY = 72,
            sourceWidth = 1200,
            sourceHeight = 1100
        },
        {
            -- curtain4
            x=943,
            y=1012,
            width=939,
            height=992,

            sourceX = 110,
            sourceY = 67,
            sourceWidth = 1200,
            sourceHeight = 1100
        },
        {
            -- curtain5
            x=1886,
            y=2,
            width=941,
            height=1004,

            sourceX = 108,
            sourceY = 67,
            sourceWidth = 1200,
            sourceHeight = 1100
        },
        {
            -- curtain6
            x=2829,
            y=2,
            width=941,
            height=998,

            sourceX = 110,
            sourceY = 64,
            sourceWidth = 1200,
            sourceHeight = 1100
        },
        {
            -- curtain7
            x=2,
            y=2,
            width=939,
            height=1012,

            sourceX = 110,
            sourceY = 64,
            sourceWidth = 1200,
            sourceHeight = 1100
        },
        {
            -- curtain8
            x=943,
            y=2,
            width=941,
            height=1008,

            sourceX = 108,
            sourceY = 67,
            sourceWidth = 1200,
            sourceHeight = 1100
        },
    },
    
    sheetContentWidth = 3772,
    sheetContentHeight = 2006
}

SheetInfo.frameIndex =
{

    ["curtain1"] = 1,
    ["curtain2"] = 2,
    ["curtain3"] = 3,
    ["curtain4"] = 4,
    ["curtain5"] = 5,
    ["curtain6"] = 6,
    ["curtain7"] = 7,
    ["curtain8"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
