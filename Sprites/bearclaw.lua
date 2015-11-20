--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:eb18fcf7a325b8358133b70937395e9c:a8c682b5c62789d1b65a944b8837eea0:c776bfff4d64457b69638462703fef3e$
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
            -- bearClaw1
            x=583,
            y=537,
            width=522,
            height=270,

            sourceX = 78,
            sourceY = 18,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- bearClaw2
            x=579,
            y=267,
            width=537,
            height=268,

            sourceX = 62,
            sourceY = 15,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- bearClaw3
            x=2,
            y=267,
            width=575,
            height=270,

            sourceX = 25,
            sourceY = 16,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- bearClaw4
            x=2,
            y=539,
            width=579,
            height=266,

            sourceX = 21,
            sourceY = 16,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- bearClaw5
            x=2,
            y=2,
            width=595,
            height=263,

            sourceX = 0,
            sourceY = 18,
            sourceWidth = 600,
            sourceHeight = 300
        },
    },
    
    sheetContentWidth = 1118,
    sheetContentHeight = 809
}

SheetInfo.frameIndex =
{

    ["bearClaw1"] = 1,
    ["bearClaw2"] = 2,
    ["bearClaw3"] = 3,
    ["bearClaw4"] = 4,
    ["bearClaw5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
