--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:35b1b19e0a248df58392b24b59bb48ff:6453171647f1f74d08912d73cb758c67:89b59855df8f190838f67829ad534f56$
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
            -- monster1
            x=959,
            y=421,
            width=285,
            height=418,

            sourceX = 43,
            sourceY = 19,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster2
            x=1246,
            y=421,
            width=285,
            height=418,

            sourceX = 43,
            sourceY = 19,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster3
            x=652,
            y=1,
            width=307,
            height=418,

            sourceX = 43,
            sourceY = 19,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster4
            x=652,
            y=421,
            width=305,
            height=418,

            sourceX = 43,
            sourceY = 19,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster5
            x=334,
            y=1,
            width=314,
            height=411,

            sourceX = 52,
            sourceY = 26,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster6
            x=1,
            y=414,
            width=328,
            height=411,

            sourceX = 33,
            sourceY = 26,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster7
            x=1,
            y=1,
            width=331,
            height=411,

            sourceX = 30,
            sourceY = 26,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster8
            x=331,
            y=414,
            width=319,
            height=411,

            sourceX = 42,
            sourceY = 26,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster9
            x=1248,
            y=1,
            width=285,
            height=418,

            sourceX = 43,
            sourceY = 19,
            sourceWidth = 370,
            sourceHeight = 450
        },
        {
            -- monster10
            x=961,
            y=1,
            width=285,
            height=418,

            sourceX = 43,
            sourceY = 19,
            sourceWidth = 370,
            sourceHeight = 450
        },
    },
    
    sheetContentWidth = 1534,
    sheetContentHeight = 840
}

SheetInfo.frameIndex =
{

    ["monster1"] = 1,
    ["monster2"] = 2,
    ["monster3"] = 3,
    ["monster4"] = 4,
    ["monster5"] = 5,
    ["monster6"] = 6,
    ["monster7"] = 7,
    ["monster8"] = 8,
    ["monster9"] = 9,
    ["monster10"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
