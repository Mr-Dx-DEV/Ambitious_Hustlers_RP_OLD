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
            exports['vms_notify']:Notification("CITY HALL", message, time, "#36f230", "fa-solid fa-square-parking")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'success', time)
        end
    elseif type == "error" then
        if GetResourceState("vms_notify") == 'started' then
            exports['vms_notify']:Notification("CITY HALL", message, time, "#f23030", "fa-solid fa-square-parking")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'error', time)
        end
    elseif type == "info" then
        if GetResourceState("vms_notify") == 'started' then
            exports['vms_notify']:Notification("CITY HALL", message, time, "#4287f5", "fa-solid fa-square-parking")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'primary', time)
        end
    end
end


-- ██╗  ██╗██╗   ██╗██████╗ 
-- ██║  ██║██║   ██║██╔══██╗
-- ███████║██║   ██║██║  ██║
-- ██╔══██║██║   ██║██║  ██║
-- ██║  ██║╚██████╔╝██████╔╝
-- ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
CL.Hud = {
    Enable = function()
        if GetResourceState('vms_hud') ~= 'missing' then
            -- exports['vms_hud']:Display(true)
        end
    end,
    Disable = function()
        if GetResourceState('vms_hud') ~= 'missing' then
            -- exports['vms_hud']:Display(false)
        end
    end
}


-- ████████╗███████╗██╗  ██╗████████╗██╗   ██╗██╗
-- ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝██║   ██║██║
--    ██║   █████╗   ╚███╔╝    ██║   ██║   ██║██║
--    ██║   ██╔══╝   ██╔██╗    ██║   ██║   ██║██║
--    ██║   ███████╗██╔╝ ██╗   ██║   ╚██████╔╝██║
--    ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝
CL.TextUI = {
    Enabled = true,
    Open = function(message)
        exports['vms_notifyv2']:ShowTextUI(message)
        -- exports["interact"]:Open("E", message) -- Here you can use your TextUI or use my free one - https://github.com/vames-dev/interact
    end,
    Close = function()
        exports['vms_notifyv2']:HideTextUI()
        -- exports["interact"]:Close() -- Here you can use your TextUI or use my free one - https://github.com/vames-dev/interact
    end
}


-- ████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗
-- ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
--    ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   
--    ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   
--    ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   
--    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   
CL.Target = function(type, data, cb)
    if type == 'zone' then
        if Config.TargetResource == 'ox_target' then
            local options = {}
            if data.options and next(data.options) then
                for k, v in pairs(data.options) do
                    options[#options + 1] = {
                        name = v.name,
                        icon = v.icon,
                        label = v.label,
                        onSelect = v.action,
                        distance = 1.2,
                        groups = v.jobs,
                    }
                end
            end
            return exports['ox_target']:addBoxZone({
                coords = vec(data.coords.x, data.coords.y, data.coords.z-0.5),
                size = data.size and data.size.xyz or vec(1.2, 1.2, 1.8),
                debug = false,
                useZ = true,
                rotation = data.rotation or 0.0,
                options = options
            })
        elseif Config.TargetResource == 'qb-target' then
            local uniqueName = 'vms_cityhall-'..math.random(1000000, 9999999999)
            local options = {}
            if data.options and next(data.options) then
                for k, v in pairs(data.options) do
                    options[#options + 1] = {
                        num = #options + 1,
                        icon = v.icon,
                        label = v.label,
                        action = v.action,
                        job = v.jobs,
                    }
                end
            end

            exports['qb-target']:AddBoxZone(uniqueName, vec(data.coords.x, data.coords.y, data.coords.z), data.size and data.size.x or 1.2, data.size and data.size.y or 1.2, {
                name = uniqueName,
                heading = data.rotation and data.rotation - 90.0 or 0.0,
                debugPoly = false,
                minZ = data.coords.z - (data.size and data.size.y or 1.2),
                maxZ = data.coords.z + (data.size and data.size.y or 1.2),
            }, {
                options = options,
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
        
    elseif type == 'entity' then
        if Config.TargetResource == 'ox_target' then
            exports['ox_target']:addGlobalVehicle({
                {
                    name = data.name,
                    icon = 'fa-solid fa-car',
                    label = data.label,
                    groups = data.jobs,
                    onSelect = function(data)
                        cb(data)
                    end,
                }
            })
        elseif Config.TargetResource == 'qb-target' then
            exports['qb-target']:AddGlobalVehicle({
                options = {
                    {
                        icon = "fas fa-car",
                        label = data.label,
                        job = data.jobs,
                        action = function(data)
                            cb({entity = data})
                        end,
                    },
                },
                distance = 1.8
            })
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

CL.GetEmployees = function(cb, jobName)
    if Config.Core == "ESX" then
        ESX.TriggerServerCallback('esx_society:getEmployees', function(employees)
            cb(employees)
        end, jobName)

        -- local employees = lib.callback.await('esx_society:getEmployees', false, jobName) -- OX_LIB ESX_SOCIETY
        -- cb(employees)

    elseif Config.Core == "QB-Core" then
        if GetResourceState('qbx_core') == 'started' then
            -- https://docs.vames-store.com/helpful/common-errors#i-cannot-open-management-menu-clerk-menu-on-qbx-core
            QBCore.Functions.TriggerCallback('qbx_management:server:GetEmployeesForVMS', function(employees)
                cb(employees)
            end, jobName)
            
        else
            QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetEmployees', function(employees)
                cb(employees)
            end, jobName)
            
        end
        
    end
end

CL.GetClosestPlayer = function()
    if Config.Core == "ESX" then
        return ESX.Game.GetClosestPlayer(GetEntityCoords(PlayerPedId()), 6.0) -- ESX
    elseif Config.Core == "QB-Core" then
        return QBCore.Functions.GetClosestPlayer(GetEntityCoords(PlayerPedId())) -- QB-Core
    end
end

CL.GetClosestPlayers = function()
    if Config.Core == "ESX" then
        local playerInArea = ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId()), 5.0)
        return playerInArea
    elseif Config.Core == "QB-Core" then
        local playerInArea = QBCore.Functions.GetPlayersFromCoords(GetEntityCoords(PlayerPedId()), 5.0)
        return playerInArea
    end
