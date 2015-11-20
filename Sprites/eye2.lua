--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6d693bcadb254dec06e0679f47f9385a:8f5e66ca8c0910e62c3135e573a1a955:384db18ea4f5d81fa26353f3d5dc3e54$
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
            -- catEye1
            x=506,
            y=2,
            width=250,
            height=56,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 250,
            sourceHeight = 80
        },
        {
            -- catEye2
            x=2,
            y=2,
            width=250,
            height=58,

            sourceX = 0,
            sourceY = 9,
            sourceWidth = 250,
            sourceHeight = 80
        },
        {
            -- catEye3
            x=254,
            y=2,
            width=250,
            height=57,

            sourceX = 0,
            sourceY = 10,
            sourceWidth = 250,
            sourceHeight = 80
        },
        {
            -- catEye4
            x=758,
            y=2,
            width=250,
            height=56,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 250,
            sourceHeight = 80
        },
        {
            -- catEye5
            x=1010,
            y=2,
            width=250,
            height=56,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 250,
            sourceHeight = 80
        },
    },
    
    sheetContentWidth = 1262,
    sheetContentHeight = 62
}

SheetInfo.frameIndex =
{

    ["catEye1"] = 1,
    ["catEye2"] = 2,
    ["catEye3"] = 3,
    ["catEye4"] = 4,
    ["catEye5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
