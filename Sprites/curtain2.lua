--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e27f0f6f18dd56a0407836cf14b9ebe8:00ee305e662d27e1430917b74686f8b1:4e8a2624ffada65648da8a8733ba2981$
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
            -- curtainKitchen7
            x=1,
            y=1,
            width=591,
            height=911,

            sourceX = 258,
            sourceY = 53,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen8
            x=594,
            y=1,
            width=586,
            height=906,

            sourceX = 262,
            sourceY = 56,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen9
            x=1182,
            y=1,
            width=565,
            height=879,

            sourceX = 282,
            sourceY = 58,
            sourceWidth = 850,
            sourceHeight = 1050
        },     {
            -- curtainKitchen10
            x=1182,
            y=882,
            width=563,
            height=875,

            sourceX = 283,
            sourceY = 60,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen11
            x=594,
            y=909,
            width=561,
            height=871,

            sourceX = 284,
            sourceY = 62,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen12
            x=1,
            y=914,
            width=558,
            height=863,

            sourceX = 286,
            sourceY = 68,
            sourceWidth = 850,
            sourceHeight = 1050
        },
    },
    
    sheetContentWidth = 1748,
    sheetContentHeight = 1781
}

SheetInfo.frameIndex =
{

    ["curtainKitchen7"] = 1,
    ["curtainKitchen8"] = 2,
    ["curtainKitchen9"] = 3,
    ["curtainKitchen10"] = 4,
    ["curtainKitchen11"] = 5,
    ["curtainKitchen12"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
