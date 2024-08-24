

VictoryState = Class{__includes = BaseState}


function VictoryState:enter(params)
    self.level = params.level
    self.transitionAlpha = 1
    self.transitionWords = 0
    self.transitioned = false
end

function VictoryState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start-state', {
        })
    end

    if self.transitioned == false then
        Timer.tween(2, {
            [self] = {transitionAlpha = 0}}
        )
        self.transitioned = true
    end

end

function VictoryState:render()

    love.graphics.setColor(1, 1, 0, 1)
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("Congratulations!", 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    

    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('press enter to go back to the start', 0, VIRTUAL_HEIGHT / 2 + 40, VIRTUAL_WIDTH, 'center')


    love.graphics.setColor(0, 0, 0, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)


    
end


