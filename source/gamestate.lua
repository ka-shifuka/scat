local Gamestate = {}

Gamestate.score = 0
Gamestate.health = 100
Gamestate.maxHealth = 100

Gamestate.state = State.GAME_PLAY

Gamestate.addScore = function(self, score)
	self.score = self.score + score
end

Gamestate.decreaseHealth = function(self, num)
	self.health = self.health - num
	if self.health <= 0 then
		self.health = 0
	end
end
Gamestate.increaseHealth = function(self, num)
	self.health = self.health + num
	if self.health >= self.maxHealth then
		self.health = self.maxHealth
	end
end

Gamestate.init = function(self)
	--- create ball every 1 second
	Timer.every(1, function()
		local x = math.random(150, love.graphics.getWidth() - 150)
		local y = math.random(250, love.graphics.getHeight() - 250)

		local b = Ball:new(x, y)
		Entity.add(EntityId.BALL, b)
	end)
end

Gamestate.update = function(self, dt)
	self:decreaseHealth(0.1)
end

return Gamestate
