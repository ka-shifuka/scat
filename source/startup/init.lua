function Startup()
	SoundEffect = require "source.startup.load-sound"
	Font = require "source.startup.load-font"
	
	--- make sure is perfect for pixel game
	love.graphics.setDefaultFilter("nearest", "nearest")

	require "source.startup.require"
end
