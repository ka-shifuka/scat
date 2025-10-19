local box = require "source.ui.elements.box"
local button = require "source.ui.elements.button"

local pauseStateUi = {}
pauseStateUi.isView = false
pauseStateUi.offsetY = 500
pauseStateUi.opacity = 0

pauseStateUi.tweenEnter = Tween.new(AnimDuration.UI_TRANSITION, pauseStateUi, { offsetY = 0, opacity = 1 }, "outQuart")

pauseStateUi.background = {
	x = 0,
	y = -1000,
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight() * 10
}
pauseStateUi.background.draw = function(self, opacity)
	opacity = opacity or 1
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	local c = Utils.hrgba("#02020233")

	love.graphics.setColor(c[1], c[2], c[3], opacity - 0.8)
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
	text = "paused"
})

pauseStateUi.resumeButton = button:new({
	x = love.graphics.getWidth() / 2 - 100,
	y = love.graphics.getHeight() / 2,
	width = 200,
	height = 50,
	text = " resume",
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
	text = " setting",
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

pauseStateUi.update = function(self, dt)
	if self.isView then
		self.tweenEnter:update(dt)
	else
		self.tweenEnter:update(-dt)
	end
end

pauseStateUi.draw = function(self)
	love.graphics.push()
	love.graphics.translate(0, self.offsetY)

	self.background:draw(self.opacity)

	self.titleBox:draw(self.opacity)
	self.resumeButton:draw(self.opacity)
	self.gotoSetting:draw(self.opacity)

	love.graphics.pop()
end

return pauseStateUi
