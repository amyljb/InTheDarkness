--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:a4eb5b17fbc1be8128314db8f0558be9:df1cea04f1764f551595d0c58a05a64e:c164febafe51640f10f63ad8304e1d31$
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
            -- dizzy1
            x=1082,
            y=259,
            width=507,
            height=289,

            sourceX = 47,
            sourceY = 0,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- dizzy2
            x=551,
            y=287,
            width=529,
            height=268,

            sourceX = 41,
            sourceY = 17,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- dizzy3
            x=1,
            y=288,
            width=548,
            height=260,

            sourceX = 30,
            sourceY = 26,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- dizzy4
            x=1,
            y=1,
            width=531,
            height=285,

            sourceX = 25,
            sourceY = 0,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- dizzy5
            x=534,
            y=1,
            width=531,
            height=284,

            sourceX = 24,
            sourceY = 2,
            sourceWidth = 600,
            sourceHeight = 300
        },
        {
            -- dizzy6
            x=1067,
            y=1,
            width=536,
            height=256,

            sourceX = 26,
            sourceY = 31,
            sourceWidth = 600,
            sourceHeight = 300
        },
    },
    
    sheetContentWidth = 1604,
    sheetContentHeight = 556
}

SheetInfo.frameIndex =
{

    ["dizzy1"] = 1,
    ["dizzy2"] = 2,
    ["dizzy3"] = 3,
    ["dizzy4"] = 4,
    ["dizzy5"] = 5,
    ["dizzy6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
