local touchEffect = require "source.ui.touch-effect"
local background = require "source.ui.background"
local gradientBackground = require "source.ui.gradient-background"
local scat = require "source.ui.scat"
local score = require "source.ui.score"
local health = require "source.ui.health"
local gameplayStateButton = require "source.ui.gameplay-state-button"
local pauseStateButton = require "source.ui.pause-state-button"

---@class Ui
local Ui = {}
Ui.touchEffect = touchEffect
Ui.background = background
Ui.gradientBackground = gradientBackground
Ui.scat = scat
Ui.score = score
Ui.health = health
Ui.gameplayStateButton = gameplayStateButton
Ui.pauseStateButton = pauseStateButton
Ui.state = UiState.GAME_PLAY

Ui.init = function(self)
	self.background:init(100)
end

Ui.pressed = function(self, x, y)
	if self.state == UiState.GAME_PLAY then
		self.scat:pressed(x, y)
		self.gameplayStateButton:pressed(x, y)
	end
end
Ui.released = function(self, x, y)
	if self.state == UiState.GAME_PLAY then
		self.gameplayStateButton:released(x, y)
	end
end

Ui.update = function(self, dt)
	self.scat:update(dt)
	self.background:update(dt)
end

Ui.drawBackground = function(self)
	self.gradientBackground:initCanvasBuffer()
	self.background:initCanvasBuffer()

	self.gradientBackground:drawCanvas()
	self.background:drawCanvas()
end

Ui.draw = function(self)
	if self.state == UiState.GAME_PLAY then
		self.scat:draw()
		self.health:draw()
		self.score:drawHeader()

		self.gameplayStateButton:draw()
	end

	if self.state == UiState.PAUSE then
		self.pauseStateButton:draw()
	end
end

return Ui
