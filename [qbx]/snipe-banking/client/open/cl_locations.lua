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
    local spawnedEntity = {}
    local function SpawnPed(v)
        RequestModel(v.model)
        while not HasModelLoaded(v.model) do
            Wait(0)
        end
        local entity = CreatePed(0, GetHashKey(v.model), v.ped.x, v.ped.y, v.ped.z - 1.0, v.ped.w,  false, false)
        FreezeEntityPosition(entity, true)
        SetEntityInvincible(entity, true)
        SetBlockingOfNonTemporaryEvents(entity, true)
        if Config.Interact and GetResourceState("interact") == "started" then
            exports.interact:AddLocalEntityInteraction({
                entity = entity,
                offset = vector3(0.0, 0.0, 0.2),
                label = "Banking",
                distance  = 6.0,
                interactDst = 2.0, -- optional
                ignoreLos = true, -- optional
                options = {
                    label = Locales["target_label_open_bank"],
                    action = function(entity)
                        DoProgress(true)
                    end,
                }
            })
        else
            local TargetName = "qb-target"
            if Config.Framework == "esx" then
                TargetName = "qtarget"
            end
            exports[TargetName]:AddTargetEntity(entity, { 
                options = { 
                    { 
                        type = "client", 
                        icon = 'fas fa-building-columns',
                        label = Locales["target_label_open_bank"],
                        action = function(entity)
                            DoProgress(true)
                        end,
                    }
                },
                distance = 2.5, 
            })
        end
        return entity
    end
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local pos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Locations) do
                if #(pos - vector3(v.ped.x, v.ped.y, v.ped.z)) < 50.0 then
                    if spawnedEntity[k] == nil or not DoesEntityExist(spawnedEntity[k]) then
                        spawnedEntity[k] = SpawnPed(v)
                    end
                else
                    if spawnedEntity[k] ~= nil and DoesEntityExist(spawnedEntity[k]) then
                        DeleteEntity(spawnedEntity[k])
                    end
                end
            end
        end
    end)

    if Config.Interact and GetResourceState("interact") == "started" then
        for k, v in pairs(Config.ATMModels) do
            exports.interact:AddModelInteraction({
                model = k,
                offset = v,
                distance = 4.0, -- optional
                interactDst = 1.0, -- optional
                ignoreLos = true, -- optional
                options = {
                    {
                        label = 'ATM',
                        action = function(entity)
                            DoProgress(false, GetEntityCoords(entity))
                        end,
                    },
                }
            })
        end
    else
        local atmmodels = {} 
        for k, v in pairs(Config.ATMModels) do
            table.insert(atmmodels, k)
        end
        local TargetName = "qb-target"
        if Config.Framework == "esx" then
            TargetName = "qtarget"
        end
        exports[TargetName]:AddTargetModel(atmmodels, {
            options = {
                {
                    type = "client",
                    icon = "fas fa-money-bill",
                    label = Locales["target_label_open_atm"],
                    action = function(entity)
                        DoProgress(false, GetEntityCoords(entity))
                    end,
                }
            },
            distance = 1.5
        })
    
        for k, v in pairs(ATMLocations) do
            local TargetName = "qb-target"
            if Config.Framework == "esx" then
                TargetName = "qtarget"
            end
            exports[TargetName]:AddBoxZone("snipe_bank_atm_" .. k, v, 1, 1, {
                name = "snipe_bank_atm_" .. k,
                debugPoly = false,
                heading = -20,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            }, {
                options = {
                    {
                        type = "client",
                        icon = "fas fa-money-bill",
                        label = Locales["target_label_open_atm"],
                        action = function(entity)
                            DoProgress(false, v)
                        end,
                    }
                },
                distance = 1.5
            })
        end
    end
end
