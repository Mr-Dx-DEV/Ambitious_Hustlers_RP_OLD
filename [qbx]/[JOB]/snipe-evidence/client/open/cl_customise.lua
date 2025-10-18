function ShowNotification(msg, type)
    if Config.Notify == "ox" then
        lib.notify({type = type, description = msg})
    elseif Config.Notify == "qb" then
        QBCore.Functions.Notify(msg, type)
    elseif Config.Notify == "esx" then
        ESX.ShowNotification(msg)
    elseif Config.Notify == "okok" then
        exports['okokNotify']:Alert("Bundles", msg, 5000, type)
    end
end

-- function that checks if the player has access to the evidence system
function CanAccess()
    return Config.Jobs[PlayerInfo.job] or false
end

function CanEditCrimeScenes()
    return Config.EditPerms[PlayerInfo.job] <= PlayerInfo.grade or false
end
-- taken from https://gist.github.com/TGIANN/2f1a9233009fbe738dbb86372b135f1b
local function GetLineCountAndMaxLenght(text)
    local count = 0
    local maxLenght = 0
    for line in text:gmatch("([^\n]*)\n?") do
        count = count + 1
        local lenght = string.len(line)
        if lenght > maxLenght then maxLenght = lenght end
    end
    return count, maxLenght
end

function DrawText3D(coords, text)
    local data = {
        coords = coords,
        text = text,
    }
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextCentre(1)
    SetTextEntry("STRING")
    local totalLenght = string.len(data.text)
    local textMaxLenght = data.textMaxLenght or 99 -- max 99
    local text = totalLenght > textMaxLenght and data.text:sub(1, totalLenght - (totalLenght - textMaxLenght)) or data.text
    AddTextComponentString(text)
    SetDrawOrigin(data.coords.x, data.coords.y, data.coords.z, 0)
    DrawText(0.0, 0.0)
    local count, lenght = GetLineCountAndMaxLenght(text)

    local padding = 0.005
    local heightFactor = (count / 43) + padding
    local weightFactor = (lenght / 100) + padding

    local height = (heightFactor / 2) - padding / 2
    local width = (weightFactor / 2) - padding / 2

    DrawRect(0.0, height, width, heightFactor, 11, 11, 11, 120)
    ClearDrawOrigin()
end

function GetVehicleLabel(model)
    if Config.UseQBCoreVehicleLabels then
        local vehicles = QBCore.Shared.Vehicles
        for k, v in pairs(vehicles) do
            if model == GetHashKey(v.model) then
                return v.name
            end
        end
        return "Unknown"
    else

        local label = GetDisplayNameFromVehicleModel(model)
        if label then
            return label
        end
        return "Unknown"
    end
end

-- you can add exports for your arena, paintball scripts here to ignore dropping bullet casing while player are in paintball
function IgnoreEvidence()
    return false
end

-- do not touch if you dont know what you are doing!!!!!
AddEventHandler('ox_inventory:currentWeapon', function(weapon)
    if not weapon then
        isHoldingFlashlight = false
        currentWeapon = nil
        isCopHoldingFlashight = false
        return
    end
    if weapon.name == currentWeapon?.name and weapon.slot == currentWeapon?.slot then
        return
    end
    currentWeapon = weapon

    if not Config.FingerPrintWeapons.IgnoreWeapons[weapon.name] then
        if math.random(1, 100) > Config.FingerPrintWeapons.Chance then goto skip_fingerprint end
        if Config.Gloves.enabled and Config.Gloves.disableFingerprintIfGlovesOn and IsWearingGloves() then goto skip_fingerprint end

        LeaveFingerprintOnWeapon()

    end
    ::skip_fingerprint::
    if weapon.name == "WEAPON_FLASHLIGHT" then
        if CanAccess() then
            StartFlashlightThread(true)
            StartFlashlightSlowThread(true)
            isCopHoldingFlashight = true
        else
            StartFlashlightThread(false)
            StartFlashlightSlowThread(false)
            
        end
    else
        isHoldingFlashlight = false
    end
end)
