-----------------------------------------------------------------------------------------
--
-- rain.lua

-----------------------------------------------------------------------------------------
local screenW, screenH = display.contentWidth, display.contentHeight

local rain = {}
local rain_mt = { __index = rain }
local composer = require( "composer" )

-- EnterFrame handler
function rain.rainHandler( e )
	for i = 1, rain.group.numChildren, 1 do
		if rain.group[i].name == "rainDrop" then
			local drop = rain.group[i]
			if drop.y < rain.rainFloor then
				drop.x = drop.x + rain.rainRight * rain.dropLength*math.cos(rain.rainAngle) * drop.dropSpeed --rain.rainSpeed
				drop.y = drop.y + rain.dropLength * drop.dropSpeed --rain.rainSpeed
			else
				drop.x = drop.x0
				drop.y = drop.y0
			end
		end
	end
end

-- Constructor
function rain.new(group, config)
    rain.group = group

    -- Config
	rain.rainAngle = math.rad(config.angle or 70)
	rain.rainRight = -1
	if config.toRight then
		rain.rainRight = 1
	end
	local dropsCount = config.count or 500

		rain.rainSpeed = config.speed or 1.2
		rain.rainFloor = screenH - (config.floor or 0)
		rain.dropLength = 50 --config.length or 45
		rain.dropWidth = 2 --config.width or 1
		rain.dropAlpha = 0.8
		rain.dropColor = config.color or 0.8
    -- Drops
	for i = 1, dropsCount, 1 do
		local dy = math.random(screenH+100)
		local x, y = i*10 - rain.rainRight*(screenW*math.cos(rain.rainAngle)), -50-dy
		local drop
		-- Rain

            drop = display.newLine(x, y, x + rain.rainRight * rain.dropLength*math.cos(rain.rainAngle), y + rain.dropLength)
            drop.width = rain.dropWidth
			drop:setColor( rain.dropColor )
			drop.dropSpeed = rain.rainSpeed
			drop.alpha = rain.dropAlpha
		drop.x0, drop.y0 = x, y
		drop.name = "rainDrop"
		group:insert(drop)
	end
	Runtime:addEventListener( "enterFrame", rain.rainHandler )
end

function rain.pause()
	Runtime:removeEventListener( "enterFrame", rain.rainHandler )
end

function rain.resume()
	Runtime:addEventListener( "enterFrame", rain.rainHandler )
end

return rain

----------------
-- End.
----------------