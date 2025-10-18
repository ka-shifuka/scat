local button = require "source.ui.elements.button"

local gameplayStateButton = {}

gameplayStateButton.pause = button:new({
	x = love.graphics.getWidth() - 60,
	y = 45,
	width = 40,
	height = 40,
	font = Font.protoBoldLg,
	text = "󰏤",
}):onPress(function()
	Ui.state = UiState.PAUSE
end):onRelese(function()
	Ui.state = UiState.GAME_PLAY
end)

gameplayStateButton.pressed = function(self, x, y)
	self.pause:pressed(x, y)
end
gameplayStateButton.released = function(self, x, y)
	self.pause:release(x, y)
end

return gameplayStateButton
