--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ed4e30c452e6586581304a75d1268557:5fc4833571feb44e1395f51a6a2b2d6d:020d1eb43f67710ed512bccd1c3c33d2$
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
            -- eye1
            x=2,
            y=2,
            width=204,
            height=150,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 210,
            sourceHeight = 150
        },
        {
            -- eye2
            x=2,
            y=154,
            width=204,
            height=150,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 210,
            sourceHeight = 150
        },
        {
            -- eye3
            x=2,
            y=306,
            width=204,
            height=150,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 210,
            sourceHeight = 150
        },
        {
            -- eye4
            x=2,
            y=458,
            width=204,
            height=150,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 210,
            sourceHeight = 150
        },
        {
            -- eye5
            x=2,
            y=610,
            width=204,
            height=150,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 210,
            sourceHeight = 150
        },
        {
            -- eye6
            x=2,
            y=458,
            width=204,
            height=150,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 210,
            sourceHeight = 150
        },
        {
            -- eye7
            x=2,
            y=306,
            width=204,
            height=150,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 210,
            sourceHeight = 150
        },
        {
            -- eye8
            x=2,
            y=154,
            width=204,
            height=150,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 210,
            sourceHeight = 150
        },
    },
    
    sheetContentWidth = 208,
    sheetContentHeight = 762
}

SheetInfo.frameIndex =
{

    ["eye1"] = 1,
    ["eye2"] = 2,
    ["eye3"] = 3,
    ["eye4"] = 4,
    ["eye5"] = 5,
    ["eye6"] = 6,
    ["eye7"] = 7,
    ["eye8"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
