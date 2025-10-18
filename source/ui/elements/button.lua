---@class Ui.Element.ButtonParam
---@field x number
---@field y number
---@field width number width of the button
---@field height number Height of the button
---@field text string The text to display
---@field font love.font Font style
---@field border boolean

---@class UI.Element.Button : Ui.Element.Button_Instance
local button = {}
button.__index = button

---@param fun fun()
button.onPress = function(self, fun)
	self._on_press_handler = fun

	return self
end
---@param fun fun()
button.onRelese = function(self, fun)
	self._on_release_handler = fun

	return self
end

button.pressed = function(self, x, y)
	if Utils.abb(x, y, self) then
		self._on_press_handler()
	end
end
button.release = function(self, x, y)
	if Utils.abb(x, y, self) then
		self._on_release_handler()
	end
end

button.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	if self.border then
		love.graphics.rectangle("line", 0, 0, self.width, self.height)
	end

	love.graphics.setFont(self.font)
	love.graphics.printf(self.text, 0, self.height / 2 - self.font:getHeight() / 2, self.width, "center")

	love.graphics.pop()
end

---@param param Ui.Element.Button_Instance
---@return UI.Element.Button
button.new = function(self, param)
	---@class Ui.Element.Button_Instance
	local instance = {}
	instance.x = param.x or 50
	instance.y = param.y or 50
	instance.width = param.width or 50
	instance.height = param.height or 50
	instance.text = param.text or ""
	instance.font = param.font or love.graphics.newFont(24)
	instance.border = param.border or false

	instance._on_press_handler = nil
	instance._on_release_handler = nil

	setmetatable(instance, self)
	return instance ---@type UI.Element.Button
end

return button
