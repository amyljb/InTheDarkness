--plays rub out prompt
local rubOutPrompt = {}
     
--path for hand to move
local movePath = {}
movePath[1] = { x=-100, y=200 }
movePath[2] = { x=200, y=-300 }
movePath[3] = { x=200, y=200 }
movePath[4] = { x=400, y=-200 }
movePath[5] = { x=500, y=400 }
movePath[6] = { x=700, y=-100 }

  local function distBetween( x1, y1, x2, y2 )
        local xFactor = x2 - x1
        local yFactor = y2 - y1
        local dist = math.sqrt( (xFactor*xFactor) + (yFactor*yFactor) )
        return dist
    end
    
local function removeHand()
    hand:removeSelf()
end
   --sets path for hand to move along    
    local function setPath( object, path, params )
        local delta = params.useDelta or nil
        local deltaX = 0
        local deltaY = 0
        local constant = params.constantRate or nil
        local ease = params.easingMethod or easing.linear
        local tag = params.tag or nil
        local delay = params.delay or 0
        local speedFactor = 1
    if ( delta ) then
        deltaX = object.x
        deltaY = object.y
    end
    if ( constant ) then
      local dist = distBetween( object.x, object.y, deltaX+path[1].x, deltaY+path[1].y )
      speedFactor = constant/dist
    end
    for i = 1,#path do
      local segmentTime = 400
      --if "constant" is defined, refactor transition time based on distance between points
      if ( constant ) then
         local dist
         if ( i == 1 ) then
            dist = distBetween( object.x, object.y, deltaX+path[i].x, deltaY+path[i].y )
         else
            dist = distBetween( path[i-1].x, path[i-1].y, path[i].x, path[i].y )
         end
         segmentTime = dist*speedFactor
         else
         --if this path segment has a custom time, use it
         if ( path[i].time ) then segmentTime = path[i].time end
      end
       --if this segment has custom easing, override the default method (if any)
      if ( path[i].easingMethod ) then ease = path[i].easingMethod end
      transition.to( object, { tag=tag, time=segmentTime, x=deltaX+path[i].x, y=deltaY+path[i].y, delay=delay, transition=ease } )
      delay = delay + segmentTime
        end
    end    
     
--initial function - displays hand, sets along path, removes     
function rubOutPrompt.rubOutIndicator(movedPage)
    if movedPage == false then
        hand = display.newImage( "Images/hand.png" , true )
        hand.x = display.contentWidth/3 --2 - 300
        hand.y = display.contentHeight/2
 
    setPath( hand, movePath, { useDelta=true, constantTime=1200, easingMethod=easing.inOutQuad, delay=500, tag="moveObject" } )
    timer.performWithDelay(3500, removeHand)  
    end
end
return rubOutPrompt

