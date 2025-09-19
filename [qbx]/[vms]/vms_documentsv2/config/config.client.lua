CL = {}

CL.DrawText3D = function(coords, text, textScale) -- This is the function used when using Config.UseText3D
    local textScale = textScale or 0.45
    local camCoords = GetFinalRenderedCamCoord()
    local distance = #(coords.xyz - camCoords)
    local scale = (textScale / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(4)
    SetTextDropShadow()
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end


-- ███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
-- ██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
-- ██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
-- ██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
-- ╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
CL.Notification = function(message, time, type)
    if type == "success" then
        if GetResourceState("vms_notify") == 'started' then
            exports['vms_notify']:Notification("DOCUMENTS", message, time, "#36f230", "fa-solid fa-square-parking")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'success', time)
        end
    elseif type == "error" then
        if GetResourceState("vms_notify") == 'started' then
            exports['vms_notify']:Notification("DOCUMENTS", message, time, "#f23030", "fa-solid fa-square-parking")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'error', time)
        end
    elseif type == "info" then
        if GetResourceState("vms_notify") == 'started' then
            exports['vms_notify']:Notification("DOCUMENTS", message, time, "#4287f5", "fa-solid fa-square-parking")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'primary', time)
        end
    end
end


-- ████████╗███████╗██╗  ██╗████████╗██╗   ██╗██╗
-- ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝██║   ██║██║
--    ██║   █████╗   ╚███╔╝    ██║   ██║   ██║██║
--    ██║   ██╔══╝   ██╔██╗    ██║   ██║   ██║██║
--    ██║   ███████╗██╔╝ ██╗   ██║   ╚██████╔╝██║
--    ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝
CL.TextUI = {
    Enabled = false,
    Open = function(message)
        -- exports["interact"]:Open("E", message) -- Here you can use your TextUI or use my free one - https://github.com/vames-dev/interact
        -- exports['qb-core']:DrawText(string.gsub(message, '\n', '<br>'), 'left')
    end,
    Close = function()
        -- exports["interact"]:Close() -- Here you can use your TextUI or use my free one - https://github.com/vames-dev/interact
        -- exports['qb-core']:HideText()
    end
}


-- ████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗
-- ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
--    ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   
--    ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   
--    ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   
--    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   
CL.Target = function(type, data)
    if type == 'zone' then
        if Config.TargetResource == 'ox_target' then
            return exports['ox_target']:addBoxZone({
                coords = vec(data.coords.x, data.coords.y, data.coords.z-0.5),
                size = data.size and data.size.xyz or vec(1.2, 1.2, 1.8),
                debug = false,
                useZ = true,
                rotation = data.rotation or 0.0,
                options = {
                    {
                        name = data.name,
                        icon = data.icon,
                        label = data.label,
                        onSelect = data.action,
                        groups = data.job,
                    }
                },
                distance = 1.2,
            })

        elseif Config.TargetResource == 'qb-target' then
            local uniqueName = 'vms_documentsv2-'..math.random(1000000, 9999999999)

            exports['qb-target']:AddBoxZone(uniqueName, vec(data.coords.x, data.coords.y, data.coords.z), data.size and data.size.x or 1.2, data.size and data.size.y or 1.2, {
                name = uniqueName,
                heading = data.rotation and data.rotation - 90.0 or 0.0,
                debugPoly = false,
                minZ = data.coords.z - (data.size and data.size.y or 1.2),
                maxZ = data.coords.z + (data.size and data.size.y or 1.2),
            }, {
                options = {
                    {
                        num = 1,
                        icon = data.icon,
                        label = data.label,
                        action = data.action,
                        job = data.job,
                    }
                },
                distance = 1.2,
            })
            return uniqueName
        
        else
            warn('You need to prepare CL.Target for the target system')
        
        end
    elseif type == 'remove-zone' then
        if Config.TargetResource == 'ox_target' then
            exports['ox_target']:removeZone(data)
        
        elseif Config.TargetResource == 'qb-target' then
            exports['qb-target']:RemoveZone(data)
        
        else
            warn('You need to prepare CL.Target for the target system')
        
        end
    end
end


-- ███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
-- ██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
-- █████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
-- ██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
-- ██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
-- ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
CL.GetPlayerData = function(type)
    if Config.Core == "ESX" then
        return ESX.GetPlayerData()
    elseif Config.Core == "QB-Core" then
        return QBCore.Functions.GetPlayerData()
    end
end

