---[[
--- THIS IS MY UTILS
---]]

local Utils = {}

Utils.distance2D = function(x1, x2, y1, y2)
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

Utils.abb = function(x, y, t)
	return x > t.x and x < t.x + t.width and y > t.y and y < t.y + t.height
end

Utils.hrgba = function(hex)
	hex = hex:gsub("#", "")

	local r = tonumber(hex:sub(1, 2), 16) / 255
	local g = tonumber(hex:sub(3, 4), 16) / 255
	local b = tonumber(hex:sub(5, 6), 16) / 255

	local a = 1
	if #hex == 8 then
		a = tonumber(hex:sub(7, 8), 16) / 255
	end

	return { r, g, b, a }
end

Utils.lerp = function(a, b, t)
	return a + (b - a) * t
end

Utils.randomColor = function()
	local randomColor = {
		"#e55858",
		"#96b1e7",
		"#f3ba79",
		"#c971a1"
	}

	return Utils.hrgba(randomColor[math.random(1, #randomColor)])
end

return Utils
