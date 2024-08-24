




Grid = Class{}

function Grid:init(x, y)


    self.turn = 'cross'
    self.x = x
    self.y = y
    self.matches = {}

    self:Initialise()
    
    self.width = 67
    self.height = 67
    
end


function Grid:Initialise()

    self.GridMake = {}
    
    for y = 1, 3 do

        table.insert(self.GridMake, {})
    
        for x = 1, 3 do
    
            b = GridBlocks(
                (x-1) * 67, (y-1) * 67, nil)
    
            table.insert(self.GridMake[y], b)
    
        end
    end 
    return self.GridMake
end


function Grid:update(dt)

end



function Grid:calculateMatches()
    local matchNum = 1


    for y = 1, 3 do
        if self.GridMake[y][x].type ~= nil then
            local valueToMatch = self.GridMake[y][x].type
        end

        matchNum = 1
        
        -- every horizontal tile
        for x = 2, 3 do
            if self.GridMake[y][x].type == valueToMatch then
                matchNum = matchNum + 1
            else

                if matchNum >= 3 then
                    return true
                end
            end
        end
    end

    -- vertical matches
    for x = 1, 3 do
        if self.GridMake[y][x].type ~= nil then
            local valueToMatch = self.GridMake[y][x].type
        end

        matchNum = 1

        -- every vertical tile
        for y = 2, 3 do
            if self.GridMake[y][x].type == valueToMatch then
                matchNum = matchNum + 1
            else

                if matchNum >= 3 then
                    return true
                end
            end
        end
    end

    local yside = 1
    local xside = 1
    if self.GridMake[yside][xside].type ~= nil then
        local valueToMatch = self.GridMake[yside][xside].type
    end

    matchNum = 1

    for xside = 2, 3 do
        yside = yside + 1

        if self.GridMake[yside][xside].type == valueToMatch then
            matchNum = matchNum + 1
        else

            if matchNum >= 3 then
                return true
            end
        end
    end



    yside = 1
    xside = 3
    if self.GridMake[yside][xside].type ~= nil then
        local valueToMatch = self.GridMake[yside][xside].type
    end

    matchNum = 1

    for xside = 2, 3, -1 do
        yside = yside + 1

        if self.GridMake[yside][xside].type == valueToMatch then
            matchNum = matchNum + 1
        else

            if matchNum >= 3 then
                return true
            end
        end
    end
    


    return false
end



function Grid:render()
    for y = 1, 3 do
        for x = 1, 3 do
            self.GridMake[y][x]:render(self.x, self.y)
        end
    end
end