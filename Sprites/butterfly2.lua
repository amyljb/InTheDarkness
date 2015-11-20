--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:26bd26c2a8930693e2fb09287b4e4686:c53350b251c789256a0296147d045b2d:150e7667a6e4c428c4ee43957ece8706$
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
            -- butterfly-1
            x=329,
            y=279,
            width=161,
            height=336,

            sourceX = 79,
            sourceY = 8,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- butterfly-2
            x=318,
            y=617,
            width=166,
            height=331,

            sourceX = 74,
            sourceY = 13,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- butterfly-3
            x=271,
            y=1294,
            width=220,
            height=323,

            sourceX = 51,
            sourceY = 20,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- butterfly-4
            x=2,
            y=1134,
            width=267,
            height=280,

            sourceX = 40,
            sourceY = 54,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- butterfly-5
            x=2,
            y=560,
            width=314,
            height=266,

            sourceX = 40,
            sourceY = 69,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- butterfly-6
            x=2,
            y=2,
            width=346,
            height=275,

            sourceX = 29,
            sourceY = 71,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- butterfly-7
            x=2,
            y=279,
            width=325,
            height=279,

            sourceX = 33,
            sourceY = 64,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- butterfly-8
            x=2,
            y=828,
            width=275,
            height=304,

            sourceX = 40,
            sourceY = 40,
            sourceWidth = 400,
            sourceHeight = 350
        },
        {
            -- butterfly-9
            x=2,
            y=1416,
            width=216,
            height=321,

            sourceX = 53,
            sourceY = 22,
            sourceWidth = 400,
            sourceHeight = 350
        },
        
        {
            -- butterfly-10
            x=279,
            y=950,
            width=165,
            height=342,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 400,
            sourceHeight = 350
        },
    },
    
    sheetContentWidth = 493,
    sheetContentHeight = 1739
}

SheetInfo.frameIndex =
{

    ["butterfly-1"] = 1,
    ["butterfly-2"] = 2,
    ["butterfly-3"] = 3,
    ["butterfly-4"] = 4,
    ["butterfly-5"] = 5,
    ["butterfly-6"] = 6,
    ["butterfly-7"] = 7,
    ["butterfly-8"] = 8,
    ["butterfly-9"] = 9,
    ["butterfly-10"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
