--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:21ecad29dfff483cad39f55e19c32f0b:201c43bcd2d18e9eacbef5141cdc524d:9eb95d2b6b5c2d4ca3159bdb8c4ff9a8$
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
            -- frame1
            x=1380,
            y=607,
            width=56,
            height=63,

            sourceX = 81,
            sourceY = 877,
            sourceWidth = 1400,
            sourceHeight = 1000
        },
        {
            -- frame2
            x=1380,
            y=387,
            width=147,
            height=218,

            sourceX = 81,
            sourceY = 722,
            sourceWidth = 1400,
            sourceHeight = 1000
        },
        {
            -- frame3
            x=1380,
            y=2,
            width=186,
            height=383,

            sourceX = 81,
            sourceY = 557,
            sourceWidth = 1400,
            sourceHeight = 1000
        },
        {
            -- frame4
            x=2,
            y=2,
            width=1376,
            height=940,

            sourceX = 21,
            sourceY = 0,
            sourceWidth = 1400,
            sourceHeight = 1000
        },
        {
            -- frame5
            x=2,
            y=944,
            width=1376,
            height=940,

            sourceX = 21,
            sourceY = 0,
            sourceWidth = 1400,
            sourceHeight = 1000
        },
    },
    
    sheetContentWidth = 1568,
    sheetContentHeight = 1886
}

SheetInfo.frameIndex =
{

    ["frame1"] = 1,
    ["frame2"] = 2,
    ["frame3"] = 3,
    ["frame4"] = 4,
    ["frame5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
