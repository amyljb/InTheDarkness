--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:4f0826eecd804cbe131e2e0dbcdb2fe4:b170335b238162eef941f50d32532271:5f75a229f3cba87aa2d2b08fcd7a3fbf$
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
            -- bf1
            x=2,
            y=2,
            width=338,
            height=303,

            sourceX = 6,
            sourceY = 23,
            sourceWidth = 350,
            sourceHeight = 350
        },
        {
            -- bf2
            x=342,
            y=2,
            width=288,
            height=299,

            sourceX = 36,
            sourceY = 29,
            sourceWidth = 350,
            sourceHeight = 350
        },
        {
            -- bf3
            x=1480,
            y=2,
            width=248,
            height=273,

            sourceX = 50,
            sourceY = 37,
            sourceWidth = 350,
            sourceHeight = 350
        },
        {
            -- bf4
            x=1269,
            y=2,
            width=209,
            height=276,

            sourceX = 63,
            sourceY = 29,
            sourceWidth = 350,
            sourceHeight = 350
        },
        {
            -- bf5
            x=849,
            y=2,
            width=160,
            height=286,

            sourceX = 87,
            sourceY = 30,
            sourceWidth = 350,
            sourceHeight = 350
        },
        {
            -- bf6
            x=632,
            y=2,
            width=215,
            height=286,

            sourceX = 59,
            sourceY = 31,
            sourceWidth = 350,
            sourceHeight = 350
        },
        {
            -- bf7
            x=1011,
            y=2,
            width=256,
            height=284,

            sourceX = 43,
            sourceY = 24,
            sourceWidth = 350,
            sourceHeight = 350
        },
        {
            -- bf8
            x=1730,
            y=2,
            width=284,
            height=272,

            sourceX = 34,
            sourceY = 32,
            sourceWidth = 350,
            sourceHeight = 350
        },
        {
            -- bf9
            x=2,
            y=2,
            width=338,
            height=303,

            sourceX = 6,
            sourceY = 23,
            sourceWidth = 350,
            sourceHeight = 350
        },
    },
    
    sheetContentWidth = 2016,
    sheetContentHeight = 307
}

SheetInfo.frameIndex =
{

    ["bf1"] = 1,
    ["bf2"] = 2,
    ["bf3"] = 3,
    ["bf4"] = 4,
    ["bf5"] = 5,
    ["bf6"] = 6,
    ["bf7"] = 7,
    ["bf8"] = 8,
    ["bf9"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
