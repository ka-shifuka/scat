local background = love.filesystem.read("source/shaders/background.glsl")
local gradientBackground = love.filesystem.read("source/shaders/gradient-background.glsl")

---@class Shaders
local Shaders = {}
Shaders.background = love.graphics.newShader(background)
Shaders.gradientBackground = love.graphics.newShader(gradientBackground)

return Shaders
