local SoundEffect = {}

SoundEffect.cat_1 = love.audio.newSource("assets/sound/cat-meow-mp3.mp3", "static")
SoundEffect.cat_2 = love.audio.newSource("assets/sound/meow-1.mp3", "static")
SoundEffect.cat_3 = love.audio.newSource("assets/sound/the-end-meow-by-nekocat-just-3-second-1.mp3", "static")

SoundEffect.cat_pur = love.audio.newSource("assets/sound/cat-purring-261128.mp3", "static")

--- Music
SoundEffect.music = {}
-- SoundEffect.music.main = love.audio.newSource("assets/sound/music/fat-cat-374614.mp3", "stream")
SoundEffect.music.main = love.audio.newSource("assets/sound/music/scat_main_theme.mp3", "stream")

return SoundEffect
