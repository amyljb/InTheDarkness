--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d83d08ec7588dcfa1be76b0d02fe3d8c:a8e460e41b95fcb1d61b1abc77013e11:74c5ddbcd290c8d8e3ff76cce949d602$
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
            -- lizard1
            x=2,
            y=2,
            width=596,
            height=237,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 600,
            sourceHeight = 250
        },
        {
            -- lizard2
            x=2,
            y=241,
            width=596,
            height=237,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 600,
            sourceHeight = 250
        },
        {
            -- lizard3
            x=2,
            y=2,
            width=596,
            height=237,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 600,
            sourceHeight = 250
        },
        {
            -- lizard4
            x=1181,
            y=241,
            width=571,
            height=237,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 600,
            sourceHeight = 250
        },
        {
            -- lizard5
            x=600,
            y=241,
            width=579,
            height=237,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 600,
            sourceHeight = 250
        },
        {
            -- lizard6
            x=1192,
            y=2,
            width=564,
            height=237,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 600,
            sourceHeight = 250
        },
        {
            -- lizard7
            x=600,
            y=2,
            width=590,
            height=237,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 600,
            sourceHeight = 250
        },
        {
            -- lizard8
            x=2,
            y=2,
            width=596,
            height=237,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 600,
            sourceHeight = 250
        },
    },
    
    sheetContentWidth = 1758,
    sheetContentHeight = 480
}

SheetInfo.frameIndex =
{

    ["lizard1"] = 1,
    ["lizard2"] = 2,
    ["lizard3"] = 3,
    ["lizard4"] = 4,
    ["lizard5"] = 5,
    ["lizard6"] = 6,
    ["lizard7"] = 7,
    ["lizard8"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
