local functionTable = {}
          
function functionTable.pulsateFunction(tapIndicator, indTapped)
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
    --local stopClosure = function() return stopScale( tapIndicator ) end
   -- timer.performWithDelay( 6000, stopClosure, 1 )
end
--function stopScale(tapIndicator)
 --   print("stopping scale")
 --   transition.cancel(scaleTrans)
 --   tapIndicator.alpha=0
--end

return functionTable

