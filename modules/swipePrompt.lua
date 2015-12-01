local promptTable = {}
     
function promptTable.swipeIndicator(sceneName, transitioned)
    print("swipe prompt called")
    if transitioned == false then
--arrow prompt    
   arrow = display.newImage("Images/arrow.png", true)
   arrow.rotation = 90
   arrow.x = display.contentWidth/2
   arrow.y = display.contentHeight/2 - 200

--hand swipe prompt   
   handSwipe = display.newImage("Images/hand2.png", true)
   handSwipe.x = display.contentWidth/2 - 150
   handSwipe.y = display.contentHeight/2
   handSwipe.rotation = 90
   
   if sceneName == "scene1" then
       arrow.rotation = 0
       handSwipe.rotation = 0
        transition.to(  handSwipe, { time=1000, x=display.contentWidth - 1500, onComplete = handDelete} ) 
   else
      transition.to(  handSwipe, { time=1000, y=display.contentHeight-1000, onComplete = handDelete} ) 
   end
end
end

function handDelete()
handSwipe:removeSelf()
   handSwipe = nil
arrow:removeSelf()
   arrow = nil
end
  
return promptTable

