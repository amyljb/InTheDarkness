--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:080c7188d96da90755f4a7b56b100459:c8e812b81bb14d33b7509dbe82a2b01b:fbc249ad48e60379d69847496d701ff6$
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
            -- smallGhost1
            x=1,
            y=1,
            width=324,
            height=426,

            sourceX = 34,
            sourceY = 42,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- smallGhost2
            x=327,
            y=1,
            width=311,
            height=414,

            sourceX = 48,
            sourceY = 45,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- smallGhost3
            x=640,
            y=1,
            width=304,
            height=408,

            sourceX = 54,
            sourceY = 45,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- smallGhost4
            x=946,
            y=1,
            width=302,
            height=405,

            sourceX = 54,
            sourceY = 44,
            sourceWidth = 400,
            sourceHeight = 500
        },
    },
    
    sheetContentWidth = 1249,
    sheetContentHeight = 428
}

SheetInfo.frameIndex =
{

    ["smallGhost1"] = 1,
    ["smallGhost2"] = 2,
    ["smallGhost3"] = 3,
    ["smallGhost4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
