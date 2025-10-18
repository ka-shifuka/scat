---@diagnostic disable-next-line :duplicate-doc-alias
---@enum EntityId
local EntityId = {
	TOUCH_EFFECT = "TOUCH_EFFECT",
	BALL = "BALL",
	SCORE_NUM = "SCORE_NUM"
}

---@diagnostic disable-next-line :duplicate-doc-alias
---@enum EntityId
return require("source.enum").new("EntityId", EntityId)
