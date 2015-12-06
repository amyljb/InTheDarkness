--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:fb8aa1f9872a03c8dd895ed18238d5f0:6016f2509651563c4549bfce926e0041:a72a535e7b21e9518552ed87b0d7c7ca$
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
            -- freddieBlink1
            x=1,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
       
        {
            -- freddieBlink2
            x=1921,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink3
            x=1,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
           
        {
            -- 4
            x=1,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink5
            x=2305,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink6
            x=2689,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink7
            x=1537,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink8
            x=1537,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink9
            x=1537,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
         {
            -- freddieBlink10
            x=385,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink11
            x=769,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink12
            x=1153,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink13
            x=769,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink14
            x=385,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink15
            x=1537,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink16
            x=1537,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink17
            x=1537,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
        {
            -- freddieBlink18
            x=1537,
            y=1,
            width=382,
            height=1235,

            sourceX = 8,
            sourceY = 39,
            sourceWidth = 400,
            sourceHeight = 1300
        },
    },
    
    sheetContentWidth = 3072,
    sheetContentHeight = 1237
}

SheetInfo.frameIndex =
{

    ["freddieBlink1"] = 1,
    ["freddieBlink2"] = 2,
    ["freddieBlink3"] = 3,
    ["4"] = 4,
    ["freddieBlink5"] = 5,
    ["freddieBlink6"] = 6,
    ["freddieBlink7"] = 7,
    ["freddieBlink8"] = 8,
    ["freddieBlink9"] = 9,
    ["freddieBlink10"] = 10,
    ["freddieBlink11"] = 11,
    ["freddieBlink12"] = 12,
    ["freddieBlink13"] = 13,
    ["freddieBlink14"] = 14,
    ["freddieBlink15"] = 15,
    ["freddieBlink16"] = 16,
    ["freddieBlink18"] = 17,
    ["freddieBlink18"] = 18,
    ["freddieBlink1"] = 19,
    ["freddieBlink2"] = 20,
    ["freddieBlink3"] = 21,
    ["4"] = 22,
    ["freddieBlink5"] = 23,
    ["freddieBlink6"] = 24,
    ["freddieBlink7"] = 25,
    ["freddieBlink8"] = 26,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
