EmergencyBench = {}
--===================================================================
-- Create Bench Targets for Emergency Locations
--===================================================================
onPlayerLoaded(function()
    for k, v in pairs(Config.Emergency.Locations) do
        if v.prop then
            makeDistProp({ prop="gr_prop_gr_bench_03a", coords=vec4(v.coords.x, v.coords.y, v.coords.z-1.37, v.coords.a)}, 1, 0)
            local width, depth, height = GetPropDimensions(`gr_prop_gr_bench_03a`)
            createBoxTarget({
                "bench"..k,
                vec3(v.coords.x, v.coords.y, v.coords.z-1.03),
                width + 0.1,
                depth + 0.1,
                {
                    name      = "bench"..k,
                    heading   = v.coords.w - 90.0,
                    debugPoly = debugMode,
                    minZ      = v.coords.z - ((height + 0.05) / 2),
                    maxZ      = v.coords.z + ((height + 0.05) / 2),
                }
            },
            {
                {
                    action = function()
                        EmergencyBench.Menu()
                    end,
                    icon   = "fas fa-cogs",
                    label  = locale("policeMenu", "useRepairStation"),
                    job    = Config.Emergency.Jobs,
                }
            }, 5.0)
        else
            createBoxTarget({
                "bench"..k,
                vec3(v.coords.x, v.coords.y, v.coords.z-1),
                1.2,
                4.2,
                {
                    name      = "bench"..k,
                    heading   = v.coords.a,
                    debugPoly = debugMode,
                    minZ      = v.coords.z-1,
                    maxZ      = v.coords.z+1.4,
                },
            },
            {
                {
                    action = function()
                        EmergencyBench.Menu()
                    end,
                    icon   = "fas fa-cogs",
                    label  = locale("policeMenu", "useRepairStation"),
                    job    = Config.Emergency.Jobs,
                },
            }, 5.0)
        end
    end
end, true)

