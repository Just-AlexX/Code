

Doorway = Class{}

function Doorway:init(x, y, Safe)
    self.x = x
    self.y = y
    self.width = 20
    self.height = 30

    self.selected = false
    self.safe = Safe

    self.playergrid = anim8.newGrid(20, 30, gTextures['vine-sprite']:getWidth(), gTextures['vine-sprite']:getHeight())

    self.animations = {}
    self.animations.eyes = anim8.newAnimation(self.playergrid('1 - 10', 1), 0.2)
    self.animations.vines = anim8.newAnimation(self.playergrid('1 - 10', 2), 0.2)
    self.animations.stope = anim8.newAnimation(self.playergrid('11 - 11', 1), 0.5)
    self.animations.stopv = anim8.newAnimation(self.playergrid('11 - 11', 2), 0.5)

    self.animvine = self.animations.stopv
    self.animeye = self.animations.stope

    self.nextAnimationSwitch = love.timer.getTime() + math.random(1, 60)
end

function Doorway:update(dt)
    local currentTime = love.timer.getTime()

    -- Update the current animations
    self.animvine:update(dt)
    self.animeye:update(dt)

    -- Switch animations at random intervals
    if currentTime >= self.nextAnimationSwitch then
        self.animvine = self.animations.vines
        self.animeye = self.animations.eyes
        Timer.after(1, function()
            self.animvine = self.animations.stopv
            self.animeye = self.animations.stope
        end)
        self.nextAnimationSwitch = currentTime + math.random(1, 30)
    end
end

function Doorway:render()
    love.graphics.draw(gTextures['doorway'], self.x, self.y)

    if self.safe == false then
        self.animeye:draw(gTextures['vine-sprite'], self.x, self.y)
    else
        self.animvine:draw(gTextures['vine-sprite'], self.x, self.y)
    end

    if self.selected == true then
        love.graphics.draw(gTextures['select-arrow'], self.x + 5, self.y + 28)
    end
end









--[[

Doorway = Class{}

function Doorway:init(x, y, Safe)
    
    self.x = x
    self.y = y
    self.width = 20
    self.height = 30

    self.selected = false
    
    self.safe = Safe

    self.playergrid = anim8.newGrid( 20, 30, gTextures['vine-sprite']:getWidth(), gTextures['vine-sprite']:getHeight())

    self.animations = {}
    self.animations.eyes = anim8.newAnimation(self.playergrid('1 - 10', 1), 0.2)
    self.animations.vines = anim8.newAnimation(self.playergrid('1 - 10', 2), 0.2)

    self.animations.stope = anim8.newAnimation(self.playergrid('11 - 11', 1), 0.5)
    self.animations.stopv = anim8.newAnimation(self.playergrid('11 - 11', 2), 0.5)

    self.animvine = self.animations.stopv
    self.animeye = self.animations.stope

end

function Doorway:update(dt)

    self.animations.eyes:update(dt)
    self.animations.vines:update(dt)

    Timer.every(math.random(1,10), function()
        self.animvine = self.animations.vines
        Timer.after(2, function()   
            self.animvine = self.animations.stopv
        end)
    end):finish()
    
end

function Doorway:render()

    love.graphics.draw(gTextures['doorway'], self.x, self.y)
    
    if self.safe == false then
        Timer.after(2, function()
            self.animations.eyes:draw(gTextures['vine-sprite'], self.x, self.y)
        end)
    end

    if self.safe == true then
        Timer.after(2, function()
            self.animations.vines:draw(gTextures['vine-sprite'], self.x, self.y)
        end)
    end

    if self.safe == false then
        self.animeye:draw(gTextures['vine-sprite'], self.x, self.y)
    else
        self.animvine:draw(gTextures['vine-sprite'], self.x, self.y)
    end

    if self.selected == true then
        love.graphics.draw(gTextures['select-arrow'], self.x + 5, self.y + 28)
    end
end
]]


