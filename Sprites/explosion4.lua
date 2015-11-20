--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0405427955e9f729ffa46e99e2f07e3c:cb4f3b822b894259839a245ea47cb000:7562283fc2ac8176a0bfd5680412d16d$
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
            -- explosion8
            x=956,
            y=2,
            width=1085,
            height=1075,

            sourceX = 53,
            sourceY = 59,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
        {
            -- explosion9
            x=2,
            y=2,
            width=952,
            height=1107,

            sourceX = 127,
            sourceY = 32,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
    },
    
    sheetContentWidth = 2043,
    sheetContentHeight = 1111
}

SheetInfo.frameIndex =
{

    ["explosion8"] = 1,
    ["explosion9"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
