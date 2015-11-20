--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6175c5944fbd3f947dd44777b2517026:acdb01f5a3852ba8abf9f21985028285:7dcd55b1aa961aad63f931c012d002b4$
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
            -- eyes1
            x=2,
            y=2,
            width=305,
            height=871,

            sourceX = 72,
            sourceY = 53,
            sourceWidth = 500,
            sourceHeight = 950
        },
        {
            -- eyes2
            x=616,
            y=2,
            width=291,
            height=818,

            sourceX = 72,
            sourceY = 53,
            sourceWidth = 500,
            sourceHeight = 950
        },
        {
            -- eyes3
            x=1202,
            y=2,
            width=121,
            height=282,

            sourceX = 122,
            sourceY = 324,
            sourceWidth = 500,
            sourceHeight = 950
        },
        {
            -- eyes4
            x=909,
            y=2,
            width=291,
            height=818,

            sourceX = 72,
            sourceY = 53,
            sourceWidth = 500,
            sourceHeight = 950
        },
        {
            -- eyes5
            x=309,
            y=2,
            width=305,
            height=871,

            sourceX = 72,
            sourceY = 53,
            sourceWidth = 500,
            sourceHeight = 950
        },
    },
    
    sheetContentWidth = 1325,
    sheetContentHeight = 875
}

SheetInfo.frameIndex =
{

    ["eyes1"] = 1,
    ["eyes2"] = 2,
    ["eyes3"] = 3,
    ["eyes4"] = 4,
    ["eyes5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
