local button = require "source.ui.elements.button"

local gameplayStateButton = {}
gameplayStateButton.isView = false
gameplayStateButton.offsetY = 300
gameplayStateButton.opacity = 0

gameplayStateButton.tween = Tween.new(AnimDuration.UI_TRANSITION, gameplayStateButton, { offsetY = 0, opacity = 1 },
	"inOutBack")

gameplayStateButton.pause = button:new({
	x = love.graphics.getWidth() - 60,
	y = 45,
	width = 40,
	height = 40,
	font = Font.protoBoldLg,
	text = "󰏤",
}):onPress(function()
	Ui.state = UiState.PAUSE
	Gamestate.state = State.PAUSE
end)

gameplayStateButton.pressed = function(self, x, y)
	self.pause:pressed(x, y)
end
gameplayStateButton.released = function(self, x, y)
	self.pause:release(x, y)
end

gameplayStateButton.update = function(self, dt)
	if self.isView then
		self.tween:update(dt)
	else
		self.tween:update(-dt)
	end
end

gameplayStateButton.draw = function(self)
	love.graphics.push()
	love.graphics.translate(0, self.offsetY)

	self.pause:draw(self.opacity)
	Ui.health:draw(self.opacity)
	Ui.score:drawHeader(self.opacity)

	love.graphics.pop()
end

return gameplayStateButton
