---@diagnostic disable-next-line :duplicate-doc-alias
---@enum UiState
local UiState = {
	GAME_PLAY = "GAME_PLAY",
	PAUSE = "PAUSE",
	SETTING = "SETTING",
	LOADING =  "LOADING",
	GAME_OVER = "GAME_OVER"
}

---@diagnostic disable-next-line :duplicate-doc-alias
---@enum UiState
return require("source.enum").new("UiState", UiState)
