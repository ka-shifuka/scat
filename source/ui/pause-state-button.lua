local box = require "source.ui.elements.box"

local pauseStateButton = {}

pauseStateButton.background = {
	x = 0,
	y = 0,
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight()
}
pauseStateButton.background.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.setColor(Utils.hrgba("#02020288"))
	love.graphics.rectangle("fill", 0, 0, self.width, self.height)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

pauseStateButton.Title = box:new({
	x = love.graphics.getWidth() / 2 - 50,
	y = 50,
	width = 100,
	height = 50,
	font = Font.protoBoldMd,
	text = "Paused"
})

pauseStateButton.draw = function(self)
	self.background:draw()

	self.Title:draw()
end

return pauseStateButton
