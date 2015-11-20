--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:28bc2e4dc47a4261ef400987e75fd38b:fd84f0c09511e846f283a114196da165:1d37dcde4a9ed331286274717dedeb5d$
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
            -- bt1
            x=1327,
            y=2,
            width=396,
            height=253,

            sourceX = 2,
            sourceY = 63,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- bt2
            x=501,
            y=2,
            width=308,
            height=279,

            sourceX = 45,
            sourceY = 40,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- bt3
            x=2,
            y=2,
            width=308,
            height=280,

            sourceX = 45,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- bt4
            x=312,
            y=2,
            width=187,
            height=280,

            sourceX = 106,
            sourceY = 27,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- bt5
            x=811,
            y=2,
            width=192,
            height=275,

            sourceX = 104,
            sourceY = 31,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- bt6
            x=1005,
            y=2,
            width=320,
            height=259,

            sourceX = 39,
            sourceY = 45,
            sourceWidth = 400,
            sourceHeight = 350
        },
    },
    
    sheetContentWidth = 1725,
    sheetContentHeight = 284
}

SheetInfo.frameIndex =
{

    ["bt1"] = 1,
    ["bt2"] = 2,
    ["bt3"] = 3,
    ["bt4"] = 4,
    ["bt5"] = 5,
    ["bt6"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
