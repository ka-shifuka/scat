local box = require "source.ui.elements.box"
local button = require "source.ui.elements.button"

local pauseStateUi = {}

pauseStateUi.background = {
	x = 0,
	y = 0,
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight()
}
pauseStateUi.background.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.setColor(Utils.hrgba("#02020233"))
	love.graphics.rectangle("fill", 0, 0, self.width, self.height)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

pauseStateUi.titleBox = box:new({
	x = love.graphics.getWidth() / 2 - 50,
	y = 50,
	width = 100,
	height = 50,
	font = Font.protoBoldMd,
	text = "Paused"
})

pauseStateUi.resumeButton = button:new({
	x = love.graphics.getWidth() / 2 - 100,
	y = love.graphics.getHeight() / 2,
	width = 200,
	height = 50,
	text = " Resume",
	font = Font.protoBoldSm,

	border = true,
	borderRadius = 5
}):onPress(function()
	Gamestate.state = State.GAME_PLAY
	Ui.state = UiState.GAME_PLAY
end)

pauseStateUi.gotoSetting = button:new({
	x = love.graphics.getWidth() / 2 - 100,
	y = pauseStateUi.resumeButton.y + pauseStateUi.resumeButton.height + 20,
	width = 200,
	height = 50,
	text = " Setting",
	font = Font.protoBoldSm,

	border = true,
	borderRadius = 5
}):onPress(function()
	Ui.state = UiState.SETTING
end)

pauseStateUi.pressed = function(self, x, y)
	self.resumeButton:pressed(x, y)
	self.gotoSetting:pressed(x, y)
end

pauseStateUi.draw = function(self)
	self.background:draw()

	self.titleBox:draw()
	self.resumeButton:draw()
	self.gotoSetting:draw()
end

return pauseStateUi
