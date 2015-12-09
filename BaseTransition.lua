--ATTEMPT TO DEAL WITH PAGE TRANSITIONS
--TO BE EXPANDED ON IN FUTURE
require 'lua_objects'

local BaseTransition = newClass()

function BaseTransition:__new__(params)
    self.image = params.image
    self.time = params.time
    self.x = params.x
    self.listeners = params.listeners

    --    table.insert(listeners, params.listeners)
end

function BaseTransition:__destroy__()
    self.image = nil
    self.time = nil
    self.x = nil
    self.listeners = nil
end

function BaseTransition.__getters:getImage()
    return self.image
end

function BaseTransition.__getters:getTime()
    return self.time
end

function BaseTransition.__getters:getX()
    return self.x
end

function BaseTransition.__getters:getListeners()
    return self.listeners
end

return BaseTransition