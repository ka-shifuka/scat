local Entity = {}

--- Ui Entity
---@type Ui.TouchEffect[]
local touchEffect_e = {}
---@type Ui.Score[]
local score_e = {}



---@type Ball[]
local ball_e = {}

Entity.add = function(id, e)
	if id == EntityId.TOUCH_EFFECT then
		table.insert(touchEffect_e, e)
		return
	end

	if id == EntityId.BALL then
		table.insert(ball_e, e)
		return
	end

	if id == EntityId.SCORE_NUM then
		table.insert(score_e, e)
		return
	end
end

Entity.remove = function(id, index)
	if id == EntityId.TOUCH_EFFECT then
		table.remove(touchEffect_e, index)
	end

	if id == EntityId.BALL then
		table.remove(ball_e, index)
	end

	if id == EntityId.SCORE_NUM then
		table.remove(score_e, index)
		return
	end
end

Entity.pressed = function(x, y)
	for _, value in ipairs(ball_e) do
		value:pressed(x, y)
	end
end

Entity.update = function(dt)
	for index, value in ipairs(touchEffect_e) do
		value.index = index
		value:update(dt)
	end

	for index, value in ipairs(ball_e) do
		value.index = index
		value:update(dt)
	end

	for index, value in ipairs(score_e) do
		value.index = index
		value:update(dt)
	end
end

local function draw_e(entity)
	for _, value in ipairs(entity) do
		value:draw()
	end
end

Entity.draw = function()
	draw_e(ball_e)
	draw_e(touchEffect_e)
	draw_e(score_e)
end

return Entity
