--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8affaf83f41a5e6e31817a577ab53e5e:90307f121ef1da892cda05203c53a6d8:7f8cd3c110625dfaf04061cf40791b2e$
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
            -- curtainKitchen1
            x=1158,
            y=949,
            width=544,
            height=971,

            sourceX = 287,
            sourceY = 35,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen2
            x=1,
            y=1,
            width=562,
            height=979,

            sourceX = 287,
            sourceY = 31,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen3
            x=565,
            y=1,
            width=581,
            height=954,

            sourceX = 269,
            sourceY = 31,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen4
            x=577,
            y=957,
            width=579,
            height=950,

            sourceX = 271,
            sourceY = 33,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen5
            x=1148,
            y=1,
            width=574,
            height=946,

            sourceX = 275,
            sourceY = 35,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen6
            x=1,
            y=982,
            width=574,
            height=942,

            sourceX = 276,
            sourceY = 37,
            sourceWidth = 850,
            sourceHeight = 1050
        },
    },
    
    sheetContentWidth = 1723,
    sheetContentHeight = 1925
}

SheetInfo.frameIndex =
{

    ["curtainKitchen1"] = 1,
    ["curtainKitchen2"] = 2,
    ["curtainKitchen3"] = 3,
    ["curtainKitchen4"] = 4,
    ["curtainKitchen5"] = 5,
    ["curtainKitchen6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
