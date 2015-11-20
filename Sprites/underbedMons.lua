--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a717bda99ba713655243cc251679ad0d:4d9567a6480a6660d5f0d11366c76f27:eda57eec853206e60185b6c346b23a99$
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
            x=4846,
            y=2,
            width=833,
            height=1192,

            sourceX = 25,
            sourceY = 2,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons2
            x=3007,
            y=2,
            width=939,
            height=1192,

            sourceX = 25,
            sourceY = 2,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons3
            x=1026,
            y=2,
            width=997,
            height=1192,

            sourceX = 25,
            sourceY = 2,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons4
            x=2,
            y=2,
            width=1022,
            height=1192,

            sourceX = 25,
            sourceY = 2,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons5
            x=2025,
            y=2,
            width=980,
            height=1192,

            sourceX = 25,
            sourceY = 2,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons6
            x=3948,
            y=2,
            width=896,
            height=1192,

            sourceX = 25,
            sourceY = 2,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
        {
            -- underbedMons7
            x=5681,
            y=2,
            width=828,
            height=1192,

            sourceX = 25,
            sourceY = 2,
            sourceWidth = 1050,
            sourceHeight = 1200
        },
    },
    
    sheetContentWidth = 6511,
    sheetContentHeight = 1196
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
