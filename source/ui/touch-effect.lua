---@class Ui.TouchEffect : Ui.TouchEffect_instance
local touchEffect = {}
touchEffect.__index = touchEffect


touchEffect.sprite = love.graphics.newImage("assets/touch-sprite/U.png")

touchEffect.update = function(self, dt)
	if self.tween then
		local isFinished = self.tween:update(dt)

		if isFinished then
			self.tween = nil

			local q = math.random(1, 3)

			if q == 1 then
				SoundEffect.cat_2:clone():play()
			elseif q == 2 then
				SoundEffect.cat_pur:play()
			end

			local rx = math.random(-100, 100)
			local ry = math.random(-100, 100)
			local ra = math.rad(math.random(-45, 45))

			self.endtween = Tween.new(AnimDuration.TOUCH_EFFECT, self,
				{
					offsetX = rx,
					offsetY = ry,
					opacity = 0,
					angle = ra,
				}, "inOutBack")
		end
	end

	if self.endtween then
		local isFinished = self.endtween:update(dt)

		if isFinished then
			self.endtween = nil

			Entity.remove(EntityId.TOUCH_EFFECT, self.index)
		end
	end
end

touchEffect.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x + self.offsetX, self.y + self.offsetY)

	love.graphics.setColor(1, 1, 1, self.opacity)

	love.graphics.scale(2.5)
	love.graphics.rotate(self.angle)
	love.graphics.draw(self.sprite, -16, -16)


	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

touchEffect.new = function(self, x, y)
	---@class Ui.TouchEffect_instance
	local instance = {}
	instance.x = x
	instance.y = y

	instance.offsetX = math.random(-100, 100)
	instance.offsetY = math.random(50, 100)
	instance.opacity = 0
	instance.angle = math.rad(math.random(-45, 45))

	instance.index = 0

	instance.tween = Tween.new(AnimDuration.TOUCH_EFFECT, instance,
		{
			offsetX = 0,
			offsetY = 0,
			opacity = 1,
			angle = math.rad(math.random(-45, 45))
		}, "inOutBack")

	instance.endtween = nil

	setmetatable(instance, self)
	return instance ---@type Ui.TouchEffect
end

return touchEffect
