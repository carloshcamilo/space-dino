require("player")
require("enemy")
require("score")

function love.load()
  Player:load()
  Enemy:load()
end

function love.update(dt)
  Player:update(dt)
  Enemy:update(dt)
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
    Score.count = 0
  end
end
