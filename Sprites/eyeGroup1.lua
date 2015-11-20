--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:79505b78c6d43a779efddf4fcb3c0c59:29a6d3ada1896cdd4ea331aaf54bc590:9cdaee72a3ec1e30d2ba72e61273777b$
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
            -- frame1
            x=785,
            y=467,
            width=574,
            height=315,

            sourceX = 72,
            sourceY = 53,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- frame2
            x=2,
            y=2,
            width=781,
            height=497,

            sourceX = 72,
            sourceY = 53,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- frame3
            x=785,
            y=2,
            width=731,
            height=463,

            sourceX = 122,
            sourceY = 87,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- frame4
            x=785,
            y=467,
            width=574,
            height=315,

            sourceX = 72,
            sourceY = 53,
            sourceWidth = 900,
            sourceHeight = 550
        },
        {
            -- frame5
            x=2,
            y=2,
            width=781,
            height=497,

            sourceX = 72,
            sourceY = 53,
            sourceWidth = 900,
            sourceHeight = 550
        },
    },
    
    sheetContentWidth = 1518,
    sheetContentHeight = 784
}

SheetInfo.frameIndex =
{

    ["frame1"] = 1,
    ["frame2"] = 2,
    ["frame3"] = 3,
    ["frame4"] = 4,
    ["frame5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
