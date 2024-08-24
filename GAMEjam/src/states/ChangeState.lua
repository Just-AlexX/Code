ChangeState = Class{__includes = BaseState}

function ChangeState:enter(params)
    self.level = params.level
    self.safedoorway = params.safedoorway
    self.transitionAlpha = 1
    self.transitionWords = 0
    self.transitioned = false
end


function ChangeState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start-state', {
        })
    end

    if self.safedoorway == true then
        if self.level < 19 then
            gStateMachine:change('play-state', {
                level = self.level + 1,
                transitioned = self.transitioned
            })
        else
            if self.level == 19 then
                gStateMachine:change('victory-state', {
                    level = self.level,
                })
            end
        end
    else
        if self.transitioned == false then
            Timer.tween(2, {
                [self] = {transitionAlpha = 0}}
            )
            self.transitioned = true

            gSounds['die1']:play()
        end
    end

    Timer.after(3, function()
        Timer.tween(3, {
            [self] = {transitionWords = 1},
        })
    end)
    

    
end

function ChangeState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('dead', 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
    
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf("Score: " .. tostring(self.level) .. ' Doorway(s)', 0, VIRTUAL_HEIGHT / 2 + 14, VIRTUAL_WIDTH, 'center')


    love.graphics.setColor(0, 0, 0, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)


    love.graphics.setColor(0, 0, 0, self.transitionWords)
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('press enter to go back to the start', 0, VIRTUAL_HEIGHT / 2 + 40, VIRTUAL_WIDTH, 'center') 
end