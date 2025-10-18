function Startup()
	--- make sure is perfect for pixel game
	love.graphics.setDefaultFilter("nearest", "nearest")

	SoundEffect = require "source.startup.load-sound"

	require "source.startup.require"
end
