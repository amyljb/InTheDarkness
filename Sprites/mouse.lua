--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:46fc9fcb412477105e5d49d9322307c6:a2e098a867422042fb6cd6131dc81022:6d458abe3e14a4a84d7c7f750c02a3dc$
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
            -- mouse1
            x=1209,
            y=1,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse10
            x=1,
            y=394,
            width=300,
            height=379,

            sourceX = 0,
            sourceY = 13,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse11
            x=303,
            y=1,
            width=300,
            height=385,

            sourceX = 0,
            sourceY = 7,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse12
            x=303,
            y=1,
            width=300,
            height=385,

            sourceX = 0,
            sourceY = 7,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse13
            x=303,
            y=1,
            width=300,
            height=385,

            sourceX = 0,
            sourceY = 7,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse14
            x=303,
            y=388,
            width=300,
            height=385,

            sourceX = 0,
            sourceY = 7,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse15
            x=605,
            y=1,
            width=300,
            height=385,

            sourceX = 0,
            sourceY = 7,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse16
            x=605,
            y=388,
            width=300,
            height=385,

            sourceX = 0,
            sourceY = 7,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse17
            x=907,
            y=1,
            width=300,
            height=384,

            sourceX = 0,
            sourceY = 8,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse18
            x=1,
            y=1,
            width=300,
            height=391,

            sourceX = 0,
            sourceY = 1,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse19
            x=1,
            y=1,
            width=300,
            height=391,

            sourceX = 0,
            sourceY = 1,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse2
            x=1209,
            y=1,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse3
            x=1209,
            y=1,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse4
            x=1209,
            y=384,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse5
            x=907,
            y=387,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse6
            x=1209,
            y=1,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse7
            x=1209,
            y=1,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse8
            x=1209,
            y=1,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
        {
            -- mouse9
            x=1209,
            y=1,
            width=300,
            height=381,

            sourceX = 0,
            sourceY = 11,
            sourceWidth = 300,
            sourceHeight = 400
        },
    },
    
    sheetContentWidth = 1510,
    sheetContentHeight = 774
}

SheetInfo.frameIndex =
{

    ["mouse1"] = 1,
    ["mouse10"] = 2,
    ["mouse11"] = 3,
    ["mouse12"] = 4,
    ["mouse13"] = 5,
    ["mouse14"] = 6,
    ["mouse15"] = 7,
    ["mouse16"] = 8,
    ["mouse17"] = 9,
    ["mouse18"] = 10,
    ["mouse19"] = 11,
    ["mouse2"] = 12,
    ["mouse3"] = 13,
    ["mouse4"] = 14,
    ["mouse5"] = 15,
    ["mouse6"] = 16,
    ["mouse7"] = 17,
    ["mouse8"] = 18,
    ["mouse9"] = 19,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
