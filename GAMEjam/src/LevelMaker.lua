--[[
*******************************************************************************************************************************************************************
    CS50G  -----  My Follow Along ( for educational purposes , not my code )


    Actual Author: Colton Ogden
    cogden@cs50.harvard.edu
]]


LevelMaker = Class{}


--[[
    Creates a table of Bricks to be returned to the main game, with different
    possible ways of randomizing rows and columns of bricks. Calculates the
    brick colors and tiers to choose based on the level passed in.
]]


function LevelMaker.createMap(level)
    local doorways = {}

    -- randomly choose the number of rows
    local numRows = 4
    local doorsRequired = level
    -- randomly choose the number of columns, ensuring odd
    local numCols = 5

    local baddoors = {}

    for x = 1, 5 do
        baddoors[x] = {}
        for y = 1, 4 do
            baddoors[x][y] = {}
            baddoors[x][y].safe = true
        end
    end

    for counter = 1, doorsRequired do
        repeat
            flag = false
            xrandom = math.random(1,5)
            yrandom = math.random(1,4)
            if baddoors[xrandom][yrandom].safe == true then
                baddoors[xrandom][yrandom].safe = false
                flag = true
            end
        until flag == true
    end

    for y = 1, numRows do

        for x = 1, numCols do

            b = Doorway(
                VIRTUAL_WIDTH/2 + (x * 60) - 190, VIRTUAL_HEIGHT/2 + (y * 50) - 140, baddoors[x][y].safe)
            
            table.insert(doorways, b)
        end
    end

    return doorways
end