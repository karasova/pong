Vector = {}
Vector.__index = Vector

function math.map(value, imin, imax, omin, omax)
    local scale = (omax - omin) / (imax - imin)
    return omin + (value - imin) * scale
end

function math.normal(p,a,b) -- p текущая позиция, строит перпендикуляр на путь для движения и ставит там точку
    local ap = p - a
    local ab = b - a
    ab:norm()
    ab:mul(ap:dot(ab))
    local point = a + ab
    return point
end

function Vector:create(x, y)
    local vector = {}
    setmetatable(vector, Vector)
    vector.x = x
    vector.y = y
    return vector
end

function Vector:copy()
    return Vector:create(self.x, self.y) -- копирует объект
end

function Vector:__tostring()
    return "Vector(x=" .. self.x .. ", y=" .. self.y .. ")"
end

function Vector:__add(other)
    return Vector:create(self.x + other.x, self.y + other.y)
end

function Vector:__sub(other)
    return Vector:create(self.x - other.x, self.y - other.y)
end

function Vector:__mul(value)
    return Vector:create(self.x * value, self.y * value)
end

function Vector:__div(value)
    return Vector:create(self.x / value, self.y / value)
end

function Vector:mag()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vector:norm()
    m = self:mag()
    if (m > 0) then
       -- return self / m
       self:div(m)
    end
end

function Vector:limit(max)
    if self:mag() > max then
        self:norm()
        self:mul(max)
    end
end

function Vector:add(other)
    self.x = self.x + other.x
    self.y = self.y + other.y
end

function Vector:sub(other)
    self.x = self.x - other.x
    self.y = self.y - other.y
end

function Vector:mul(value)
    self.x = self.x * value
    self.y = self.y * value
end

function Vector:div(value)
    self.x = self.x / value
    self.y = self.y / value
end

function Vector:heading()
    return math.atan2(self.y, self.x)
end

function Vector:dot(other) 
    return self.x * other.x + self.y * other.y
end

function Vector:distTo( other ) 
   local diff = self - other
   return diff:mag()
end

function math.constrain(v, min, max)
    if v < min then
        return min
    elseif v > max then
        return max
    end
    return v
end