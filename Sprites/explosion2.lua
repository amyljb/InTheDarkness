--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f93c4b4ce673a1f45490fff3b609a6d7:42f40b74c498152174053df0e0be5889:d233c3a65ee0fa44981c6613932cb6c0$
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
            -- explosion6
            x=2,
            y=2,
            width=970,
            height=1065,

            sourceX = 141,
            sourceY = 96,
            sourceWidth = 1200,
            sourceHeight = 1200
        },
    },
    
    sheetContentWidth = 974,
    sheetContentHeight = 1069
}

SheetInfo.frameIndex =
{

    ["explosion6"] = 1,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
