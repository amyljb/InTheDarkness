--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:3c5db825512e3580b7bf6d60bfdbde88:f107ee6cee1841cf60c9e8e2f2f245f8:da07dcb54be095e5ff981ac5ca4b57a8$
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
            -- 2fr1
            x=795,
            y=2,
            width=154,
            height=120,

            sourceX = 535,
            sourceY = 68,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 2fr2
            x=2,
            y=2,
            width=623,
            height=471,

            sourceX = 72,
            sourceY = 68,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 2fr3
            x=627,
            y=2,
            width=166,
            height=471,

            sourceX = 529,
            sourceY = 68,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 2fr4
            x=2,
            y=2,
            width=623,
            height=471,

            sourceX = 72,
            sourceY = 68,
            sourceWidth = 900,
            sourceHeight = 550
        },
    },
    
    sheetContentWidth = 951,
    sheetContentHeight = 475
}

SheetInfo.frameIndex =
{

    ["2fr1"] = 1,
    ["2fr2"] = 2,
    ["2fr3"] = 3,
    ["2fr4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
