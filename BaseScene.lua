require 'lua_objects'
local BaseTransition = require "BaseTransition"

local BaseScene = newClass()

function BaseScene:__new__(params)
    self.name = params.name
    self.data = params.data
    self.transitions = params.transitions
    self.nextScene = params.nextScene
end

function BaseScene:__destroy__()
    self.name = nil
    self.data = nil
    self.transitions = nil
    self.nextScene = nil
end

function BaseScene.__getters:getName()
    return self.name
end

function BaseScene.__getters:getData()
    print(self.data)
    return self.data
end

function BaseScene:setBackground(value)
    self.background = value
end

function BaseScene.__getters:getBackground()
    return self.background
end

function BaseScene.__getters:transitions()
    return self.transitions
end

function BaseScene.__getters:getForegroundImages()
    return self.data.images.background
end

function BaseScene.__getters:getNextScene()
    return self.nextScene
end

function BaseScene.__getters:setNextScene(value)
    self.nextScene = value
end

--function BaseScene:getById(id)
--
--    return data.images.background
--end


function createTransition(image, transition)

    return BaseTransition:new({
        image = image,
        time = transition.time,
        x = getXCoordinates(transition.x),
        listeners = transition.listeners
    })
end

function getXCoordinates(coordData)
    local x = 0

    if (coordData.base) then
        x = display.contentWidth
    elseif (coordData.value) then
        x = coordData.value
    end

    if (coordData.op and coordData.value) then
        local op = coordData.op;
        local value = coordData.value;

        if (op == "/") then
            x = x / value;
        elseif (op == "*") then
            x = x * value
        elseif (op == "-") then
            x = x - value
        elseif (op == "+") then
            x = x + value
        end
    end

    return x
end

function getYCoordinates(coordData)
    local y = 0

    if (coordData.base) then
        y = display.contentHeight
    elseif (coordData.value) then
        y = coordData.value
    end

    if (coordData.op and coordData.value) then
        local op = coordData.op;
        local value = coordData.value;

        if (op == "/") then
            y = y / value;
        elseif (op == "*") then
            y = y * value
        elseif (op == "-") then
            y = y - value
        elseif (op == "+") then
            y = y + value
        end
    end

    return y
end

function BaseScene:init()

    local sceneComponents = {}

    local transitions = self.transitions
    local data = self.data

    --    Load text
    if (data.text) then
        local textData = data.text

        for i = 1, #textData do
            local x = getXCoordinates(textData[i].x)
            local y = getYCoordinates(textData[i].y)

            local text = display.newText(textData[i].value, x, y, native.systemFont, textData[i].fontSize)
            text:setFillColor(textData[i].color.r, textData[i].color.g, textData[i].color.b)

            table.insert(sceneComponents, text)


            if textData[i].transition then
                local transition = createTransition(text, textData[i].transition)
                table.insert(transitions, transition)
            end
        end
    end

    return sceneComponents
end

function BaseScene:getText()
    local data = self.data
    if (data.text) then
        local textData = data.text
        print("returned text")
        return textData
    end
end

return BaseScene