math.randomseed(os.clock() * 10 ^ 6)

IS_RELEASE_VERSION = false

love.load = function()
	require "source.startup"
	Startup()

	Timer.every(2, function()
		local x = math.random(150, love.graphics.getWidth() - 150)
		local y = math.random(400, love.graphics.getHeight() - 400)

		local b = Ball:new(x, y)
		Entity.add(EntityId.BALL, b)
	end)
end

love.update = function(dt)
	Timer.update(dt)
	Entity.update(dt)
end

love.draw = function()
	Entity.draw()
end

love.mousepressed = function(x, y, button)
	if button == 1 then
		local e = Ui.touchEffect:new(x, y)
		Entity.add(EntityId.TOUCH_EFFECT, e)

		Entity.pressed(x, y)
	end
end
