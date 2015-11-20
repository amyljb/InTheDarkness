--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:23011b009a2a5e9e3a83aa397d2d3825:d09614e564e5b6bf8383b10b646f4f9a:9318e7c443d4779c218b524382cbffb4$
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
            -- 3fr1
            x=1629,
            y=2,
            width=200,
            height=142,

            sourceX = 43,
            sourceY = 244,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 3fr2
            x=837,
            y=2,
            width=790,
            height=266,

            sourceX = 43,
            sourceY = 244,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 3fr3
            x=837,
            y=270,
            width=790,
            height=180,

            sourceX = 43,
            sourceY = 244,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- 3fr4
            x=2,
            y=2,
            width=833,
            height=488,

            sourceX = 43,
            sourceY = 22,
            sourceWidth = 900,
            sourceHeight = 550
        },
    },
    
    sheetContentWidth = 1831,
    sheetContentHeight = 492
}

SheetInfo.frameIndex =
{

    ["3fr1"] = 1,
    ["3fr2"] = 2,
    ["3fr3"] = 3,
    ["3fr4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
