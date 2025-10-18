---@diagnostic disable-next-line :duplicate-doc-alias
---@enum Direction
local Direction = {
	LEFT = "LEFT",
	RIGHT = "RIGHT",
	UP = "UP",
	DOWN = "DOWN"
}

---@diagnostic disable-next-line :duplicate-doc-alias
---@enum Direction
return require("source.enum").new("Direction", Direction)
