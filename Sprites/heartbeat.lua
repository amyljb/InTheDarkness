--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9c4e2d9f22c93ec8970aa4eab7023add:622745e9330c2001dd482b1f97cd0bd4:2b559ab412beda24f2d4edc59fe1d313$
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
            -- heart1
            x=1,
            y=1,
            width=421,
            height=493,

            sourceX = 43,
            sourceY = 4,
            sourceWidth = 500,
            sourceHeight = 500
        },
        {
            -- heart2
            x=424,
            y=1,
            width=405,
            height=486,

            sourceX = 55,
            sourceY = 4,
            sourceWidth = 500,
            sourceHeight = 500
        },
        {
            -- heart3
            x=831,
            y=1,
            width=386,
            height=485,

            sourceX = 74,
            sourceY = 4,
            sourceWidth = 500,
            sourceHeight = 500
        },
    },
    
    sheetContentWidth = 1218,
    sheetContentHeight = 495
}

SheetInfo.frameIndex =
{

    ["heart1"] = 1,
    ["heart2"] = 2,
    ["heart3"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
