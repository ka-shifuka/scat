local background = {}
background.grid = {}

background.canvas = love.graphics.newCanvas()

background.init = function(self, size)
	local column = math.floor(love.graphics.getWidth() / size) + 1
	local rows = math.floor(love.graphics.getHeight() / size) + 1

	local ox = 0
	local oy = 0

	---@diagnostic disable-next-line :unused-local
	for i = 1, rows, 1 do
		---@diagnostic disable-next-line :unused-local
		for j = 1, column, 1 do
			local t = {
				x = ox,
				y = oy,
				size = size
			}
			table.insert(self.grid, t)

			ox = ox + size
		end
		oy = oy + size
		ox = 0
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
