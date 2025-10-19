---@diagnostic disable-next-line :duplicate-doc-alias
---@enum State 
local State = {
	GAME_PLAY = "GAME_PLAY",
	PAUSE = "PAUSE",
	LOADING = "LOADING",
	GAME_OVER = "GAME_OVER"
}

---@diagnostic disable-next-line :duplicate-doc-alias
---@enum State
return require("source.enum").new("State", State)
