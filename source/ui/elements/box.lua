---@class Ui.Element.BoxParam
---@field x number
---@field y number
---@field width number width of the button
---@field height number Height of the button
---@field text string The text to display
---@field font love.graphics.Font Font style
---@field border boolean

---@class UI.Element.Box : Ui.Element.Box_Instance
local box = {}
box.__index = box

box.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	if self.border then
		love.graphics.rectangle("line", 0, 0, self.width, self.height)
	end

	love.graphics.setFont(self.font)
	love.graphics.printf(self.text, 0, self.height / 2 - self.font:getHeight() / 2, self.width, "center")

	love.graphics.pop()
end

---@param param Ui.Element.BoxParam
---@return UI.Element.Box
box.new = function(self, param)
	---@class Ui.Element.Box_Instance
	local instance = {}
	instance.x = param.x or 50
	instance.y = param.y or 50
	instance.width = param.width or 50
	instance.height = param.height or 50
	instance.text = param.text or ""
	instance.font = param.font or love.graphics.newFont(24)
	instance.border = param.border or false

	setmetatable(instance, self)
	return instance ---@type UI.Element.Box
end

return box
