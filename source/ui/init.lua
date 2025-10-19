local touchEffect = require "source.ui.touch-effect"
local background = require "source.ui.background"
local gradientBackground = require "source.ui.gradient-background"
local scat = require "source.ui.scat"
local score = require "source.ui.score"
local health = require "source.ui.health"


local gameplayStateUi = require "source.ui.state-ui.gameplay-state-ui"
local pauseStateUi = require "source.ui.state-ui.pause-state-ui"
local settingStateUi = require "source.ui.state-ui.setting-state-ui"

---@class Ui
local Ui = {}
Ui.touchEffect = touchEffect
Ui.background = background
Ui.gradientBackground = gradientBackground
Ui.scat = scat
Ui.score = score
Ui.health = health

Ui.gameplayStateUi = gameplayStateUi
Ui.pauseStateUi = pauseStateUi
Ui.settingStateUi = settingStateUi

Ui.state = UiState.GAME_PLAY

Ui.init = function(self)
	self.background:init(100)
	self.scat:init()
end

Ui.pressed = function(self, x, y)
	if self.state == UiState.GAME_PLAY then
		self.scat:pressed(x, y)
		self.gameplayStateUi:pressed(x, y)
	end

	if self.state == UiState.PAUSE then
		self.pauseStateUi:pressed(x, y)
	end

	if self.state == UiState.SETTING then
		self.settingStateUi:pressed(x, y)
	end
end
Ui.released = function(self, x, y)
	if self.state == UiState.GAME_PLAY then
		self.gameplayStateUi:released(x, y)
	end

	if self.state == UiState.SETTING then
		self.settingStateUi:released(x, y)
	end
end
Ui.moved = function(self, x, y, dx, dy)
	if self.state == UiState.SETTING then
		self.settingStateUi:moved(x, y, dx, dy)
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

		self.gameplayStateUi:draw()
	end

	if self.state == UiState.PAUSE then
		self.scat:draw()

		self.pauseStateUi:draw()
	end

	if self.state == UiState.SETTING then
		self.scat:draw()

		self.settingStateUi:draw()
	end
end

return Ui
