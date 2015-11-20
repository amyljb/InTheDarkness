--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0d642e5be260baaaa729318ea2c8701c:1bee93961da93c9b3e631e3116ac59f3:2007cebc6e050476a201431cedc594bd$
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
            -- shield1
            x=2,
            y=2,
            width=269,
            height=293,

            sourceX = 17,
            sourceY = 4,
            sourceWidth = 300,
            sourceHeight = 300
        },
        {
            -- shield2
            x=273,
            y=2,
            width=269,
            height=293,

            sourceX = 17,
            sourceY = 4,
            sourceWidth = 300,
            sourceHeight = 300
        },
        {
            -- shield3
            x=544,
            y=2,
            width=269,
            height=293,

            sourceX = 17,
            sourceY = 4,
            sourceWidth = 300,
            sourceHeight = 300
        },
        {
            -- shield4
            x=815,
            y=2,
            width=269,
            height=293,

            sourceX = 17,
            sourceY = 4,
            sourceWidth = 300,
            sourceHeight = 300
        },
        {
            -- shield5
            x=1086,
            y=2,
            width=269,
            height=293,

            sourceX = 17,
            sourceY = 4,
            sourceWidth = 300,
            sourceHeight = 300
        },
        {
            -- shield6
            x=1357,
            y=2,
            width=269,
            height=293,

            sourceX = 17,
            sourceY = 4,
            sourceWidth = 300,
            sourceHeight = 300
        },
    },
    
    sheetContentWidth = 1628,
    sheetContentHeight = 297
}

SheetInfo.frameIndex =
{

    ["shield1"] = 1,
    ["shield2"] = 2,
    ["shield3"] = 3,
    ["shield4"] = 4,
    ["shield5"] = 5,
    ["shield6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
