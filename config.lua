--if ( string.sub( system.getInfo("model"), 1, 4 ) == "iPad" ) then
   application =
   {
      content =
      {
         width = display.contentWidth,
         height = display.contentHeight,
         scale = "letterbox",
         fps= 60,
         xAlign = "center",
         yAlign = "center",
         imageSuffix =
         {
            ["@2x"] = 2--,
            --["@4x"] = 3.0,
         },
     },
   }
--end
--1024 / 768 = 1.33  --screen ratio (height:width)
--1.33 x 360 = 480
