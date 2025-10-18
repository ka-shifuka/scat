math.randomseed(os.clock() * 10 ^ 6)

IS_RELEASE_VERSION = false

love.load = function()
	require "source.startup"
	Startup()

	Timer.every(1, function()
		local x = math.random(150, love.graphics.getWidth() - 150)
		local y = math.random(250, love.graphics.getHeight() - 250)

		local b = Ball:new(x, y)
		Entity.add(EntityId.BALL, b)
	end)

	Ui.background:init(100)
end

love.update = function(dt)
	Timer.update(dt)
	Entity.update(dt)

	Ui.scat:update(dt)
end

love.draw = function()
	--- If something have a canvas buffer draw here
	Ui.background:initCanvasBuffer()
	Ui.gradientBackground:initCanvasBuffer()

	Ui.gradientBackground:drawCanvas()
	Ui.background:drawCanvas()

	Entity.draw()

	Ui.scat:draw()
end

love.mousepressed = function(x, y, button)
	if button == 1 then
		local e = Ui.touchEffect:new(x, y)
		Entity.add(EntityId.TOUCH_EFFECT, e)

		Entity.pressed(x, y)

		Ui.scat:pressed(x, y)
	end
end
