require("vector")
require("mover")
require("racket")

function love.load ()
    love.graphics.setNewFont("resources/Atari.ttf", 15)
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    location = Vector:create(width - 40, height/2 - 50)
    comp = Racket:create(location, true)

    location = Vector:create(20, height/2 - 50)
    player = Racket:create(location, false)

    location = Vector:create(width/2, height/2)
    ball = Mover:create(location)

    comp_points = 0
    player_points = 0

end

function love.update()
    if love.keyboard.isDown("up") then
        player.location.y = player.location.y - 10
    end

    if love.keyboard.isDown("down") then
        player.location.y = player.location.y + 10
    end 
    
    -- if ball.location.x < ball.size then
    --     player_points = player_points + 1
    --     ball.velocity = Vector:create(5, 5)
    -- end

    -- if ball.location.x >= width - ball.size then 
    --     comp_points = comp_points + 1
    --     ball.velocity = Vector:create(5, 5)
    -- end


    

    ball:checkBounders()
    player:checkBounders()
    comp:checkBounders()

    ball:crossCheck(player) 
    ball:crossCheck(comp)  
    

    
    comp:update()
    player:update()
    ball:update()


end

function love.draw()
    if comp_points >= 9 then
        love.graphics.print("You win!", width / 2, height / 2, 0, 2, 2)
    elseif player_points >= 9 then 
        love.graphics.print("You win!", width / 2, height / 2, 0, 2, 2)
    else
        love.graphics.print("your score " .. player_points)
        player:draw()
        ball:draw()
        comp:draw()
    end
end