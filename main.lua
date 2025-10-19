math.randomseed(os.clock() * 10 ^ 6)

IS_RELEASE_VERSION = false

love.load = function()
	require "source.startup"
	Startup()

	SoundEffect.music.main:setLooping(true)
	SoundEffect.music.main:play()

	Gamestate:init()
	Ui:init()
end

love.update = function(dt)
	Timer.update(dt)

	if Gamestate.state == State.GAME_PLAY then
		Gamestate:update(dt)
	end

	Entity.update(dt)
	Ui:update(dt)
end

love.draw = function()
	Ui:drawBackground()

	Entity.draw()

	Ui:draw()
end

love.mousepressed = function(x, y, button)
	if button == 1 then
		if Gamestate.state == State.GAME_PLAY then
			local e = Ui.touchEffect:new(x, y)
			Entity.add(EntityId.TOUCH_EFFECT, e)

			Entity.pressed(x, y)
		end

		Ui:pressed(x, y)
	end
end

love.mousereleased = function(x, y, button)
	if button == 1 then
		Ui:released(x, y)
	end
end

love.mousemoved = function(x, y, dx, dy, istouch)
	Ui:moved(x, y, dx, dy)
end
