--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d82ec0b05e7dbf520125fe831a22a266:ae96bd6178ee0238f3bfb0f107ce27f0:80711eca9293d5c3957d183b7bcee59b$
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
            -- breath1
            x=2,
            y=2,
            width=780,
            height=1533,

            sourceX = 143,
            sourceY = 3,
            sourceWidth = 1000,
            sourceHeight = 1536
        },
        {
            -- breath2
            x=2,
            y=1537,
            width=780,
            height=1533,

            sourceX = 143,
            sourceY = 3,
            sourceWidth = 1000,
            sourceHeight = 1536
        },
        {
            -- breath3
            x=784,
            y=2,
            width=780,
            height=1533,

            sourceX = 143,
            sourceY = 3,
            sourceWidth = 1000,
            sourceHeight = 1536
        },
    },
    
    sheetContentWidth = 1566,
    sheetContentHeight = 3072
}

SheetInfo.frameIndex =
{

    ["breath1"] = 1,
    ["breath2"] = 2,
    ["breath3"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
