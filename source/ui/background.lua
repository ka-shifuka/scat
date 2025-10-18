local background = {}
background.grid = {}

background.canvas = love.graphics.newCanvas()

background.update = function(self, dt)
	for _, value in ipairs(self.grid) do
		value.x = value.x + 25 * dt
		value.y = value.y + 25 * dt

		if value.x > value.initX + value.size then
			value.x = value.initX
		end
		if value.y > value.initY + value.size then
			value.y = value.initY
		end
	end
end

background.init = function(self, size)
	local column = math.floor(love.graphics.getWidth() / size) + 5
	local rows = math.floor(love.graphics.getHeight() / size) + 5

	local ox = -size * 2
	local oy = -size * 2

	---@diagnostic disable-next-line :unused-local
	for i = 1, rows, 1 do
		---@diagnostic disable-next-line :unused-local
		for j = 1, column, 1 do
			local t = {
				x = ox,
				y = oy,
				initX = ox,
				initY = oy,
				size = size
			}
			table.insert(self.grid, t)

			ox = ox + size
		end
		oy = oy + size
		ox = -size * 2
	end
end

background.initCanvasBuffer = function(self)
	love.graphics.setCanvas(self.canvas)
	love.graphics.clear()
	for _, value in ipairs(self.grid) do
		love.graphics.rectangle("line", value.x, value.y, value.size, value.size)
	end

	love.graphics.setCanvas()
end

background.drawCanvas = function(self)
	love.graphics.setShader(Shaders.background)
	love.graphics.draw(self.canvas)
	love.graphics.setShader()
end

return background
