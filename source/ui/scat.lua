---@class Ui.Scat
local scat = {}
scat.x = love.graphics.getWidth() / 2
scat.y = love.graphics.getHeight() - 64 * 4
scat.offsetX = 0
scat.offsetY = 0
scat.angel = 0
scat.tween = nil

scat.sprite = love.graphics.newImage("assets/scat/cat orange.png")
scat.grid = Anim8.newGrid(64, 128, scat.sprite:getWidth(), scat.sprite:getHeight())
scat.anim = Anim8.newAnimation(scat.grid("1-8", 1), 0.08, "pauseAtEnd")

scat.init = function(self)
	Timer.every(2, function()
		if Ui.state == UiState.GAME_PLAY then return end

		local xd = math.random(0, love.graphics.getWidth()) - self.x
		local yd = math.random(0, love.graphics.getHeight()) - self.y
		local angel = math.rad(math.random(-20, 20))

		self.tween = Tween.new(AnimDuration.TOUCH_EFFECT, self, { offsetY = yd / 3, offsetX = xd / 3, angel = angel },
			"inOutBack")

		if math.random(1, 3) == 2 then
			self.anim:gotoFrame(1)
			self.anim:resume()
		end
	end)
end

scat.update = function(self, dt)
	self.anim:update(dt)


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

	if math.random(1, 3) == 2 then
		self.anim:gotoFrame(1)
		self.anim:resume()
	end
end

scat.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x + self.offsetX, self.y + self.offsetY)

	love.graphics.scale(4)
	love.graphics.rotate(self.angel)
	self.anim:draw(self.sprite, -32, 0)

	love.graphics.pop()
end

return scat
