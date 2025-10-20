---@class Ui.Health
local health = {}
health.x = love.graphics.getWidth() / 2 - 160
health.y = love.graphics.getHeight() - 50
health.width = 320
health.height = 30

health.draw = function(self, opacity)
	opacity = opacity or 1
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.rectangle("fill", 0, 0, self.width, self.height, 5, 5)

	local c = Utils.hrgba("#e55858")

	love.graphics.setColor(c[1], c[2], c[3], opacity)
	local widthBar = Utils.lerp(0, self.width - 10, Gamestate.health / Gamestate.maxHealth)

	if widthBar > 1 then
		love.graphics.rectangle("fill", 5, 5, widthBar, self.height - 10, 2, 2)
	end

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

return health
