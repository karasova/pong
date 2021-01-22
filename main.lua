require("vector")
require("mover")
require("racket")

function love.load ()
    background = love.graphics.newImage("resources/Background.png")
    love.graphics.setNewFont("resources/Atari.ttf", 15)
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    location = Vector:create(width - 40, height/2 - 50)
    img = love.graphics.newImage("resources/Stick01.png")
    comp = Racket:create(location, true, img)

    location = Vector:create(20, height/2 - 50)
    img = love.graphics.newImage("resources/Stick.png")
    player = Racket:create(location, false, img)

    location = Vector:create(width/2, height/2)
    ball = Mover:create(location, img)

end

function love.update()
    if love.keyboard.isDown("up") then
        player.location.y = player.location.y - 10
    end

    if love.keyboard.isDown("down") then
        player.location.y = player.location.y + 10
    end     

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
    love.graphics.draw(background, 0, 0)
    if ball.comp >= 9 then
        love.graphics.print("You lose!", width / 2 - 100, height / 2, 0, 1, 2)
    elseif ball.player >= 9 then 
        love.graphics.print("You win!", width / 2 - 100, height / 2, 0, 1, 2)
    else
        love.graphics.print("your score " .. ball.player, 0, 0)
        love.graphics.print("computer score " .. ball.comp, 0, 20)
        player:draw()
        ball:draw()
        comp:draw()
    end
end
