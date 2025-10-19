local slider = require "source.ui.elements.slider"

local loadingStateUi = {}
loadingStateUi.icon = love.graphics.newImage("assets/icon-2.png")

loadingStateUi.opacity = 1
loadingStateUi.value = 0
loadingStateUi.tween = nil

loadingStateUi.set = function(self, duration)
	self.opacity = 1
	self.value = 0
	self.tween = Tween.new(duration, self, { opacity = 0, value = 1 }, "inQuart")

	Gamestate.isloading = true
end

loadingStateUi.background = {
	x = 0,
	y = 0,
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight()
}
loadingStateUi.background.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	local c = Utils.hrgba("#201d24")

	love.graphics.setColor(c[1], c[2], c[3], loadingStateUi.opacity)
	love.graphics.rectangle("fill", 0, 0, self.width, self.height)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

loadingStateUi.slider = slider:new({
	x = love.graphics.getWidth() / 2 - 160,
	y = love.graphics.getHeight() / 2 + 200,
	width = 320,
	height = 30
})

loadingStateUi.update = function(self, dt)
	if self.tween then
		local finished = self.tween:update(dt)
		self.slider.value = self.value

		if finished then
			self.tween = nil

			Gamestate.isloading = false
		end
	end
end

loadingStateUi.draw = function(self)
	self.background:draw()

	love.graphics.push()
	love.graphics.translate(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
	love.graphics.setColor(1, 1, 1, self.opacity)
	love.graphics.draw(self.icon, -128, -128)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()

	self.slider:draw(self.opacity)
end

return loadingStateUi
