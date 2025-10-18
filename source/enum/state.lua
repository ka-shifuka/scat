---@diagnostic disable-next-line :duplicate-doc-alias
---@enum State 
local State = {
	GAME_PLAY = "GAME_PLAY",
	PAUSE = "PAUSE",
}

---@diagnostic disable-next-line :duplicate-doc-alias
---@enum State
return require("source.enum").new("State", State)
