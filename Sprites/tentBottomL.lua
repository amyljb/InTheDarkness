--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:37deae8cdaf33636d94aa27fe9831d99:66376bd7f08f4899deb6d7289e173a5d:5dff7c620a39014afd67e2a5a060b16c$
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
            -- bottomL1
            x=1191,
            y=637,
            width=685,
            height=416,

            sourceX = 15,
            sourceY = 92,
            sourceWidth = 700,
            sourceHeight = 600
        },
    
        {
            -- bottom2
            x=550,
            y=2,
            width=681,
            height=295,

            sourceX = 12,
            sourceY = 96,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom3
            x=2,
            y=299,
            width=693,
            height=305,

            sourceX = 2,
            sourceY = 68,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom4
            x=624,
            y=621,
            width=565,
            height=371,

            sourceX = 135,
            sourceY = 130,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom5
            x=1039,
            y=1055,
            width=499,
            height=449,

            sourceX = 201,
            sourceY = 131,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom6
            x=531,
            y=994,
            width=506,
            height=448,

            sourceX = 194,
            sourceY = 117,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom7
            x=2,
            y=940,
            width=527,
            height=424,

            sourceX = 165,
            sourceY = 111,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom8
            x=2,
            y=2,
            width=546,
            height=292,

            sourceX = 143,
            sourceY = 129,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom9
            x=1233,
            y=2,
            width=554,
            height=303,

            sourceX = 132,
            sourceY = 137,
            sourceWidth = 700,
            sourceHeight = 600
        },
         {
            -- bottom10
            x=2,
            y=606,
            width=620,
            height=332,

            sourceX = 80,
            sourceY = 134,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom11
            x=697,
            y=307,
            width=664,
            height=312,

            sourceX = 36,
            sourceY = 85,
            sourceWidth = 700,
            sourceHeight = 600
        },
        {
            -- bottom12
            x=1363,
            y=307,
            width=639,
            height=328,

            sourceX = 61,
            sourceY = 50,
            sourceWidth = 700,
            sourceHeight = 600
        },
    },
    
    sheetContentWidth = 2004,
    sheetContentHeight = 1506
}

SheetInfo.frameIndex =
{

    ["bottomL1"] = 1,
    ["bottom2"] = 2,
    ["bottom3"] = 3,
    ["bottom4"] = 4,
    ["bottom5"] = 5,
    ["bottom6"] = 6,
    ["bottom7"] = 7,
    ["bottom8"] = 8,
    ["bottom9"] = 9,
    ["bottom10"] = 10,
    ["bottom11"] = 11,
    ["bottom12"] = 12,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