--===================================================================
-- Main Emergency Check
--===================================================================
EmergencyBench.Menu = function()
    local Menu, vehicle
    local Ped    = PlayerPedId()
    local coords = GetEntityCoords(Ped)
    Menu = {}

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
        pushVehicle(vehicle)
    end
    local plate = Helper.getTrimmedPlate(vehicle)
    carMeta = {
        ["search"] = searchCar(vehicle).name,
        ["class"]  = searchCar(vehicle).class,
        ["plate"]  = plate,
        ["price"]  = searchCar(vehicle).price,
        ["dist"]   = Helper.getMilageString(plate),
    }

    local model = GetEntityModel(vehicle)
    local isBoat = IsThisModelABoat(model)

    local possMods = not IsThisModelABoat(model) and Helper.checkHSWMods(vehicle) or {}
    ExtraDamageComponents.getVehicleStatus(vehicle)

    -- Restrict to Emergency Class only if configured
    if Config.Emergency.LockEmergency then
        if carMeta.class ~= "Emergency" then
            triggerNotify(nil, locale("policeMenu", "emergencyOnly"), "error")
            return
        end
    end

    if DoesEntityExist(vehicle) then
        -- Debug: Force damage if debugMode is on
        if debugMode then
            Menu[#Menu+1] = {
                icon   = "fas fa-bug",
                header = "Vehicle Death (Debug)",
                onSelect = function()
                    EmergencyBench.DebugDamage()
                end,
            }
        end

        -- Manual Repairs option if not restricted
        local hideRepair = false
        if Config.Emergency.requireDutyCheck then
            hideRepair = triggerCallback(getScript()..":callback:mechCheck")
        end
        if hideRepair ~= true then
            if Config.Emergency.CosmeticTable["Repair"] then
                Menu[#Menu+1] = {
                    icon   = "fas fa-wrench",
                    header = locale("policeMenu", "repairOption"),
                    onSelect = function()
                        EmergencyBench.Repair()
                    end,
                }
            end
        end

        -- Paints
        if Config.Emergency.CosmeticTable["Paints"] then
            Menu[#Menu+1] = {
                arrow   = true,
                icon    = "fas fa-paint-roller",
                header  = locale("paintOptions", "menuHeader"),
                onSelect= function()
                    EmergencyBench.PaintMenu()
                end,
            }
        end

        if not isBoat then
            -- Performance Mods (Engine, Brakes, Suspension, Transmission, Armour, Turbo)
            if Config.Emergency.PreformaceTable["Engine"] then
                local id = 11
                local installed = (GetVehicleMod(vehicle, id) + 1 ~= 0) and "LVL "..(GetVehicleMod(vehicle, id)+1) or locale("common", "stockLabel")
                Menu[#Menu+1] = {
                    arrow = true,
                    header= locale("checkDetails", "engineLabel"),
                    txt   = "("..(possMods[id]+1)..") "..locale("common", "menuInstalledText")..": "..installed,
                    onSelect = function()
                        EmergencyBench.ChooseMod({ perform=true, id=id, header=locale("checkDetails", "engineLabel") }, possMods)
                    end,
                }
            end
            if Config.Emergency.PreformaceTable["Brakes"] then
                local label = locale("checkDetails", "brakesLabel")
                local id    = 12
                local installed = (GetVehicleMod(vehicle, id)+1 ~= 0) and "LVL "..(GetVehicleMod(vehicle, id)+1) or locale("common", "stockLabel")
                Menu[#Menu+1] = {
                    arrow = true,
                    header= label,
                    txt   = "("..(possMods[id]+1)..") "..locale("common", "menuInstalledText")..": "..installed,
                    onSelect = function()
                        EmergencyBench.ChooseMod({ perform=true, id=id, header=label }, possMods)
                    end,
                }
            end
            if Config.Emergency.PreformaceTable["Suspension"] then
                local label = locale("checkDetails", "suspensionLabel")
                local id    = 15
                if GetNumVehicleMods(vehicle, id) ~= 0 then
                    local installed = (GetVehicleMod(vehicle, id)+1 ~= 0) and ("LVL "..(GetVehicleMod(vehicle, id)+1)) or locale("common", "stockLabel")
                    Menu[#Menu+1] = {
                        arrow = true,
                        header= label,
                        txt   = "("..(possMods[id]+1)..") "..locale("common", "menuInstalledText")..": "..installed,
                        onSelect = function()
                            EmergencyBench.ChooseMod({ perform=true, id=id, header=label }, possMods)
                        end,
                    }
                end
            end
            if Config.Emergency.PreformaceTable["Transmission"] then
                local label = locale("checkDetails", "transmissionLabel")
                local id    = 13
                if GetNumVehicleMods(vehicle, id) ~= 0 then
                    local installed = (GetVehicleMod(vehicle, id)+1 ~= 0) and ("LVL "..(GetVehicleMod(vehicle, id)+1)) or locale("common", "stockLabel")
                    Menu[#Menu+1] = {
                        arrow   = true,
                        header  = label,
                        txt     = "("..(possMods[id]+1)..") "..locale("common", "menuInstalledText")..": "..installed,
                        onSelect= function()
                            EmergencyBench.ChooseMod({ perform=true, id=id, header=label }, possMods)
                        end,
                    }
                end
            end
            if Config.Emergency.PreformaceTable["Armour"] then
                local label = locale("checkDetails", "armorLabel")
                local id    = 16
                if GetNumVehicleMods(vehicle, id) ~= 0 then
                    local installed = locale("common", "stockLabel")
                    if GetVehicleMod(vehicle, id) > -1 then
                        installed = locale("common", "installedMsg"):gsub("!", "")
                    end
                    Menu[#Menu+1] = {
                        arrow = true,
                        header= label,
                        txt   = installed,
                        onSelect = function()
                            EmergencyBench.Toggles({ id=id, header=label })
                        end,
                    }
                end
            end
            if Config.Emergency.PreformaceTable["Turbo"] then
                local label = locale("checkDetails", "turboLabel")
                local id    = 18
                local installed = locale("common", "stockLabel")
                if IsToggleModOn(vehicle, id) then
                    installed = locale("common", "installedMsg"):gsub("!", "")
                end
                Menu[#Menu+1] = {
                    arrow   = true,
                    header  = label,
                    txt     = installed,
                    onSelect= function()
                        EmergencyBench.Toggles({ id=id, header=label })
                    end,
                }
            end
            if Config.Emergency.PreformaceTable["Harness"] and Config.Harness.HarnessControl then
                Menu[#Menu+1] = {
                    arrow = true,
                    header= locale("checkDetails", "harnessLabel"),
                    txt   = (VehicleStatus[carMeta.plate]["harness"] == 1)
                            and locale("common", "installedMsg"):gsub("!", "")
                            or locale("common", "notInstalled"),
                    onSelect = function()
                        triggerNotify(
                            nil,
                            (VehicleStatus[carMeta.plate]["harness"] == 1 and locale("common", "actionRemoving")..": " or locale("common", "actionInstalling")..": ")
                        ..locale("checkDetails", "harnessLabel"),
                            "mechanic"
                        )
                        ExtraDamageComponents.setVehicleStatus(vehicle, "harness", (VehicleStatus[carMeta.plate]["harness"] == 1) and 0 or 1)
                        Wait(100)
                        EmergencyBench.Menu()
                    end,
                }
            end

            -- Rims
            local cycle = IsThisModelABike(GetEntityModel(vehicle))
            if Config.Emergency.CosmeticTable["Rims"] then
                Menu[#Menu+1] = {
                    arrow   = true,
                    header  = locale("rimsMod", "menuHeader"),
                    txt     = (not cycle and (locale("common", "currentInstalled")..": "..br --..(isOx() and br or "")
                            ..((GetVehicleMod(vehicle, 23) == -1) and locale("common", "stockLabel")
                                or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23))))
                            .." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")") or ""),
                    onSelect= function()
                        EmergencyBench.RimsMenu()
                    end,
                }
            end
        end
        -- Generate the rest of the cosmetic menu
        for k, v in pairs(emergencyCosmeticTable) do
            -- Roof livery, old livery, custom plate, extra, window, horn logic
            if (v.roofLiv and GetVehicleRoofLiveryCount(vehicle) >= 1)
               or (v.oldLiv and GetVehicleLiveryCount(vehicle) >= 1)
               or v.plate
               or v.extra
               or v.window
               or v.horn
            then
                local txt, canDo, extraCount = "", true, 0

                if v.roofLiv then
                    txt = "("..(GetVehicleRoofLiveryCount(vehicle) - 1)..") "..locale("common", "menuInstalledText")..": "..GetVehicleRoofLivery(vehicle)
                end
                if v.oldLiv then
                    txt = "("..(GetVehicleLiveryCount(vehicle) - 1)..") "..locale("common", "menuInstalledText")..": "..GetVehicleLivery(vehicle)
                end
                if v.plate then
                    for _, b in pairs(Loc[Config.Lan].vehiclePlateOptions) do
                        if GetVehicleNumberPlateTextIndex(vehicle) == b.id then
                            txt = "("..GetNumberOfVehicleNumberPlates(vehicle)..") "..locale("common", "menuInstalledText")..": "..b.name
                            break
                        else
                            txt = "("..GetNumberOfVehicleNumberPlates(vehicle)..") "..locale("common", "menuInstalledText")..": "..locale("common", "stockLabel")
                        end
                    end
                end
                if v.horn then
                    for _, b in pairs(Loc[Config.Lan].vehicleHorns) do
                        if GetVehicleMod(vehicle, 14) == b.id then
                            txt = "("..(#Loc[Config.Lan].vehicleHorns)..") "..locale("common", "menuInstalledText")..": "..b.name
                            break
                        else
                            txt = "("..(#Loc[Config.Lan].vehicleHorns)..") "..locale("common", "menuInstalledText")..": "..locale("common", "stockLabel")
                        end
                    end
                end
                if v.extra then
                    for i = 0, 14 do
                        if DoesExtraExist(vehicle, i) then
                            canDo = true
                            extraCount = extraCount + 1
                        end
                    end
                    txt = "[ "..extraCount.." "..locale("checkDetails", "optionsLabel").." ]"
                    if extraCount == 0 then
                        canDo = false
                    end
                end

                if canDo then
                    Menu[#Menu+1] = {
                        arrow   = true,
                        header  = v.header,
                        txt     = txt,
                        onSelect= function()
                            EmergencyBench.ChooseMod(v, possMods)
                        end,
                    }
                end
            end

            -- Mods with standard IDs
            if v.enable and GetNumVehicleMods(vehicle, v.id) >= 1 then
                local installed = GetLabelText(GetModTextLabel(vehicle, v.id, GetVehicleMod(vehicle, v.id)))
                if installed == "NULL" then installed = locale("common", "stockLabel") end

                Menu[#Menu+1] = {
                    arrow   = true,
                    header  = v.header,
                    txt     = "("..(GetNumVehicleMods(vehicle, v.id) + 1)..") "..locale("common", "menuInstalledText")..": "..installed,
                    onSelect= function()
                        EmergencyBench.ChooseMod(v, possMods)
                    end,
                }
            end
        end

        -- Show menu if there are items
        if countTable(Menu) >= 1 then
            openMenu(Menu, {
                header    = carMeta.search,
                headertxt = locale("policeMenu", "header"),
                canClose  = true,
                onExit    = function() end,
            })
        else
            triggerNotify(nil, locale("common", "noOptionsAvailable"), "error")
        end
    end
end

--===================================================================
-- Debugging Damage Test
--===================================================================
EmergencyBench.DebugDamage = function(data)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    SetVehicleEngineHealth(vehicle, 40.0)
    SetVehicleBodyHealth(vehicle, 200.0)
    SetVehicleDirtLevel(vehicle, 14.5)
    SetVehicleFuelLevel(vehicle, 10.0)

    SetVehicleTyreBurst(vehicle, 0, true, 990.0)
    --BreakOffVehicleWheel(vehicle, 0, false, false, true, true)
    SetVehicleTyreBurst(vehicle, 1, false, 990.0)
    SetVehicleTyreBurst(vehicle, 2, true, 990.0)
    --BreakOffVehicleWheel(vehicle, 1, false, false, true, false)
    SetVehicleTyreBurst(vehicle, 3, false, 990.0)
    SetVehicleTyreBurst(vehicle, 4, true, 990.0)
    SetVehicleTyreBurst(vehicle, 5, false, 990.0)
    SetVehicleTyreBurst(vehicle, 45, true, 990.0)
    SetVehicleTyreBurst(vehicle, 47, false, 990.0)

    SetVehicleDoorBroken(vehicle, 1, true)
    SetVehicleDoorBroken(vehicle, 6, true)
    SetVehicleDoorBroken(vehicle, 4, true)

    SmashVehicleWindow(vehicle, 0)
    SmashVehicleWindow(vehicle, 1)
    SmashVehicleWindow(vehicle, 2)
    SmashVehicleWindow(vehicle, 3)
    SmashVehicleWindow(vehicle, 4)

    if Config.Repairs.ExtraDamages == true then
        local DamageComponents = { "oil", "axle", "battery", "fuel", "spark" }
        for _, name in pairs(DamageComponents) do
            ExtraDamageComponents.setVehicleStatus(vehicle, name, 20.0)
        end
    end
    --EmergencyBench.Menu()
    Helper.addCarToUpdateLoop(vehicle)
end