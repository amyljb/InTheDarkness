--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ac144159fd4b048ba94c4eb4eccb2a84:6e71cce7b0902d8716454f243a82353a:382850ccfec1dbe0403d83af9063eceb$
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
            -- soundText12
            x=1323,
            y=1,
            width=1235,
            height=1226,

            sourceX = 38,
            sourceY = 73,
            sourceWidth = 1400,
            sourceHeight = 1400
        },
        {
            -- soundText13
            x=1,
            y=1,
            width=1320,
            height=1226,

            sourceX = 38,
            sourceY = 73,
            sourceWidth = 1400,
            sourceHeight = 1400
        },
    },
    
    sheetContentWidth = 2559,
    sheetContentHeight = 1228
}

SheetInfo.frameIndex =
{

    ["soundText12"] = 1,
    ["soundText13"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
