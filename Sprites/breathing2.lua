--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:b5abe7b6692c7de0143400a6eb4723cb:dd34c13bd2aafba41aba9e4ec4fc1786:cac5e0e20ba81e24fd38af9c1fba57cd$
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
            -- breath21
            x=2,
            y=2,
            width=750,
            height=1400,

        },
        {
            -- breath22
            x=754,
            y=2,
            width=750,
            height=1400,

        },
    },
    
    sheetContentWidth = 1506,
    sheetContentHeight = 1404
}

SheetInfo.frameIndex =
{

    ["breath21"] = 1,
    ["breath22"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