CL.GetPlayerIdentifier = function()
    if Config.Core == "ESX" then
        return PlayerData.identifier
    elseif Config.Core == "QB-Core" then
        return PlayerData.citizenid
    end
end

CL.GetPlayerJob = function(type)
    if Config.Core == "ESX" and PlayerData.job then
        if type == "table" then
            return PlayerData.job
        end
        if type == "name" then
            return PlayerData.job.name
        end
        if type == "label" then
            return PlayerData.job.label
        end
        if type == "grade" then
            return PlayerData.job.grade
        end
        if type == "grade_name" then
            return PlayerData.job.grade_name
        end
    elseif Config.Core == "QB-Core" and PlayerData.job then
        if type == "table" then
            return PlayerData.job
        end
        if type == "name" then
            return PlayerData.job.name
        end
        if type == "label" then
            return PlayerData.job.label
        end
        if type == "grade" then
            return PlayerData.job.grade.level
        end
        if type == "grade_name" then
            return PlayerData.job.grade.name
        end
    end
    return nil
end

CL.GetClosestPlayer = function()
    if Config.Core == "ESX" then
        return ESX.Game.GetClosestPlayer(GetEntityCoords(PlayerPedId()), Config.ShowDocumentDistance) -- ESX
    elseif Config.Core == "QB-Core" then
        return QBCore.Functions.GetClosestPlayer(GetEntityCoords(PlayerPedId())) -- QB-Core
    end
end

CL.GetClosestPlayers = function()
    if Config.Core == "ESX" then
        local playerInArea = ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId()), Config.ShowDocumentDistance)
        return playerInArea
    elseif Config.Core == "QB-Core" then
        local playerInArea = QBCore.Functions.GetPlayersFromCoords(GetEntityCoords(PlayerPedId()), Config.ShowDocumentDistance)
        return playerInArea
    end
end

CL.GetPlayerClothesParts = function(cb)
    if not Config.RequiredClothing then
        return cb(true)
    end

    local myModel = GetEntityModel(PlayerPedId())
    local genderModel = 1885233650 and 'm' or -1667301416 and 'f'
    local requiredParts = Config.RequiredClothingParts

    if GetResourceState('esx_skin') == 'started' then
        TriggerEvent('skinchanger:getData', function(comp, max)
            local mySkin = {}
            for k, v in pairs(comp) do
                mySkin[v.name] = tonumber(v.value)
            end

            if requiredParts['mask'] and requiredParts['mask'][genderModel] ~= nil then
                if type(requiredParts['mask'][genderModel]) == 'table' then
                    local isAllowed = false
                    for k, v in ipairs(requiredParts['mask'][genderModel]) do
                        if v == mySkin['mask_1'] then
                            isAllowed = true
                        end
                    end
                    if not isAllowed then
                        return cb(false)
                    end
                else
                    if requiredParts['mask'][genderModel] ~= mySkin['mask_1'] then
                        return cb(false)
                    end
                end
            end
            if requiredParts['sunglasses'] and requiredParts['sunglasses'][genderModel] ~= nil then
                if type(requiredParts['sunglasses'][genderModel]) == 'table' then
                    local isAllowed = false
                    for k, v in ipairs(requiredParts['sunglasses'][genderModel]) do
                        if v == mySkin['glasses_1'] then
                            isAllowed = true
                        end
                    end
                    if not isAllowed then
                        return cb(false)
                    end
                else
                    if requiredParts['sunglasses'][genderModel] ~= mySkin['glasses_1'] then
                        return cb(false)
                    end
                end
            end
            if requiredParts['hat'] and requiredParts['hat'][genderModel] ~= nil then
                if type(requiredParts['hat'][genderModel]) == 'table' then
                    local isAllowed = false
                    for k, v in ipairs(requiredParts['hat'][genderModel]) do
                        if v == mySkin['helmet_1'] then
                            isAllowed = true
                        end
                    end
                    if not isAllowed then
                        return cb(false)
                    end
                else
                    if requiredParts['hat'][genderModel] ~= mySkin['helmet_1'] then
                        return cb(false)
                    end
                end
            end
            
            return cb(true)
        end)

    end
end




Citizen.CreateThread(function()
    Citizen.Wait(500)
    if GetResourceState('ox_inventory') ~= 'missing' then
        exports.ox_inventory:displayMetadata({
            document_id = 'Serial Number',

            -- ID Card:
            firstName = 'First Name',
            lastName = 'Last Name',
            dateOfBirth = 'Date of Birth',
            height = 'Height',
            nationality = 'Nationality',
            ssn = 'SSN',

        });
    end
end)