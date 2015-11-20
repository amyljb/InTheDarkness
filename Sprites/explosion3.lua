--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:bbca4f32c081fb3a7145adba779a8ccd:f9de43f56dfe13ad9724c9d722560b11:5f5deda0862a6e9133bafff08cda453c$
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
            -- explosion7
            x=2,
            y=2,
            width=1136,
            height=1044,

            sourceX = 36,
            sourceY = 140,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
    },
    
    sheetContentWidth = 1140,
    sheetContentHeight = 1048
}

SheetInfo.frameIndex =
{

    ["explosion7"] = 1,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
