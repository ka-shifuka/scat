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
		if finished then self.tween = nil end
	end

	if self.blowTween then
		local finished = self.blowTween:update(dt)

		if finished then
			self.isblow = true

			Entity.remove(EntityId.BALL, self.index)
		end
	end

	if self.x + self.radius >= love.graphics.getWidth() then
		self.veloX = -math.abs(self.veloX)
	elseif self.x - self.radius < 0 then
		self.veloX = math.abs(self.veloX)
	end

	if self.y + self.radius >= love.graphics.getHeight() then
		self.veloY = -math.abs(self.veloY)
	elseif self.y - self.radius < 0 then
		self.veloY = math.abs(self.veloY)
	end
end

Ball.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.setColor(self.color[1], self.color[2], self.color[3], self.opacity)

	love.graphics.circle("fill", 0, 0, self.radius)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

Ball.pressed = function(self, x, y)
	if Utils.distance2D(self.x, x, self.y, y) < 50 then
		if self.pressedCount >= 3 then return end
		self.blowTween = Tween.new(0.5, self, { opacity = 0, radius = 200 }, "inOutBack")

		self.pressedCount = self.pressedCount + 1

		Gamestate:addScore(1)
		Gamestate:increaseHealth(5)

		local scoreBlow = Ui.score:new(Gamestate.score)
		Entity.add(EntityId.SCORE_NUM, scoreBlow)
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
	instance.veloX = math.random(-200, 200)
	instance.veloY = math.random(-200, 200)


	instance.opacity = 0
	instance.radius = 100
	instance.tween = Tween.new(0.5, instance, { opacity = 1, radius = 50 }, "inOutBack")

	instance.blowTween = nil
	instance.pressedCount = 0
	instance.isblow = false
	instance.options = options or {}
	instance.index = 0
	instance.color = Utils.randomColor()

	Timer.after(math.random(1, 5), function()
		if instance.isblow then return end
		if instance.blowTween then return end

		instance.blowTween = Tween.new(0.5, instance, { opacity = 0, radius = 0 }, "inOutBack")
	end)

	setmetatable(instance, self)
	return instance ---@type Ball
end


return Ball
