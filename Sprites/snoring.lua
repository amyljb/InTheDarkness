--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:40f30f5360963a82d845370f36c607db:afaaf0215f77dffe7a01e714e75d55f3:1e3a2aa031bb97ae8d33b25e94985ba1$
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
            x=498,
            y=266,
            width=46,
            height=66,

            sourceX = 27,
            sourceY = 308,
            sourceWidth = 400,
            sourceHeight = 400
        },
        {
            -- z2
            x=2,
            y=326,
            width=102,
            height=131,

            sourceX = 27,
            sourceY = 243,
            sourceWidth = 400,
            sourceHeight = 400
        },
        {
            -- z3
            x=328,
            y=266,
            width=168,
            height=196,

            sourceX = 27,
            sourceY = 178,
            sourceWidth = 400,
            sourceHeight = 400
        },
        {
            -- z4
            x=328,
            y=2,
            width=242,
            height=262,

            sourceX = 27,
            sourceY = 112,
            sourceWidth = 400,
            sourceHeight = 400
        },
        {
            -- z5
            x=2,
            y=2,
            width=324,
            height=322,

            sourceX = 27,
            sourceY = 52,
            sourceWidth = 400,
            sourceHeight = 400
        },
    },
    
    sheetContentWidth = 572,
    sheetContentHeight = 464
}

SheetInfo.frameIndex =
{

    ["z1"] = 1,
    ["z2"] = 2,
    ["z3"] = 3,
    ["z4"] = 4,
    ["z5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
