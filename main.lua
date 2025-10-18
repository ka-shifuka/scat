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

	SoundEffect.music.fat_cat:setLooping(true)
	SoundEffect.music.fat_cat:play()

	Ui:init()
end

love.update = function(dt)
	Timer.update(dt)
	Entity.update(dt)

	Gamestate:update(dt)
	Ui:update(dt)
end

love.draw = function()
	Ui:drawBackground()
	Entity.draw()
	Ui:draw()
end

love.mousepressed = function(x, y, button)
	if button == 1 then
		local e = Ui.touchEffect:new(x, y)
		Entity.add(EntityId.TOUCH_EFFECT, e)

		Entity.pressed(x, y)

		Ui:pressed(x, y)
	end
end

love.mousereleased = function(x, y, button)
	if button == 1 then
		Ui:released(x, y)
	end
end
