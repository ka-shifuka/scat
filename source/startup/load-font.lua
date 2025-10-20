local Font = {}

---@enum FontSize
local FontSize = {
	LARGE = 28,
	MEDIUM = 24,
	SMALL = 18,
	EXTRA_SMALL = 8
}

Font.protoBoldLg = love.graphics.newFont("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.LARGE)
Font.protoBoldMd = love.graphics.newFont("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.MEDIUM)
Font.protoBoldSm = love.graphics.newFont("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.SMALL)
Font.protoBoldXs = love.graphics.newFont("assets/fonts/0xProtoNerdFont-Bold.ttf", FontSize.EXTRA_SMALL)

return Font
