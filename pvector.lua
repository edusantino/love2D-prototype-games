PVector = {}
PVector.__index = PVector

function PVector:new(x, y)
    return setmetatable({x = x or 0, y = y or 0}, PVector)
end

-- Operações vetoriais
function PVector.__add(a, b)
    return PVector:new(a.x + b.x, a.y + b.y)
end

function PVector.__sub(a, b)
    return PVector:new(a.x - b.x, a.y - b.y)
end

function PVector:__mul(n)
    return PVector:new(self.x * n, self.y * n)
end

function PVector:__div(n)
    return PVector:new(self.x / n, self.y / n)
end

function PVector:mag()
    return math.sqrt(self.x^2 + self.y^2)
end

function PVector:normalize()
    local m = self:mag()
    if m > 0 then
        return self / m
    end
    return PVector:new(0, 0)
end

return PVector