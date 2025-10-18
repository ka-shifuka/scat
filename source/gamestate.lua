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

Gamestate.update = function(self, dt)
	self:decreaseHealth(0.1)
end

return Gamestate
