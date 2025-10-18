---@class Ui.Health
local health = {}
health.x = love.graphics.getWidth() / 2 - 160
health.y = love.graphics.getHeight() - 50
health.width = 320
health.height = 30


health.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.rectangle("fill", 0, 0, self.width, self.height, 2, 2)

	love.graphics.setColor(Utils.hrgba("#e55858"))
	local widthBar = Utils.lerp(0, self.width - 10, Gamestate.health / Gamestate.maxHealth)
	love.graphics.rectangle("fill", 5, 5, widthBar, self.height - 10)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

return health
