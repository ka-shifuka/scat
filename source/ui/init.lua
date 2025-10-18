local touchEffect = require "source.ui.touch-effect"
local background = require "source.ui.background"
local gradientBackground = require "source.ui.gradient-background"
local scat = require "source.ui.scat"

---@class Ui
local Ui = {}
Ui.touchEffect = touchEffect
Ui.background = background
Ui.gradientBackground = gradientBackground
Ui.scat = scat

return Ui
