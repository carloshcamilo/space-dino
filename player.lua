Player = {}

function Player:load()
  self.width = 50
  self.height = 50
  self.x = 100
  self.y = love.graphics.getHeight() - self.height
  self.speed = 800
  self.maxJumpHeight = (love.graphics.getHeight() / 4) * 3
end

function Player:update(dt)
  self:jump(dt)
  self:checkGravity(dt)
  self:checkBoundries()
end

function Player:jump(dt)
  if love.keyboard.isDown("space") and self.y == love.graphics.getHeight() - self.height then
    self.isJumping = true
  end
  if self.isJumping == true then
    self.y = self.y - self.speed * dt
  end
  if self.y + self.height < self.maxJumpHeight then
    self.isJumping = false
  end
end

function Player:checkGravity(dt)
  if self.isJumping == false then
    self.y = self.y + self.speed * dt
  end
end

function Player:checkBoundries()
  if self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
  end
end

function Player:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
