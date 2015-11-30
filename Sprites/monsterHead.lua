--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e3d4841614bade8ba0e59530b09b6256:e575a2acea2e1c66421c36147d323992:c24f76c3f6c33a8105be9611c656f202$
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
            -- 1
            x=1145,
            y=1,
            width=375,
            height=476,

            sourceX = 25,
            sourceY = 24,
            sourceWidth = 400,
            sourceHeight = 500
        },
     
        {
            -- 2
            x=1,
            y=483,
            width=379,
            height=478,

            sourceX = 21,
            sourceY = 22,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 3
            x=1,
            y=1,
            width=384,
            height=480,

            sourceX = 16,
            sourceY = 20,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 4
            x=1,
            y=483,
            width=379,
            height=478,

            sourceX = 21,
            sourceY = 22,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 5
            x=1145,
            y=1,
            width=375,
            height=476,

            sourceX = 25,
            sourceY = 24,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 6
            x=1138,
            y=479,
            width=376,
            height=475,

            sourceX = 24,
            sourceY = 25,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 7
            x=387,
            y=1,
            width=378,
            height=475,

            sourceX = 22,
            sourceY = 25,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 8
            x=760,
            y=478,
            width=376,
            height=475,

            sourceX = 24,
            sourceY = 25,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 9
            x=382,
            y=483,
            width=376,
            height=475,

            sourceX = 24,
            sourceY = 25,
            sourceWidth = 400,
            sourceHeight = 500
        },
           {
            -- 10
            x=767,
            y=1,
            width=376,
            height=475,

            sourceX = 24,
            sourceY = 25,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 11
            x=382,
            y=483,
            width=376,
            height=475,

            sourceX = 24,
            sourceY = 25,
            sourceWidth = 400,
            sourceHeight = 500
        },
        {
            -- 12
            x=760,
            y=478,
            width=376,
            height=475,

            sourceX = 24,
            sourceY = 25,
            sourceWidth = 400,
            sourceHeight = 500
        },
    },
    
    sheetContentWidth = 1521,
    sheetContentHeight = 962
}

SheetInfo.frameIndex =
{

    ["1"] = 1,
    ["2"] = 2,
    ["3"] = 3,
    ["4"] = 4,
    ["5"] = 5,
    ["6"] = 6,
    ["7"] = 7,
    ["8"] = 8,
    ["9"] = 9,
    ["10"] = 10,
    ["11"] = 11,
    ["12"] = 12,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
