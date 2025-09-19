if Config.Options == "drawtext" or Config.Options == "3dtext" then
-- creating bank points
    local function DrawText3D(x, y, z, text)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        
        if onScreen then
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextDropShadow(0, 0, 0, 55)
            SetTextEdge(0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x,_y)
        end
    end

    local textShown = false
    local ATMCoords = nil
    local NearbyModel = false
    CreateThread(function()
        for k, v in pairs(Locations) do
            local point = lib.points.new({
                coords = v.coords,
                distance = 2,
            })
            
            function point:onEnter()
                
                if Config.Options == "drawtext" then
                    textShown = true
                    lib.showTextUI(Locales["open_bank_text"])
                end
            end
            
            function point:onExit()
                if Config.Options == "drawtext" then
                    textShown = false
                    lib.hideTextUI()
                end
            end

            function point:nearby()
                if IsControlJustPressed(0, 38) then
                    DoProgress(true)
                end

                if Config.Options == "drawtext" then
                    if bankOpen and textShown then
                        lib.hideTextUI()
                        textShown = false
                    elseif not bankOpen and not textShown then
                        lib.showTextUI(Locales["open_bank_text"])
                        textShown = true
                    end
                else
                    DrawText3D(v.coords.x, v.coords.y, v.coords.z, Locales["open_bank_text"])
                end
            end
        end
    end)



    CreateThread(function()
        while true do
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            local modelFound = false
            for k, v in pairs(Config.ATMModels) do
                if type(k) ~= "number" then
                    k = joaat(k)
                end
                ATM = GetClosestObjectOfType(PlayerCoords, 2.0, k, false, false, false)
                if ATM ~= 0 then
                    ATMCoords = GetEntityCoords(ATM)
                    if not ATMOpen then
                        if #(PlayerCoords - ATMCoords) < 2.5 then
                            NearbyModel = true
                            modelFound = true
                        else 
                            NearbyModel = false
                        end 
                    else
                        NearbyModel = false
                    end
                end
            end
            if not modelFound then
                NearbyModel = false
            end
            Wait(500)
        end
    end)

    --- Check for keypresses when nearby a dumpster.
    CreateThread(function()
        while true do
            local WaitTime = 350
            if NearbyModel then
                WaitTime = 0
                if Config.Options == "drawtext" then
                    if not textShown and not ATMOpen then
                        lib.showTextUI(Locales["open_atm_text"])
                        textShown = true
                    end
                    if ATMOpen and textShown then
                        lib.hideTextUI()
                        textShown = false
                    end
                else
                    DrawText3D(ATMCoords.x, ATMCoords.y, ATMCoords.z + 1.0, Locales["open_atm_text"])
                end
                if IsControlJustReleased(0, 38) and not ATMOpen then
                    DoProgress(false, ATMCoords)
                end
            else
                if textShown then
                    lib.hideTextUI()
                    textShown = false
                end
            end
            Wait(WaitTime)
        end
    end)
elseif Config.Options == "target" then
    -- ox_target variant (works great alongside ox_inventory)
    -- Requirements: ox_lib (you already use `lib`), ox_target

    local spawnedEntity = {}

    local function SpawnPed(v)
        RequestModel(v.model)
        while not HasModelLoaded(v.model) do
            Wait(0)
        end

        local entity = CreatePed(
            0,
            GetHashKey(v.model),
            v.ped.x, v.ped.y, v.ped.z - 1.0,
            v.ped.w,
            false, false
        )

        FreezeEntityPosition(entity, true)
        SetEntityInvincible(entity, true)
        SetBlockingOfNonTemporaryEvents(entity, true)

        -- addLocalEntity: attach a target option directly to the spawned ped
        exports.ox_target:addLocalEntity(entity, {
            {
                name   = 'snipe_bank_open_' .. tostring(v.ped.x) .. '_' .. tostring(v.ped.y),
                icon   = 'fa-solid fa-building-columns',
                label  = Locales["target_label_open_bank"],
                distance = 2.5,
                canInteract = function(ent, distance, coords, name)
                    return not bankOpen and distance <= 2.5
                end,
                onSelect = function(data)
                    DoProgress(true)
                end
            }
        })

        return entity
    end

    -- Smart ped spawn / despawn by proximity (same idea as your original)
    CreateThread(function()
        while true do
            Wait(1000)
            local pos = GetEntityCoords(PlayerPedId())

            for k, v in pairs(Locations) do
                local here = #(pos - vector3(v.ped.x, v.ped.y, v.ped.z)) < 50.0
                if here then
                    if spawnedEntity[k] == nil or not DoesEntityExist(spawnedEntity[k]) then
                        spawnedEntity[k] = SpawnPed(v)
                    end
                else
                    if spawnedEntity[k] ~= nil and DoesEntityExist(spawnedEntity[k]) then
                        DeleteEntity(spawnedEntity[k])
                        spawnedEntity[k] = nil
                    end
                end
            end
        end
    end)

    -- Target on ATM models (uses addModel)
    do
        local atmmodels = {}
        for k, _ in pairs(Config.ATMModels) do
            -- Accept both string names and hashes
            if type(k) == 'string' then
                table.insert(atmmodels, joaat(k))          -- normalize for safety
                table.insert(atmmodels, k)                 -- and also the plain name (ox_target supports both)
            else
                table.insert(atmmodels, k)
            end
        end

        exports.ox_target:addModel(atmmodels, {
            {
                name   = 'snipe_bank_use_atm',
                icon   = 'fa-solid fa-money-bill',
                label  = Locales["target_label_open_atm"],
                distance = 1.5,
                canInteract = function(entity, distance, coords, name)
                    return not ATMOpen and distance <= 1.5
                end,
                onSelect = function(data)
                    local ent = data and data.entity or 0
                    local c = ent ~= 0 and GetEntityCoords(ent) or GetEntityCoords(PlayerPedId())
                    DoProgress(false, c)
                end
            }
        })
    end

    -- Target on fixed ATM coords (zones) if you also have ATMLocations
    for k, v in pairs(ATMLocations) do
        -- Small sphere zone over the ATM point
        exports.ox_target:addSphereZone({
            coords = vec3(v.x, v.y, v.z),
            radius = 0.75,
            debug  = false,
            options = {
                {
                    name   = 'snipe_bank_atm_zone_' .. k,
                    icon   = 'fa-solid fa-money-bill',
                    label  = Locales["target_label_open_atm"],
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name)
                        return not ATMOpen and distance <= 1.5
                    end,
                    onSelect = function(data)
                        DoProgress(false, vec3(v.x, v.y, v.z))
                    end
                }
            }
        })
    end
end

