Enemy = {}

function Enemy:load()
  self.height = 32
  self.width = 32
  self.x = love.graphics.getWidth() - self.width
  self.y = love.graphics.getHeight() - self.height
  self.speed = 700
end

function Enemy:update(dt)
  Enemy:move(dt)
  Enemy:checkReturn()
end

function Enemy:move(dt)
  self.x = self.x - self.speed * dt
end

function Enemy:checkReturn()
  if self.x < 0 then
    self.x = love.graphics.getWidth()
    self.speed = self.speed + 50
    Player.score = Player.score + 1
  end
end

function Enemy:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
