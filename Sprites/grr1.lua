--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:5fa9f2acb9c1e0787a4e48c6cddba0fd:256e07b0b8a53ad13cb7a93d12f7de1c:297e18ed7e3d8d88c4cca53023969b12$
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
            -- z1
            x=191,
            y=1037,
            width=71,
            height=101,

            sourceX = 402,
            sourceY = 1348,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- z2
            x=1,
            y=1037,
            width=188,
            height=241,

            sourceX = 402,
            sourceY = 1208,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- z3
            x=1,
            y=602,
            width=294,
            height=433,

            sourceX = 402,
            sourceY = 1016,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
        {
            -- z4
            x=1,
            y=1,
            width=294,
            height=599,

            sourceX = 402,
            sourceY = 850,
            sourceWidth = 2000,
            sourceHeight = 1700
        },
    },
    
    sheetContentWidth = 296,
    sheetContentHeight = 1279
}

SheetInfo.frameIndex =
{

    ["z1"] = 1,
    ["z2"] = 2,
    ["z3"] = 3,
    ["z4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
