--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:da7b5fbfe4624a77866731d73c2356e4:603ec6bfccdf909006681da4be4d024f:b5a1580b333f6ce0491d6c603e4f5403$
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
            -- explosion1
            x=360,
            y=1067,
            width=341,
            height=696,

            sourceX = 472,
            sourceY = 488,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion2
            x=2,
            y=1067,
            width=356,
            height=818,

            sourceX = 458,
            sourceY = 366,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion3
            x=931,
            y=996,
            width=730,
            height=969,

            sourceX = 256,
            sourceY = 193,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion4
            x=931,
            y=2,
            width=862,
            height=992,

            sourceX = 213,
            sourceY = 169,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion5
            x=2,
            y=2,
            width=927,
            height=1063,

            sourceX = 182,
            sourceY = 96,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
    },
    
    sheetContentWidth = 1795,
    sheetContentHeight = 1967
}

SheetInfo.frameIndex =
{

    ["explosion1"] = 1,
    ["explosion2"] = 2,
    ["explosion3"] = 3,
    ["explosion4"] = 4,
    ["explosion5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
