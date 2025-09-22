if Config.Inventory ~= 'tgiann-inventory' then
    return
end

function openStash(customData, uniq)
    local data = customData or Config.DefaultStashData
    local house = CurrentHouse
    local houseData = Config.Houses[house]
    if not customData then
        if houseData.ipl then
            data = houseData.ipl.stash or data
        else
            local shellData = Config.Shells[houseData.tier]
            if shellData then
                data = shellData.stash or data
            end
        end
    end
    uniq = uniq or house
    uniq = uniq:gsub('-', '_')
    local maxweight = data.maxweight or 10000
    exports['tgiann-inventory']:OpenInventory('stash', uniq, {
        maxweight = maxweight,
        slots = data.slots or 100,
    })
end
