--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0d1ab3313cbdb8891c10902e5a2c9cdf:dafd381b1d95ee5a3b0917ca483f1c7a:bbe28f4a6208b28d1a89f16c370e12c2$
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
            -- suddenly1
            x=1,
            y=489,
            width=1371,
            height=285,

            sourceX = 6,
            sourceY = 5,
            sourceWidth = 1400,
            sourceHeight = 500
        },
        {
            -- suddenly2
            x=1,
            y=1,
            width=1371,
            height=486,

            sourceX = 6,
            sourceY = 5,
            sourceWidth = 1400,
            sourceHeight = 500
        },
    },
    
    sheetContentWidth = 1373,
    sheetContentHeight = 775
}

SheetInfo.frameIndex =
{

    ["suddenly1"] = 1,
    ["suddenly2"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
