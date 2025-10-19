---@class Ui.Element.ButtonParam
---@field x number
---@field y number
---@field width number width of the button
---@field height number Height of the button
---@field text string The text to display
---@field font love.graphics.Font Font style
---@field border boolean
---@field borderRadius number
---@field backgroundColor table array of rgba
---@field color table array of rgba

---@class UI.Element.Button : Ui.Element.Button_Instance
local button = {}
button.__index = button

---@param fun fun()
button.onPress = function(self, fun)
	self._on_press_handler = fun
	return self
end
---@param fun fun()
button.onRelease = function(self, fun)
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

button.draw = function(self, opacity)
	opacity = opacity or 1
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.setColor(1, 1, 1, opacity)

	if self.border then
		love.graphics.rectangle("line", 0, 0, self.width, self.height, self.borderRadius, self.borderRadius)
	end

	if self.backgroundColor then
		local c = self.backgroundColor
		love.graphics.setColor(c[1], c[2], c[3], opacity)
		love.graphics.rectangle("fill", 0, 0, self.width, self.height)
		love.graphics.setColor(1, 1, 1, 1)
	end

	if self.color then
		local c = self.color
		love.graphics.setColor(c[1], c[2], c[3], opacity)
	end

	love.graphics.setFont(self.font)
	love.graphics.printf(self.text, 0, self.height / 2 - self.font:getHeight() / 2, self.width, "center")

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

---@param param Ui.Element.ButtonParam
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
	instance.borderRadius = param.borderRadius or 0
	instance.backgroundColor = param.backgroundColor or nil
	instance.color = param.color or nil

	--- event handler
	instance._on_press_handler = NOOP
	instance._on_release_handler = NOOP

	setmetatable(instance, self)
	return instance ---@type UI.Element.Button
end

return button
