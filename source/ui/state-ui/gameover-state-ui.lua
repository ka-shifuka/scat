local button = require "source.ui.elements.button"
local box = require "source.ui.elements.box"

local gameoverStateUi = {}
gameoverStateUi.isView = false
gameoverStateUi.opacity = 0

gameoverStateUi.tween = Tween.new(AnimDuration.UI_TRANSITION, gameoverStateUi, { opacity = 1 }, "outQuart")

gameoverStateUi.background = {
	x = 0,
	y = 0,
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight()
}
gameoverStateUi.background.draw = function(self, opacity)
	opacity = opacity or 1
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	local c = Utils.hrgba("#201d24")

	love.graphics.setColor(c[1], c[2], c[3], opacity)
	love.graphics.rectangle("fill", 0, 0, self.width, self.height)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

gameoverStateUi.titleLabel = box:new({
	x = love.graphics.getWidth() / 2 - 100,
	y = love.graphics.getHeight() / 2 - 100,
	width = 200,
	height = 50,
	text = "Game Over",
	font = Font.protoBoldLg
})

gameoverStateUi.resetButton = button:new({
	x = love.graphics.getWidth() / 2 - 100,
	y = love.graphics.getHeight() / 2,
	width = 200,
	height = 50,
	text = "restart",

	border = true,
	borderRadius = 5,
	font = Font.protoBoldSm
}):onPress(function()
	Gamestate.state = State.GAME_PLAY
	Ui.state = UiState.GAME_PLAY

	Gamestate.score = 0
	Gamestate.health = Gamestate.maxHealth
end)

gameoverStateUi.pressed = function(self, x, y)
	self.resetButton:pressed(x, y)
end

gameoverStateUi.update = function(self, dt)
	if self.isView then
		self.tween:update(dt)
	else
		self.tween:update(-dt)
	end
end

gameoverStateUi.draw = function(self)
	love.graphics.push()
	self.background:draw(self.opacity)
	self.titleLabel:draw(self.opacity)
	self.resetButton:draw(self.opacity)

	love.graphics.push()
	love.graphics.setColor(1, 1, 1, self.opacity)
	local textS = "score"

	love.graphics.setFont(Font.protoBoldSm)
	love.graphics.print(textS, love.graphics.getWidth() / 2 - Font.protoBoldSm:getWidth(textS) / 2, 100)

	local Score = tostring(Gamestate.score)
	love.graphics.print(Score, love.graphics.getWidth() / 2 - Font.protoBoldSm:getWidth(Score) / 2, 130)


	local text = "best score"

	love.graphics.setFont(Font.protoBoldSm)
	love.graphics.print(text, love.graphics.getWidth() / 2 - Font.protoBoldSm:getWidth(text) / 2,
		self.resetButton.y + self.resetButton.height + 90)

	local bestScore = tostring(Gamestate.bestScore)
	love.graphics.print(bestScore, love.graphics.getWidth() / 2 - Font.protoBoldSm:getWidth(bestScore) / 2,
		self.resetButton.y + self.resetButton.height + 120)

	local name = "made by Puja and Hamdan (music composer)"

	love.graphics.setFont(Font.protoBoldXs)
	love.graphics.print(name, love.graphics.getWidth() / 2 - Font.protoBoldXs:getWidth(name) / 2,
		love.graphics.getHeight() - 50)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
	love.graphics.pop()
end

return gameoverStateUi
