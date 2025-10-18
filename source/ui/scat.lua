local scat = {}
scat.x = love.graphics.getWidth() / 2
scat.y = love.graphics.getHeight() - 64 * 4
scat.offsetX = 0
scat.offsetY = 0
scat.angel = 0
scat.tween = nil

scat.sprite = love.graphics.newImage("assets/scat/cat-2.png")

scat.update = function(self, dt)
	if self.tween then
		local finished = self.tween:update(dt)

		if finished then
			self.tween = nil
		end
	end
end

scat.pressed = function(self, x, y)
	local xd = x - self.x
	local yd = y - self.y

	local angel = math.rad(math.random(-20, 20))

	self.tween = Tween.new(AnimDuration.TOUCH_EFFECT, self, { offsetY = yd / 3, offsetX = xd / 3, angel = angel },
		"inOutBack")
end

scat.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x + self.offsetX, self.y + self.offsetY)

	love.graphics.scale(4)
	love.graphics.rotate(self.angel)
	love.graphics.draw(self.sprite, -32, 0)

	love.graphics.pop()
end

return scat
