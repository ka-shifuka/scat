math.randomseed(os.clock() * 10 ^ 6)

IS_RELEASE_VERSION = false

love.load = function()
	require "source.startup"
	Startup()

	SoundEffect.music.main:setLooping(true)
	SoundEffect.music.main:play()

	Gamestate:init()
	Ui:init()

	q = 1
end

love.update = function(dt)
	Timer.update(dt)
	q = q + 0.00001
	if q >= 1.8 then q = 3 end

	dt = dt * q

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


--- touch / mouse API
love.mousepressed = function(x, y, button)
	if button == 1 then
		if Gamestate.state == State.GAME_PLAY and not Gamestate.isloading then
			local e = Ui.touchEffect:new(x, y)
			Entity.add(EntityId.TOUCH_EFFECT, e)

			Entity.pressed(x, y)
		end

		if not Gamestate.isloading then
			Ui:pressed(x, y)
		end
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
