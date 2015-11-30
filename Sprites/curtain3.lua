--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d82447da8235feba9ca8f9be1f0ccb93:b50be0d3195158732a12c01fc5e03075:4bcab36fdf0375d47732eccc9a90f2d3$
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
            -- curtainKitchen13
            x=1,
            y=1,
            width=556,
            height=859,

            sourceX = 287,
            sourceY = 70,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen14
            x=559,
            y=1,
            width=562,
            height=855,

            sourceX = 288,
            sourceY = 72,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen15
            x=1123,
            y=1,
            width=560,
            height=853,

            sourceX = 289,
            sourceY = 73,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen16
            x=1123,
            y=856,
            width=558,
            height=850,

            sourceX = 290,
            sourceY = 75,
            sourceWidth = 850,
            sourceHeight = 1050
        },
        {
            -- curtainKitchen17
            x=559,
            y=858,
            width=554,
            height=848,

            sourceX = 293,
            sourceY = 76,
            sourceWidth = 850,
            sourceHeight = 1050
        },
    },
    
    sheetContentWidth = 1684,
    sheetContentHeight = 1707
}

SheetInfo.frameIndex =
{

    ["curtainKitchen13"] = 1,
    ["curtainKitchen14"] = 2,
    ["curtainKitchen15"] = 3,
    ["curtainKitchen16"] = 4,
    ["curtainKitchen17"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
