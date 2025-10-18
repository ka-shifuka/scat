---@diagnostic disable-next-line :duplicate-doc-alias
---@enum UiState
local UiState = {
	GAME_PLAY = "GAME_PLAY",
	PAUSE = "PAUSE",
}

---@diagnostic disable-next-line :duplicate-doc-alias
---@enum UiState
return require("source.enum").new("UiState", UiState)
