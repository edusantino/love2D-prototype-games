Box = require("box")

local width, height = 800, 600
local box
local timer = 0
local interval = 2
local isApplyingForce = false

function love.load()
    love.window.setMode(width, height, {resizable = false})
    box = Box:new(PVector:new(width/2 - 15, height/2 - 15), 10)
end

function love.update(dt)
    timer = timer + dt

    if love.keyboard.isDown("d") then
        local force = PVector:new(100, 0)
        box:applyForce(force)
    end
    if love.keyboard.isDown("a") then
        local force = PVector:new(-100, 0)
        box:applyForce(force)
    end
    
    box:update(dt)
end

function love.draw()
    box:display()
    
    -- Debug info
    love.graphics.print("Velocidade X: " .. string.format("%.2f", box.velocity.x), 10, 10)
    love.graphics.print("Timer: " .. string.format("%.2f", timer), 10, 30)
    love.graphics.print("Estado: " .. (isApplyingForce and "Acelerando" or "Desacelerando"), 10, 50)
end