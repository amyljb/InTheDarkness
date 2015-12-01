local instructions = {}

function textDelete(instructions)
   instructions.alpha = 0
   --instructions:removeSelf()
end   

function scaleDown(instructions)
    transition.scaleTo( instructions, { xScale=1.0, yScale=1.0, time=2000, onComplete=textDelete } )    
end    

function instructions.playInstructions(instructions, movedPage)
    if movedPage == false then
        print("playing instructions")
        instructions.alpha = 1
        transition.scaleTo( instructions, { xScale=1.1, yScale=1.1, time=2000, onComplete=scaleDown}) 
    end
end 

return instructions