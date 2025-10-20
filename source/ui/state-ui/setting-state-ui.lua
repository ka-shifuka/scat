local slider = require "source.ui.elements.slider"
local box = require "source.ui.elements.box"
local button = require "source.ui.elements.button"

local settingStateUi = {}
settingStateUi.isView = false

settingStateUi.offsetY = 300
settingStateUi.opacity = 0

settingStateUi.tween = Tween.new(AnimDuration.UI_TRANSITION, settingStateUi, { offsetY = 0 }, "inOutBack")
settingStateUi.tweenOpacity = Tween.new(AnimDuration.UI_TRANSITION, settingStateUi, { opacity = 1 }, "outQuart")

settingStateUi.background = {
	x = 0,
	y = -1000,
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight() * 10
}
settingStateUi.background.draw = function(self, opacity)
	opacity = opacity or 1
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	local c = Utils.hrgba("#02020233")

	love.graphics.setColor(c[1], c[2], c[3], opacity - 0.8)
	love.graphics.rectangle("fill", 0, 0, self.width, self.height)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

settingStateUi.musicVolumeLabel = box:new({
	x = love.graphics.getWidth() / 2 - 150,
	y = love.graphics.getHeight() / 2 - 100,
	width = 300,
	height = 20,
	text = "music volume:",
	font = Font.protoBoldXs,
	align = "left"
})

settingStateUi.musicVolume = slider:new({
	x = settingStateUi.musicVolumeLabel.x,
	y = settingStateUi.musicVolumeLabel.y + settingStateUi.musicVolumeLabel.height + 10,
	width = 300,
	height = 25
}):onMove(function()
	SoundEffect.music.main:setVolume(settingStateUi.musicVolume.value)
end)

settingStateUi.soundEffectVolumeLabel = box:new({
	x = settingStateUi.musicVolume.x,
	y = settingStateUi.musicVolume.y + settingStateUi.musicVolume.height + 30,
	width = 300,
	height = 20,
	text = "sound effect volume:",
	font = Font.protoBoldXs,
	align = "left"
})

settingStateUi.soundEffectVolume = slider:new({
	x = settingStateUi.soundEffectVolumeLabel.x,
	y = settingStateUi.soundEffectVolumeLabel.y + settingStateUi.soundEffectVolumeLabel.height + 10,
	width = 300,
	height = 25
}):onMove(function()
	local volume = settingStateUi.soundEffectVolume.value

	SoundEffect.cat_1:setVolume(volume)
	SoundEffect.cat_2:setVolume(volume)
	SoundEffect.cat_3:setVolume(volume)
	SoundEffect.cat_pur:setVolume(volume)
end)


settingStateUi.resume = button:new({
	x = love.graphics.getWidth() / 2 - 100,
	y = settingStateUi.soundEffectVolume.y + settingStateUi.soundEffectVolume.height + 30,
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

settingStateUi.titleLabel = box:new({
	x = love.graphics.getWidth() / 2 - 100,
	y = 50,
	width = 200,
	height = 50,
	text = "setting",
	font = Font.protoBoldMd
})

settingStateUi.moved = function(self, x, y, dx, dy)
	self.musicVolume:moved(x, y, dx, dy)
	self.soundEffectVolume:moved(x, y, dx, dy)
end
settingStateUi.pressed = function(self, x, y)
	self.musicVolume:pressed(x, y)
	self.soundEffectVolume:pressed(x, y)

	self.resume:pressed(x, y)
end
settingStateUi.released = function(self, x, y)
	self.musicVolume:release(x, y)
	self.soundEffectVolume:release(x, y)
end

settingStateUi.update = function(self, dt)
	if self.isView then
		self.tween:update(dt)
		self.tweenOpacity:update(dt)
	else
		self.tween:update(-dt)
		self.tweenOpacity:update(-dt)
	end
end

settingStateUi.draw = function(self)
	love.graphics.push()
	love.graphics.translate(0, self.offsetY)

	self.background:draw(self.opacity)

	self.musicVolume:draw(self.opacity)
	self.musicVolumeLabel:draw(self.opacity)
	self.soundEffectVolume:draw(self.opacity)
	self.soundEffectVolumeLabel:draw(self.opacity)
	self.resume:draw(self.opacity)
	self.titleLabel:draw(self.opacity)

	love.graphics.pop()
end

return settingStateUi
