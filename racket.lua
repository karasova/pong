Racket = {}
Racket.__index = Racket

function Racket:create(location, auto)
    local racket = {}
    setmetatable(racket, Racket)
    racket.location = location 
    racket.auto = auto 
    racket.velocity = Vector:create(0, 50)
    racket.acceleration = Vector:create(0, 1)
    racket.force = 7
    racket.size = Vector:create(5, 100)
    return racket
end

function Racket:update()
    if self.auto then
        self.location.y = self.location.y + self.force
    end
end

function Racket:draw()
    r, g, b = love.graphics.getColor()

    if self.auto then
        love.graphics.setColor(1, 0, 0)
    else
        love.graphics.setColor(1, 1, 1)
    end
    love.graphics.rectangle("fill", self.location.x, self.location.y, self.size.x, self.size.y)

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

