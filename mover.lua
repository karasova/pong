Mover = {}
Mover.__index = Mover

function Mover:create(location)
    local mover = {}
    setmetatable(mover, Mover)
    mover.location = location
    mover.size = 10 
    mover.velocity = Vector:create(5, 5) 
    mover.player = 0
    mover.comp = 0

    return mover
end

function Mover:applyForce(force) 
    self.velocity = self.velocity + (force / self.weight)
end

function Mover:checkBounders()
    if self.location.x > width - self.size then 
        self.location.x = width - self.size 
        self.velocity.x = -1 * self.velocity.x
        self.player = self.player + 1
    elseif self.location.x < self.size then 
        self.location.x = self.size
        self.velocity.x = -1 * self.velocity.x
        self.comp = self.comp + 1
    end
    
    if self.location.y > height - self.size then 
        self.location.y = height - self.size 
        self.velocity.y = -1 * self.velocity.y
    elseif self.location.y < self.size then 
        self.location.y = self.size
        self.velocity.y = -1 * self.velocity.y
    end
end

function Mover:crossCheck(object) 
    if ((self.location.x < object.img:getWidth() / 4) and (self.location.x > 20) and (self.location.y < object.location.y + object.img:getHeight() / 4 ) and (self.location.y > object.location.y))  
    then
        self.location.x = object.img:getWidth() / 4 
        self.velocity.x = -1 * self.velocity.x
        self.velocity.x = self.velocity.x + 1
        self.velocity.y = self.velocity.y + 1
    end
end

function Mover:draw()
    love.graphics.circle("fill", self.location.x, self.location.y, self.size)
end

function Mover:update()
    self.location = self.location + self.velocity
end

