Racket = {}
Racket.__index = Racket

function Racket:create(location, auto, img)
    local racket = {}
    setmetatable(racket, Racket)
    racket.location = location 
    racket.auto = auto 
    racket.velocity = Vector:create(0, 50)
    racket.acceleration = Vector:create(0, 1)
    racket.force = 10
    racket.size = Vector:create(20, 100)
    racket.img = img
    print(racket.img)
    return racket
end

function Racket:update()
    if self.auto then
        self.location.y = self.location.y + self.force
    end
end

function Racket:draw()
    r, g, b = love.graphics.getColor()

    love.graphics.draw(self.img, self.location.x, self.location.y, 0, 1/7)

    love.graphics.setColor(r, g, b)
end

function Racket:checkBounders()
    if self.location.y > height - self.size.y then
        self.location.y = height - self.size.y
        self.velocity.y = -0.15 * self.velocity.y
        self.force = self.force * -1
    elseif self.location.y < 0 then
        self.location.y = 0
        self.velocity.y = -0.15 * self.velocity.y
        self.force = self.force * -1
    end
end

