math.randomseed(os.clock() * 10 ^ 6)

IS_RELEASE_VERSION = false

love.load = function()
	require "source.startup"
	Startup()

	SoundEffect.music.fat_cat:setLooping(true)
	SoundEffect.music.fat_cat:play()

	Gamestate:init()
	Ui:init()
end

love.update = function(dt)
	Timer.update(dt)

	if Gamestate.state == State.GAME_PLAY then
		Entity.update(dt)
		Gamestate:update(dt)
	end

	Ui:update(dt)
end

love.draw = function()
	Ui:drawBackground()

	if Gamestate.state == State.GAME_PLAY then
		Entity.draw()
	end

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
