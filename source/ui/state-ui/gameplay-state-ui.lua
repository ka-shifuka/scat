local button = require "source.ui.elements.button"

local gameplayStateButton = {}
gameplayStateButton.isView = false

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

gameplayStateButton.draw = function(self)
	if not self.isView then return end
	self.pause:draw()
end

return gameplayStateButton
