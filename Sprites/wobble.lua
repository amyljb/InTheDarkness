--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a95324b4799bc4e3d976aa6e38574e5f:dc9becf2232cf430e7916042e4a3d027:27f0867bcf37cb515b39812b384ffc17$
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
            -- wobble1
            x=361,
            y=1,
            width=297,
            height=904,

            sourceX = 84,
            sourceY = 72,
            sourceWidth = 450,
            sourceHeight = 1000
        },
        {
            -- wobble2
            x=1,
            y=1,
            width=358,
            height=904,

            sourceX = 79,
            sourceY = 72,
            sourceWidth = 450,
            sourceHeight = 1000
        },
        {
            -- wobble3
            x=660,
            y=1,
            width=302,
            height=890,

            sourceX = 93,
            sourceY = 86,
            sourceWidth = 450,
            sourceHeight = 1000
        },
        {
            -- wobble4
            x=361,
            y=1,
            width=297,
            height=904,

            sourceX = 84,
            sourceY = 72,
            sourceWidth = 450,
            sourceHeight = 1000
        },
    },
    
    sheetContentWidth = 963,
    sheetContentHeight = 906
}

SheetInfo.frameIndex =
{

    ["wobble1"] = 1,
    ["wobble2"] = 2,
    ["wobble3"] = 3,
    ["wobble4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
