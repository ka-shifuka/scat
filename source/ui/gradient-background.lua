local gradientBackground = {}
gradientBackground.color1 = Utils.hrgba("#fa8970")
gradientBackground.color2 = Utils.hrgba("#ef92b4")

gradientBackground.canvas = love.graphics.newCanvas()

gradientBackground.initCanvasBuffer = function(self)
	love.graphics.setCanvas(self.canvas)

	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

	love.graphics.setCanvas()
end

gradientBackground.drawCanvas = function(self)
	Shaders.gradientBackground:send("color1", self.color1)
	Shaders.gradientBackground:send("color2", self.color2)

	love.graphics.setShader(Shaders.gradientBackground)
	love.graphics.draw(self.canvas)
	love.graphics.setShader()
end

return gradientBackground
