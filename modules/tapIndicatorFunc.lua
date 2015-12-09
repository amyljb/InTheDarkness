--plays tap indicator, indicator is passed from scene, pulses, scaling is canceled once scene is removed
local functionTable = {}
          
function functionTable.pulsateFunction(tapIndicator)
    if tapIndicator then
          if tapIndicator.alpha == 0 then
         tapIndicator.alpha=1
         end
     if tapIndicator.xScale == 1 then
         print("scaling")
        scaleTrans = transition.scaleTo( tapIndicator, { xScale=1.1, yScale=1.1, alpha=1, time=500, onComplete=functionTable.pulsateFunction } )
    else
        scaleTrans = transition.scaleTo( tapIndicator, { xScale=1.0, yScale=1.0, time=500, onComplete=functionTable.pulsateFunction})
         print("scaling down")
    end 
    return(scaleTrans) 
    end

end

return functionTable

