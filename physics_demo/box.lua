local PVector = require("pvector")

Box = {}
Box.__index = Box

function Box:new(vPosition, mass)
    return setmetatable({
        position = vPosition,
        velocity = PVector:new(0, 0),
        acceleration = PVector:new(0, 0),
        mass = mass or 1,
        force = PVector:new(0, 0)
    }, Box)
end

function Box:update(dt)
    -- Aplicar força resultante (F = ma -> a = F/m)
    self.acceleration = self.force * (1/self.mass)
    
    -- Integrar velocidade
    self.velocity = self.velocity + self.acceleration * dt
    
    -- Atrito mais realista (proporcional à velocidade)
    local frictionCoefficient = 0.1
    local friction = self.velocity * (-1) * frictionCoefficient
    self:applyForce(friction)
    
    -- Atualizar posição
    self.position = self.position + self.velocity * dt
    
    -- Resetar forças
    self.force = PVector:new(0, 0)
end

function Box:applyForce(vForce)
    self.force = self.force + vForce
end

function Box:display()
    love.graphics.rectangle("fill", self.position.x, self.position.y, 30, 30)
end

return Box