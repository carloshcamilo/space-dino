Score = {}

function Score:load()
  self.x = 75
  self.y = 75
  self.count = 0
end

function Score:draw()
  love.graphics.print(self.count, self.x, self.y)
end
