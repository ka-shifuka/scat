---@diagnostic disable-next-line :duplicate-doc-alias
---@enum AnimDuration
local AnimDuration = {
	TOUCH_EFFECT = 0.4,
	UI_TRANSITION = 0.5,
}

---@diagnostic disable-next-line :duplicate-doc-alias
---@enum AnimDuration
return require("source.enum").new("AnimDuration", AnimDuration, {
	isSkipValue = true
})
