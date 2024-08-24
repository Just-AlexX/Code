
Character = Class{}

function Character:init(x, y)
    
    self.x = VIRTUAL_WIDTH / 2 - 15
    self.y = VIRTUAL_HEIGHT + 40
    self.width = 30
    self.height = 40

    self.playergrid = anim8.newGrid( 30, 40, gTextures['player-sprite']:getWidth(), gTextures['player-sprite']:getHeight())

    self.animations = {}
    self.animations.up = anim8.newAnimation(self.playergrid('1 - 4', 1), 0.2)
    self.animations.right = anim8.newAnimation(self.playergrid('1 - 4', 2), 0.2)
    self.animations.left = anim8.newAnimation(self.playergrid('1 - 4', 3), 0.2)
    self.animations.still = anim8.newAnimation(self.playergrid('2 - 2', 1), 0.5)

    self.animPhase = 1
    self.anim = self.animations.up
end

function Character:update(dt)
    if self.animPhase == 1 then
        self.anim = self.animations.up
    else 
        if self.animPhase == 2 then
        self.anim = self.animations.right
        else
            if self.animPhase == 3 then
                self.anim = self.animations.left
            else
                if self.animPhase == 4 then
                    self.anim = self.animations.still
                end
            end
        end
    end

    self.anim:update(dt)
end

function Character:render() 
        self.anim:draw(gTextures['player-sprite'], self.x, self.y)
end
