local function NearAllowedLocations()
    local isNear = false
    for k, v in pairs(Config.LocationsToAccessCrimeScenes) do 
        local coords = GetEntityCoords(cache.ped)
        local distance = #(coords - vector3(v.x, v.y, v.z))
        if distance < 5.0 then
            isNear = true
            break
        end
    end
    return isNear
end

RegisterCommand("evidence", function()
    if not CanAccess() then
        ShowNotification(Locales["no_access"], "error")
        return
    end
    if not NearAllowedLocations() then
        ShowNotification(Locales["not_near_location"], "error")
        return
    end
    OpenEvidenceUI()
end)

exports("OpenEvidenceUI", OpenEvidenceUI)

RegisterCommand("clearnearbyscene", function()
    if not CanAccess() then
        ShowNotification(Locales["no_access"], "error")
        return
    end
    local p = promise.new()
    DoProgress(function(result)
        p:resolve(result)
    end, Config.Progress["clear_nearby"])
    local progressComplete = Citizen.Await(p)
    if not progressComplete then return end
    ClearNearbyScene()
    ShowNotification(Locales["nearby_scene_cleared"], "success")
end)

if Config.Debug then
    RegisterCommand("dropfingerprint", function()
        local coords = GetEntityCoords(cache.ped)
        exports["snipe-evidence"]:CreateFingerPrint(coords)
    end)
end