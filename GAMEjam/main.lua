require 'src/Dependencies'


function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())


    love.window.setTitle('Shadow Paths')

    

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })
    
    gSounds = {
        ['select'] = love.audio.newSource('sounds/select.wav', 'static'),
        ['select-path'] = love.audio.newSource('sounds/Blip_Select13.wav', 'static'),
        ['pause'] = love.audio.newSource('sounds/pause.wav', 'static'),
        ['enter-path'] = love.audio.newSource('sounds/Powerup4New.wav', 'static'),
        ['music'] = love.audio.newSource('sounds/MysticalSoundtrack2.wav', 'static'),
        ['die1'] = love.audio.newSource('sounds/Explosion.wav', 'static'),
    }

    gTextures = {
        ['background1'] = love.graphics.newImage('graphics/background-start.png'),
        ['background2'] = love.graphics.newImage('graphics/background-play.png'),
        ['over-background'] = love.graphics.newImage('graphics/OverBackground.png'),
        ['doorway'] = love.graphics.newImage('graphics/Doorway.png'),
        ['doorway-eyes'] = love.graphics.newImage('graphics/Doorway-Eyes.png'),
        ['select-arrow'] = love.graphics.newImage('graphics/SelectArrow.png'),
        ['player-sprite'] = love.graphics.newImage('graphics/player-sheet22.png'),
        ['vine-sprite'] = love.graphics.newImage('graphics/vinesheet2.png'),
        ['board'] = love.graphics.newImage('graphics/BackBoard.png')
    }
    
    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
    }

    gStateMachine = StateMachine {
        ['start-state'] = function() return StartState() end,
        ['play-state'] = function() return PlayState() end,
        ['change-state'] = function() return ChangeState() end,
        ['victory-state'] = function() return VictoryState() end,

    }



    gStateMachine:change('start-state')

    gSounds['music']:play()
    gSounds['music']:setLooping(true)

    love.keyboard.keysPressed = {}

    
end


function love.resize(w, h)
    push:resize(w, h)
end


function love.update(dt)
    -- this time, we pass in dt to the state object we're currently using
    gStateMachine:update(dt)

    Timer.update(dt)
    -- reset keys pressed
    love.keyboard.keysPressed = {}

end


function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true
end


function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end


function love.draw()

    push:apply('start')


    local backgroundWidth = gTextures['background1']:getWidth()
    local backgroundHeight = gTextures['background1']:getHeight()


    love.graphics.draw(gTextures['background1'], 0, 0, 0, VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1))      


    
    gStateMachine:render()
    

    displayFPS()
    
    push:apply('end')
end

function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end







