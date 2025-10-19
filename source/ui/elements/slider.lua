---@class Ui.Element.SliderParam
---@field x number
---@field y number
---@field width number
---@field height number
---@field value number 0 to 1

---@class Ui.Element.Slider : Ui.Element.Slider_Instance
local slider = {}
slider.__index = slider

---@param fun fun()
slider.onMove = function(self, fun)
	self._on_moved_handler = fun
	return self
end

slider.moved = function(self, x, y, dx, dy)
	if self.ispressed then
		self.value = self.value + dx / self.width

		if self.value >= 1 then self.value = 1 end
		if self.value <= 0 then self.value = 0 end

		self._on_moved_handler()
	end
end
slider.pressed = function(self, x, y)
	if Utils.abb(x, y, self) then
		self.ispressed = true
	else
		self.ispressed = false
	end
end
slider.release = function(self, x, y)
	self.ispressed = false
end

slider.draw = function(self)
	love.graphics.push()
	love.graphics.translate(self.x, self.y)

	love.graphics.rectangle("fill", 0, 0, self.width, self.height, 5, 5)

	love.graphics.setColor(Utils.hrgba("#e55858"))

	local wbuff = Utils.lerp(0, self.width - 10, self.value)
	if wbuff > 1 then
		love.graphics.rectangle("fill", 5, 5, Utils.lerp(0, self.width - 10, self.value), self.height - 10, 2, 2)
	end

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.pop()
end

---@param param Ui.Element.SliderParam
---@return Ui.Element.Slider
slider.new = function(self, param)
	---@class Ui.Element.Slider_Instance
	local instance = {}
	instance.x = param.x or 50
	instance.y = param.y or 50
	instance.width = param.width or 50
	instance.height = param.height or 50
	instance.value = param.value or 1

	instance.ispressed = false

	instance._on_moved_handler = NOOP

	setmetatable(instance, self)
	return instance ---@type Ui.Element.Slider
end

return slider
