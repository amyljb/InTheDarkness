--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c1313fbce6fdc1c9c47407aba0e1b472:37ce1bc15d86adf8b1060f1111d286ea:fded685f820278383817d14b3cbc451f$
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
            -- lightning-1
            x=2,
            y=532,
            width=1496,
            height=558,

            sourceX = 72,
            sourceY = 0,
            sourceWidth = 1600,
            sourceHeight = 600
        },
        {
            -- lightning2
            x=2,
            y=2,
            width=1501,
            height=528,

            sourceX = 73,
            sourceY = 0,
            sourceWidth = 1600,
            sourceHeight = 600
        },
    },
    
    sheetContentWidth = 1505,
    sheetContentHeight = 1092
}

SheetInfo.frameIndex =
{

    ["lightning-1"] = 1,
    ["lightning2"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
