


PlayState = Class{__includes = BaseState}



function PlayState:enter(params)
    self.level = params.level
    self.doorways = LevelMaker.createMap(self.level)
    self.paused = false
    self.selectedX = 1
    self.selectedY = 1
    self.character = Character()
    self.transitionAlpha = 0
    self.transitioned = params.transitioned
    self.characterAppear = 1
end

function PlayState:update(dt)

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


    for d , doorway in pairs(self.doorways) do
        doorway:update(dt)
    end


    if self.transitioned == false then
        Timer.tween(2, {
            [self] = {transitionAlpha = 0}}
        )
        self.transitioned = true
    end

    if self.characterAppear == 1 then
        Timer.tween(2, {
            [self.character] = {y = self.character.y - 85}
        })
        self.characterAppear = 2
    end

    if self.character.y == VIRTUAL_HEIGHT - 45  then


        if love.keyboard.wasPressed('up') then
            if self.selectedY > 1 then
                self.selectedY = self.selectedY - 1
                gSounds['select']:play()
            end
        elseif love.keyboard.wasPressed('down') then
            if self.selectedY < 4 then  -- Adjust according to the number of rows
                self.selectedY = self.selectedY + 1
                gSounds['select']:play()
            end
        elseif love.keyboard.wasPressed('left') then
            if self.selectedX > 1 then
                self.selectedX = self.selectedX - 1
                gSounds['select']:play()
            end
        elseif love.keyboard.wasPressed('right') then
            if self.selectedX < 5 then  -- Adjust according to the number of columns
                self.selectedX = self.selectedX + 1
                gSounds['select']:play()
            end
        end

        -- Deselect all doorways
        for p , doorway in pairs(self.doorways) do
            doorway.selected = false
            doorway:update(dt)
        end

        -- Select the current doorway
        local selectedIndex = (self.selectedY - 1) * 5 + self.selectedX
        self.doorways[selectedIndex].selected = true
                        

        if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then

            if self.character.x > self.doorways[selectedIndex].x then
                self.character.animPhase = 3
            else
                self.character.animPhase = 2
            end

            Timer.tween(1, {

                [self.character] = {x = self.doorways[selectedIndex].x + 25, y = self.character.y}

            }):finish(function()

                self.character.animPhase = 1,
                Timer.tween(2, {

                    [self.character] = {x = self.character.x, y = self.doorways[selectedIndex].y + 10}

                }):finish(function()

                    self.character.animPhase = 3,
                    Timer.tween(0.4, {

                        [self.character] = {x = self.doorways[selectedIndex].x - 5, y = self.character.y},

                    }):finish(function()

                        self.character.animPhase = 1,
                        Timer.after(0.5, function()
                            Timer.tween(2, {
                                [self.character] = { x = self.character.x, y = self.character.y - 8 },
                                [self] = {transitionAlpha = 1}
                            }):finish(function()

                                local selectedIndex = (self.selectedY - 1) * 5 + self.selectedX

                                gStateMachine:change('change-state', {
                                    level = self.level,
                                    safedoorway = self.doorways[selectedIndex].safe,
                                    })

                            end)
                        end)
                    end)
                end)
            end)
        end
    end

    
    
    

    

    self.character:update(dt)

   --[[    :finish(function()
            Timer.tween(2, {
                [flappy] = {x = VIRTUAL_WIDTH - flappySprite:getWidth(), y = VIRTUAL_HEIGHT - flappySprite:getHeight()}
            })
        end) 
        
        Timer.after(0.5, function()
                    Timer.tween(0.5, {
                        [self.character] = { x = self.character.x, y = self.character.y - 8 }
                    })
                end)


                :finish(function()
                            gStateMachine:change('next-up', {
                                level = self.level
                            })
        
                            -- remove color timer from Timer
                            self.colorTimer:remove()
                        end)

        
        ]] --




end


function PlayState:render()
    

    local backgroundWidth = gTextures['background1']:getWidth()
    local backgroundHeight = gTextures['background1']:getHeight()
    love.graphics.draw(gTextures['background2'], 0, 0, 0, VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1))

    for k, doorway in pairs(self.doorways) do
        doorway:render()
    end

    self.character:render()

    if self.paused then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.draw(gTextures['over-background'], 0, VIRTUAL_HEIGHT - 150)

    love.graphics.draw(gTextures['board'], VIRTUAL_WIDTH / 2 - 35 , VIRTUAL_HEIGHT - 10)


    love.graphics.setColor(0, 0, 0, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    
end



    
