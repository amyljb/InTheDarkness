--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:52b3f1764830d3237709391e89d5c641:146dcb75cee5f0bdefd41df885c57418:fadc71f5dd724d4191dac6755857952a$
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
            -- spider-1
            x=483,
            y=1,
            width=477,
            height=258,

            sourceX = 10,
            sourceY = 21,
            sourceWidth = 500,
            sourceHeight = 300
        },
        {
            -- spider-3
            x=1,
            y=1,
            width=480,
            height=259,

            sourceX = 11,
            sourceY = 20,
            sourceWidth = 500,
            sourceHeight = 300
        },
        {
            -- spider2
            x=483,
            y=261,
            width=475,
            height=248,

            sourceX = 12,
            sourceY = 26,
            sourceWidth = 500,
            sourceHeight = 300
        },
    },
    
    sheetContentWidth = 961,
    sheetContentHeight = 510
}

SheetInfo.frameIndex =
{

    ["spider-1"] = 1,
    ["spider-3"] = 2,
    ["spider2"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
