--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:5623b89484036d86e4ad16105113e507:931455368eab2dc7552062ab39b48bb1:42bff789755add3dbfd569a2d821634a$
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
            -- swipeP1
            x=1496,
            y=629,
            width=474,
            height=625,

            sourceX = 36,
            sourceY = 21,
            sourceWidth = 600,
            sourceHeight = 700
        },
        {
            -- swipeP2
            x=2,
            y=2,
            width=496,
            height=625,

            sourceX = 35,
            sourceY = 21,
            sourceWidth = 600,
            sourceHeight = 700
        },
        {
            -- swipeP3
            x=2,
            y=629,
            width=496,
            height=625,

            sourceX = 35,
            sourceY = 21,
            sourceWidth = 600,
            sourceHeight = 700
        },
        {
            -- swipeP4
            x=500,
            y=2,
            width=496,
            height=625,

            sourceX = 35,
            sourceY = 21,
            sourceWidth = 600,
            sourceHeight = 700
        },
        {
            -- swipeP5
            x=500,
            y=629,
            width=496,
            height=625,

            sourceX = 35,
            sourceY = 21,
            sourceWidth = 600,
            sourceHeight = 700
        },
        {
            -- swipeP6
            x=998,
            y=2,
            width=496,
            height=625,

            sourceX = 35,
            sourceY = 21,
            sourceWidth = 600,
            sourceHeight = 700
        },
        {
            -- swipeP7
            x=998,
            y=629,
            width=496,
            height=625,

            sourceX = 35,
            sourceY = 21,
            sourceWidth = 600,
            sourceHeight = 700
        },
        {
            -- swipeP8
            x=1496,
            y=2,
            width=496,
            height=625,

            sourceX = 35,
            sourceY = 21,
            sourceWidth = 600,
            sourceHeight = 700
        },
    },
    
    sheetContentWidth = 1994,
    sheetContentHeight = 1256
}

SheetInfo.frameIndex =
{

    ["swipeP1"] = 1,
    ["swipeP2"] = 2,
    ["swipeP3"] = 3,
    ["swipeP4"] = 4,
    ["swipeP5"] = 5,
    ["swipeP6"] = 6,
    ["swipeP7"] = 7,
    ["swipeP8"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
