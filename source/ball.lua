---@class Ball.Options
---@field isHaveFriction boolean

---@class Ball : Ball_instance
local Ball = {}
Ball.__index = Ball

Ball.update = function(self, dt)
	self.x = self.x + self.veloX * dt
	self.y = self.y + self.veloY * dt

	if self.tween then
		local finished = self.tween:update(dt)

		if finished then
			self.tween = nil
		end
	end

	if self.blowTween then
		local finished = self.blowTween:update(dt)

		if finished then
			Entity.remove(EntityId.BALL, self.index)
		end
	end
end

Ball.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.setColor(1, 1, 1, self.opacity)

	love.graphics.circle("fill", 0, 0, self.radius)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

Ball.pressed = function(self, x, y)
	if Utils.distance2D(self.x, x, self.y, y) < 50 then
		if self.pressedCount >= 3 then return end
		self.blowTween = Tween.new(0.5, self, { opacity = 0, radius = 200 }, "inOutBack")

		self.pressedCount = self.pressedCount + 1
	end
end


---@param x number The x position
---@param y number The y position
---@param options? Ball.Options
Ball.new = function(self, x, y, options)
	---@class Ball_instance
	local instance = {}
	instance.x = x
	instance.y = y
	instance.radius = 100

	instance.veloX = math.random(-200, 200)
	instance.veloY = math.random(-200, 200)

	instance.opacity = 0

	instance.tween = Tween.new(0.5, instance, { opacity = 1, radius = 50 }, "inOutBack")
	instance.blowTween = nil
	instance.pressedCount = 0

	instance.options = options or {}

	instance.index = 0

	setmetatable(instance, self)
	return instance ---@type Ball
end


return Ball
