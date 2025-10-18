---@class Ui.Score : UI.Score_Instance
local score = {}
score.__index = score

score.drawHeader = function(self)
	love.graphics.push()

	love.graphics.setFont(Font.protoBoldLg)
	love.graphics.print("Score", love.graphics.getWidth() / 2 - Font.protoBoldLg:getWidth("Score") / 2, 50)

	local gameScore = tostring(Gamestate.score)
	love.graphics.print(gameScore, love.graphics.getWidth() / 2 - Font.protoBoldLg:getWidth(gameScore) / 2, 100)

	love.graphics.pop()
end

score.update = function(self, dt)
	if self.tween then
		local finihsed = self.tween:update(dt)

		if finihsed then
			self.tween = nil

			Entity.remove(EntityId.SCORE_NUM, self.index)
		end
	end
end

score.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.setColor(1, 1, 1, self.opacity)
	love.graphics.scale(self.scale)

	love.graphics.setFont(Font.protoBoldLg)
	love.graphics.print(self.num, -Font.protoBoldLg:getWidth(self.num) / 2, -Font.protoBoldLg:getHeight() / 2)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end


score.new = function(self, num)
	---@class UI.Score_Instance
	local instance = {}
	instance.num = tostring(num)
	instance.x = love.graphics.getWidth() / 2
	instance.y = 100 + Font.protoBoldLg:getHeight() / 2

	instance.index = 0

	instance.opacity = 1
	instance.scale = 1

	instance.tween = Tween.new(AnimDuration.TOUCH_EFFECT, instance, { opacity = 0, scale = 5 }, "outQuart")

	setmetatable(instance, self)
	return instance ---@type Ui.Score
end

return score
