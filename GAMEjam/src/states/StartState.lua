







StartState = Class{__includes = BaseState}


local highlighted = 1

function StartState:init()
    self.level = 1
end

function StartState:update(dt)

    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlighted = highlighted == 1 and 2 or 1
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if highlighted == 1 then
            gStateMachine:change('play-state', {
                level = self.level,
            })
        end
    end


    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end




function StartState:render()


    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("SHADOWY PATHS", 0, VIRTUAL_HEIGHT / 3,
        VIRTUAL_WIDTH, 'center')
    

    love.graphics.setFont(gFonts['medium'])

    -- if we're highlighting 1, render that option blue
    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("START", 0, VIRTUAL_HEIGHT / 2 + 50,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)

    -- render option 2 blue if we're highlighting that one
    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf("FUNNY BUTTON", 0, VIRTUAL_HEIGHT / 2 + 70,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)

end


