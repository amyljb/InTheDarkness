--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9348cc3bc00e7e87725654f01cd5169d:222756a3fc95e59aaaf03549bfa9a107:d64e56c997fb60033d0f70ccb8340e33$
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
            -- lungs1
            x=844,
            y=391,
            width=353,
            height=372,

            sourceX = 46,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },

        {
            -- lungs2
            x=844,
            y=2,
            width=373,
            height=387,

            sourceX = 36,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
        {
            -- lungs3
            x=454,
            y=2,
            width=388,
            height=397,

            sourceX = 29,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
        {
            -- lungs4
            x=439,
            y=453,
            width=403,
            height=413,

            sourceX = 21,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
        {
            -- lungs5
            x=2,
            y=453,
            width=435,
            height=438,

            sourceX = 7,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
        {
            -- lungs6
            x=2,
            y=2,
            width=450,
            height=449,

            sourceX = 0,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
        {
            -- lungs7
            x=2,
            y=453,
            width=435,
            height=438,

            sourceX = 7,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
        {
            -- lungs8
            x=439,
            y=453,
            width=403,
            height=413,

            sourceX = 21,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
        {
            -- lungs9
            x=454,
            y=2,
            width=388,
            height=397,

            sourceX = 29,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
         {
            -- lungs10
            x=844,
            y=2,
            width=373,
            height=387,

            sourceX = 36,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
        {
            -- lungs11
            x=844,
            y=391,
            width=353,
            height=372,

            sourceX = 46,
            sourceY = 1,
            sourceWidth = 450,
            sourceHeight = 450
        },
    },
    
    sheetContentWidth = 1219,
    sheetContentHeight = 893
}

SheetInfo.frameIndex =
{

    ["lungs1"] = 1,
    ["lungs2"] = 2,
    ["lungs3"] = 3,
    ["lungs4"] = 4,
    ["lungs5"] = 5,
    ["lungs6"] = 6,
    ["lungs7"] = 7,
    ["lungs8"] = 8,
    ["lungs9"] = 9,
    ["lungs10"] = 10,
    ["lungs11"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
