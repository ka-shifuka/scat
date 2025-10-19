local slider = require "source.ui.elements.slider"
local box = require "source.ui.elements.box"

local settingStateUi = {}

settingStateUi.background = {
	x = 0,
	y = 0,
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight()
}
settingStateUi.background.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.setColor(Utils.hrgba("#02020233"))
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
	SoundEffect.music.fat_cat:setVolume(settingStateUi.musicVolume.value)
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
	SoundEffect.music.fat_cat:setVolume(settingStateUi.musicVolume.value)
end)

settingStateUi.moved = function(self, x, y, dx, dy)
	self.musicVolume:moved(x, y, dx, dy)
end
settingStateUi.pressed = function(self, x, y)
	self.musicVolume:pressed(x, y)
end
settingStateUi.released = function(self, x, y)
	self.musicVolume:release(x, y)
end

settingStateUi.draw = function(self)
	self.background:draw()

	self.musicVolume:draw()
	self.musicVolumeLabel:draw()

	self.soundEffectVolume:draw()
	self.soundEffectVolumeLabel:draw()
end

return settingStateUi