end

CL.GetClosestVehicle = function(myCoords)
    if Config.Core == "ESX" then
        local closestVehicle, closestDistance = ESX.Game.GetClosestVehicle(myCoords);
        if closestDistance >= 6.0 then
            return nil
        end
        return closestVehicle;
        
    elseif Config.Core == "QB-Core" then
        local closestVehicle, closestDistance = QBCore.Functions.GetClosestVehicle(myCoords);
        if closestDistance >= 6.0 then
            return nil
        end
        return closestVehicle;
        
    end
end

CL.GetVehicleLabel = function(model)
    if not model then return nil end;
    
    local model = tonumber(model) and model or joaat(model)
    
	for k, v in pairs(Config.CustomVehicleLabels) do
		if model == k then
			return v
		end
	end

    local vehLabel = GetLabelText(GetDisplayNameFromVehicleModel(model))
    if vehLabel == 'NULL' then
        return GetDisplayNameFromVehicleModel(model);
    end

	return vehLabel;
end


--  ██████╗ ██╗  ██╗    ██╗███╗   ██╗██╗   ██╗███████╗███╗   ██╗████████╗ ██████╗ ██████╗ ██╗   ██╗    ███╗   ███╗███████╗████████╗ █████╗ ██████╗  █████╗ ████████╗ █████╗ 
-- ██╔═══██╗╚██╗██╔╝    ██║████╗  ██║██║   ██║██╔════╝████╗  ██║╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝    ████╗ ████║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗
-- ██║   ██║ ╚███╔╝     ██║██╔██╗ ██║██║   ██║█████╗  ██╔██╗ ██║   ██║   ██║   ██║██████╔╝ ╚████╔╝     ██╔████╔██║█████╗     ██║   ███████║██║  ██║███████║   ██║   ███████║
-- ██║   ██║ ██╔██╗     ██║██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║   ██║   ██║██╔══██╗  ╚██╔╝      ██║╚██╔╝██║██╔══╝     ██║   ██╔══██║██║  ██║██╔══██║   ██║   ██╔══██║
-- ╚██████╔╝██╔╝ ██╗    ██║██║ ╚████║ ╚████╔╝ ███████╗██║ ╚████║   ██║   ╚██████╔╝██║  ██║   ██║       ██║ ╚═╝ ██║███████╗   ██║   ██║  ██║██████╔╝██║  ██║   ██║   ██║  ██║
--  ╚═════╝ ╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
Citizen.CreateThread(function()
    Citizen.Wait(500)
    if GetResourceState('ox_inventory') ~= 'missing' then
        exports.ox_inventory:displayMetadata({
            -- certificate_no_criminal:
            dateOfIssue = 'Date of Issue',
            -- firstName = 'First name',
            -- lastName = 'Last name',
            dateOfBirth = 'Date of Birth',
            ssn = 'SSN',
            nationality = 'Nationality'

            -- invoice:

            
            -- ticket:

        });
    end
end)