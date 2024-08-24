require 'src/Dependencies'



function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())


    love.window.setTitle('TikTakToe')


    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
    }
    love.graphics.setFont(gFonts['small'])

    gTextures = {
        ['background'] = love.graphics.newImage('graphics/background.png'),
        ['board'] = love.graphics.newImage('graphics/CheckBoard.png'),
        ['cross'] = love.graphics.newImage('graphics/Cross.png'),
        ['circle'] = love.graphics.newImage('graphics/Circle.png'),
    }



    

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })


    gSounds = {
    }

    
    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play-1'] = function() return PlayState1() end,
    }
    gStateMachine:change('start')

    love.keyboard.keysPressed = {}

end


function love.resize(w, h)
    push:resize(w, h)
end


function love.update(dt)
    -- this time, we pass in dt to the state object we're currently using
    gStateMachine:update(dt)

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


    local backgroundWidth = gTextures['background']:getWidth()
    local backgroundHeight = gTextures['background']:getHeight()

    love.graphics.draw(gTextures['background'], 

        0, 0, 

        0,

        VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1))


    love.graphics.draw(gTextures['board'], 0, 0, 0, VIRTUAL_WIDTH / 2 - 100 , VIRTUAL_HEIGHT / 2 - 100)
    
    
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







