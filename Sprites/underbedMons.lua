--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9247beb40c4d71ce665171d6692df3bf:8e711b0e225344499fc7f0a1aefe58bc:eda57eec853206e60185b6c346b23a99$
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
            -- underbedMons1
            x=1844,
            y=1202,
            width=845,
            height=1199,

            sourceX = 24,
            sourceY = 1,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons2
            x=1,
            y=1202,
            width=941,
            height=1199,

            sourceX = 24,
            sourceY = 1,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons3
            x=1027,
            y=1,
            width=999,
            height=1199,

            sourceX = 24,
            sourceY = 1,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons4
            x=1,
            y=1,
            width=1024,
            height=1199,

            sourceX = 24,
            sourceY = 1,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons5
            x=2028,
            y=1,
            width=982,
            height=1199,

            sourceX = 24,
            sourceY = 1,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons6
            x=944,
            y=1202,
            width=898,
            height=1199,

            sourceX = 24,
            sourceY = 1,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons7
            x=2691,
            y=1202,
            width=845,
            height=1199,

            sourceX = 24,
            sourceY = 1,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
    },
    
    sheetContentWidth = 3537,
    sheetContentHeight = 2402
}

SheetInfo.frameIndex =
{

    ["underbedMons1"] = 1,
    ["underbedMons2"] = 2,
    ["underbedMons3"] = 3,
    ["underbedMons4"] = 4,
    ["underbedMons5"] = 5,
    ["underbedMons6"] = 6,
    ["underbedMons7"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
