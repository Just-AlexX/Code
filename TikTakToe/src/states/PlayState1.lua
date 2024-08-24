




PlayState1 = Class{__includes = BaseState}


function PlayState1:enter(params)
    self.turn = params.turn
    self.grid = params.grid or Grid(VIRTUAL_WIDTH/2 - 100, VIRTUAL_HEIGHT/2 - 100)
    self.cross = params.cross
    self.circle = params.circle
    self.PlayGrid = params.PlayGrid
        
end

function PlayState1:init()
    self.GridHighlightX = 0
    self.GridHighlightY = 0
    self.highlightedTile = nil
    self.paused = false
end


function PlayState1:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end



    if self.grid:calculateMatches() then
        gStateMachine:change('game-over')
    end




    if self.paused then
        if love.keyboard.wasPressed('space') then
            self.paused = false
            gSounds['pause']:play()
        else
            return
        end
    elseif love.keyboard.wasPressed('space') then
        self.paused = true
        gSounds['pause']:play()
        return
    end



    if love.keyboard.wasPressed('up') then
        self.GridHighlightY = math.max(0, self.GridHighlightY - 1)
    elseif love.keyboard.wasPressed('down') then
        self.GridHighlightY = math.min(2, self.GridHighlightY + 1)
    elseif love.keyboard.wasPressed('left') then
        self.GridHighlightX = math.max(0, self.GridHighlightX - 1)
    elseif love.keyboard.wasPressed('right') then
        self.GridHighlightX = math.min(2, self.GridHighlightX + 1)
    end
    
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        self.grid.GridMake[self.GridHighlightY + 1][self.GridHighlightX + 1].type = 'cross'
    end

end


function PlayState1:render()

    if self.paused then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
    end


    if self.grid then
        self.grid:render()
    else
        print("self.grid is nil")
    end

    love.graphics.setLineWidth(4)
    love.graphics.rectangle('line', self.GridHighlightX * 67 + (VIRTUAL_WIDTH/2 -100),
        self.GridHighlightY * 67 + (VIRTUAL_HEIGHT/2 -100), 32, 32, 4)

    if self.grid.GridMake[GridHighlightY][GridHighlightX].type == nil then
        love.graphics.setColor(1, 1, 1, 128/255)
        love.graphics.rectangle('fill', self.GridHighlightX * 67 + (VIRTUAL_WIDTH/2 -100),
        self.GridHighlightY * 67 + (VIRTUAL_HEIGHT/2 -100), 32, 32, 4)
        love.graphics.setColor(1, 1, 1, 1)
    end
end










