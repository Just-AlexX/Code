

GridBlocks = Class{}

function GridBlocks:init(x, y, type)
    -- used for coloring and score calculation


    self.gridX = x
    self.gridY = y
    
    self.x = (self.gridX - 1) * 67
    self.y = (self.gridY - 1) * 67
    self.width = 67
    self.height = 67
    

    self.type = type
    
end

function GridBlocks:render()
    if self.type == 'cross' then
        love.graphics.draw(gTextures['cross'], self.x + x, self.y + y)
    else
        if self.type == 'circle' then
            love.graphics.draw(gTextures['circle'], self.x + x, self.y + y)
        end
    end
end
