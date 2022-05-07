require("player")
require("enemy")

function love.load()
  Player:load()
  Enemy:load()
end

function love.update(dt)
  Player:update(dt)
  Enemy:update(dt)
  love.graphics.printf("Score: " .. Player.score, 0, 30, 30, 'center')
  CheckLost()
end

function love.draw()
  Player:draw()
  Enemy:draw()
end

function CheckCollision(player, enemy)
  if player.x + player.width > enemy.x and player.y + player.height > enemy.y then
    return true
  else
    return false
  end
end

function CheckLost()
  if CheckCollision(Player, Enemy) then
    Player.score = 0
    Enemy.speed = 1000
    Enemy.x = love.graphics.getWidth()
  end
end
