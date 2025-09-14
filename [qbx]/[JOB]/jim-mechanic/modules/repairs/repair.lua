--==========================================================
-- Repair
--==========================================================
local repairing, prevVehicle = false, nil
MechanicTools = {}

-- If no job requirement or if repairs are free, then no stash usage
if not Config.Main.ItemRequiresJob or Config.Repairs.FreeRepair then
    Config.Repairs.StashRepair = false
end

MechanicTools.Menu = function(skip)
    local Ped = PlayerPedId()

    if skip and skip ~= true then
        skip = nil
    end

    if not Helper.enforceSectionRestricton("repairs") then
        return
    end

    if repairing then
        return
    end

    Helper.removePropHoldCoolDown()

    if type(skip) ~= "boolean" then
        if not Helper.haveCorrectItemJob() then
            return
        end
        if not Helper.canWorkHere() then
            return
        end
    end

    if not Helper.isInCar() then
        return
    end

    if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then
        return
    end

    local vehicle = nil
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
        lookEnt(vehicle)
    end

    if vehicle == nil then
        -- This shouldn't happen, but adding just incase
        triggerNotify(nil, locale("repairActions", "noVehicleNearby"), "error")
        return
    end

    if not Helper.enforceClassRestriction(searchCar(vehicle).class) then
        return
    end
    if Helper.isVehicleLocked(vehicle) then
        return
    end

    local stashItems = {}
    local plate = Helper.getTrimmedPlate(vehicle)
    if Helper.isCarParked(plate) then
        triggerNotify(nil, "Vehicle is hard parked", "error")
        return
    end

    ExtraDamageComponents.getVehicleStatus(vehicle)
    local damageTable = VehicleStatus[plate]
    jsonPrint(damageTable)

    damageTable["wheels"] = 0
    damageTable["engine"] = (GetVehicleEngineHealth(vehicle) / 10)
    damageTable["body"]   = (GetVehicleBodyHealth(vehicle) / 10)

    local num_wheels  = GetVehicleNumberOfWheels(vehicle)
    local low_health  = 0
    local burst_tires = 0

    -- Count wheel health
    for i = 0, num_wheels - 1 do
        local health = GetVehicleWheelHealth(vehicle, i)
        if health < 100.0 then
            low_health = low_health + 1
        end
    end

    -- Count burst tires
    for _, v in pairs({0,1,2,3,4,5,45,47}) do
        local tire_burst = IsVehicleTyreBurst(vehicle, v, 0)
        if tire_burst == 1 then
            burst_tires += 1
        end
    end

    local needs_repair = low_health + burst_tires
    if needs_repair > num_wheels then
        needs_repair = num_wheels
    end
    damageTable["wheels"] = needs_repair

    local costTable = {
        ["engine"] = { ["cost"] = {} },
        ["body"]   = { ["cost"] = {} },
        ["oil"]    = { ["cost"] = {} },
        ["axle"]   = { ["cost"] = {} },
        ["spark"]  = { ["cost"] = {} },
        ["battery"]= { ["cost"] = {} },
        ["fuel"]   = { ["cost"] = {} },
    }

    if type(skip) ~= "boolean" then
        if not Config.Repairs.FreeRepair then
            for k in pairs(costTable) do
                if not Config.Repairs.Parts[k][1] then
                    Config.Repairs.Parts[k] = { Config.Repairs.Parts[k] }
                end
                local text = ""
                for i = 1, #Config.Repairs.Parts[k] do
                    local v    = Config.Repairs.Parts[k][i]
                    local cost = 0

                    if k == "engine" or k == "body" then
                        cost = v.cost - math.floor(v.cost * math.floor(damageTable[k] + 0.5) / 100)
                    else
                        if Config.Repairs.ExtraDamages == true then
                            cost = (
                                v.cost
                                - math.floor(v.cost * math.floor((damageTable[k] + 0.5) or 90) / 100)
                            ) or 0
                            cost = cost or 0
                        end
                    end

                    if cost > 0 then
                        local partLabel = Items[v.part] and Items[v.part].label or v.part
                        local indicator = checkStashItem(repairStashName, { [v.part] = cost }) and "" or " ❌"
                        text = (
                            (text == "" and locale("repairActions", "costLabel")..": "..br or text)
                            .."[ x"..cost.." ] - "
                            .." "
                            ..partLabel
                            ..indicator
                            ..br
                        )
                    end

                    costTable[k]["cost"][v.part] = cost
                end
                costTable[k].txt = text
            end
        end
    end

    local RepairMenu = {}
    local headertxt  = locale("checkDetails", "plateLabel")..": "
       .." ["
       ..plate
       .."]"
       ..br
       ..(isOx() and br or "")
       ..Helper.getMilageString(plate)

    local usingStash = Config.Repairs.StashRepair and repairStashName ~= ""

    RepairMenu[#RepairMenu+1] = {
        icon = usingStash and "fas fa-boxes-stacked" or "fas fa-person",
        header = locale("repairActions", "matSource")..(usingStash and locale("repairActions", "sourceJob") or locale("repairActions", "sourcePlayer")),
        disabled = true,
    }

    local mechjobTable = {}

    -- Wheels
    if not Config.Repairs.RepairWheelsWithEngine
       and not Config.Repairs.RepairWheelsWithBody
       and (damageTable["wheels"] or 0) >= 1
    then
        costTable["wheels"] = { ["cost"] = {} }
        costTable["wheels"]["cost"][Config.Repairs.Parts["wheels"].part] = damageTable["wheels"]
        mechjobTable[#mechjobTable + 1] = {
            part   = "wheels",
            amount = damageTable["wheels"],
            header = locale("repairActions", "tires"),
            icon   = "fas fa-compact-disc"
        }
    end

    mechjobTable[#mechjobTable + 1] = { part = "engine", header = locale("checkDetails", "engineLabel"),    icon = "fas fa-wrench" }
    mechjobTable[#mechjobTable + 1] = { part = "body",   header = locale("repairActions", "bodyLabel"),     icon = "fas fa-car-side" }

    if Config.Repairs.ExtraDamages == true and not IsThisModelABicycle(GetEntityModel(vehicle)) then
        mechjobTable[#mechjobTable + 1] = { part = "oil",     header = locale("repairActions", "oilLevelLabel"),        icon = "fas fa-oil-can" }
        mechjobTable[#mechjobTable + 1] = { part = "axle",    header = locale("repairActions", "driveshaftLabel"),      icon = "fas fa-toolbox" }
        mechjobTable[#mechjobTable + 1] = { part = "spark",   header = locale("repairActions", "sparkPlugs"),           icon = "fas fa-wand-magic-sparkles" }
        mechjobTable[#mechjobTable + 1] = { part = "battery", header = locale("repairActions", "carBattery"),           icon = "fas fa-car-battery" }
        mechjobTable[#mechjobTable + 1] = { part = "fuel",    header = locale("repairActions", "fuelTank"),             icon = "fas fa-gas-pump" }
    end

    for _, v in pairs(mechjobTable) do
        local headerlock = false
        if math.floor(damageTable[v.part] + 0.5) >= 100 then
            headerlock = true
        end
        if ((Config.Repairs.StashRepair and repairStashName ~= "") or Config.Repairs.FreeRepair) and not skip then
            if Config.Repairs.StashRepair and repairStashName ~= "" then
                headerlock = not checkStashItem(repairStashName, costTable[v.part].cost)
                if math.floor(damageTable[v.part] + 0.5) >= 100 then
                    damageTable[v.part] = 100
                    headerlock = true
                    costTable[v.part].txt = ""
                end
            end
        else
            if (not skip) and not hasItem(costTable[v.part].cost) then
                headerlock = true
            end
        end

        RepairMenu[#RepairMenu + 1] = {
            arrow       = (isOx() and not headerlock),
            icon        = v.icon,
            isMenuHeader= (headerlock or type(skip) == "boolean"),
            header      = v.header.." - "..math.floor((damageTable[v.part] + 0.5)).."%",
            txt         = costTable[v.part].txt,
            onSelect    = function()
                MechanicTools.ConfirmRepair({
                        part        = v.part,
                        partname    = v.header,
                        vehicle     = vehicle,
                        cost        = costTable[v.part].cost,
                        damageTable = damageTable
                    }
                )
            end,
            progress    = damageTable[v.part],
            colorScheme = Config.System.Menu == "ox" and (damageTable[v.part] and (damageTable[v.part] > 80)) and "green.5" or ((damageTable[v.part] and (damageTable[v.part] < 30)) and "red.8" or "yellow.8") or nil,
            progressColor = Config.System.Menu == "lation" and (damageTable[v.part] and (damageTable[v.part] > 80)) and "#1EA622" or ((damageTable[v.part] and (damageTable[v.part] < 30)) and "#6b0a1c" or "#ba861e") or nil,

        }

        -- If wheels
        if v.part == "wheels" then
            RepairMenu[#RepairMenu].progress = nil
            RepairMenu[#RepairMenu].header   = locale("repairActions", "replaceTires")

            if not Config.Repairs.FreeRepair then
                local tireAmount = damageTable["wheels"]
                local tireLabel = Items["sparetire"] and Items["sparetire"].label or "sparetire"
                local has = checkStashItem(repairStashName, { ["sparetire"] = tireAmount })
                local indicator = has and "" or " ❌"

                RepairMenu[#RepairMenu].txt = locale("repairActions", "costLabel")..": "
                    ..tireAmount.." "
                    ..tireLabel
                    ..indicator
            end
        end
    end

    if DoesEntityExist(vehicle) then
        if prevVehicle == vehicle then
            Helper.propHoldCoolDown("clipboard")
            openMenu(RepairMenu, {
                header    = searchCar(vehicle).name,
                headertxt = headertxt,
                canClose  = true,
                onExit    = function() end
            })
        else
            -- Checking engine + body
            if Config.Overrides.DoorAnimations then
                for i = 0, 5 do
                    SetVehicleDoorOpen(vehicle, i, false, false)
                    CreateThread(function()
                        Wait(15000)
                        SetVehicleDoorShut(vehicle, i, true)
                    end)
                end
            end

            local above = isVehicleLift(vehicle)
            if progressBar({
                label = locale("repairActions", "checkingEngineDamage"),
                time  = math.random(6000, 12000),
                anim  = above and "idle_b" or "fixing_a_ped",
                dict  = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
                flag  = above and 1 or 16,
                icon  = "mechanic_tools"
            }) then
                if progressBar({
                    label = locale("repairActions", "checkingBodyDamage"),
                    time  = math.random(6000, 12000),
                    anim  = above and "idle_b" or "machinic_loop_mechandplayer",
                    dict  = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    icon  = "mechanic_tools"
                }) then

                    if Config.BreakTool.MechanicTool then
                        breakTool({ item = "mechanic_tools", damage = math.random(0,1) })
                    end

                    prevVehicle = vehicle
                    Helper.propHoldCoolDown("clipboard")

                    if Config.Overrides.DoorAnimations then
                        for i = 0, 5 do
                            SetVehicleDoorShut(vehicle, i, true)
                        end
                    end

                    openMenu(RepairMenu, {
                        header    = searchCar(vehicle).name,
                        headertxt = headertxt,
                        canClose  = true,
                        onExit    = function()
                            Helper.removePropHoldCoolDown()
                        end,
                    })

                else
                    return
                end
            else
                return
            end
        end
    end
end

RegisterNetEvent(getScript()..":client:Repair:Check", function(skip) MechanicTools.Menu(skip) end)

MechanicTools.ConfirmRepair = function(data)
    local Ped    = PlayerPedId()
    local coords = GetEntityCoords(Ped)
    local RepairMenu = {}

    if not Helper.isInCar() then
        return
    end

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
    end
    local plate = Helper.getTrimmedPlate(vehicle)
    if Helper.isVehicleLocked(vehicle) then
        return
    end

    if DoesEntityExist(vehicle) then
        local headertxt = locale("checkDetails", "plateLabel")..": "
           .." ["
           ..plate
           .."]"
           ..br
           ..(isOx() and br or "")
           ..Helper.getMilageString(plate)

        RepairMenu[#RepairMenu + 1] = {
            header      = locale("repairActions", "repairPrompt").." "..data.partname.."?",
            isMenuHeader= true,
        }

        RepairMenu[#RepairMenu + 1] = {
            icon     = "fas fa-circle-check",
            txt      = locale("checkDetails", "yesLabel"),
            onSelect = function()
                MechanicTools.Apply(data)
            end,
        }

        RepairMenu[#RepairMenu + 1] = {
            icon     = "fas fa-circle-xmark",
            txt      = locale("checkDetails", "noLabel"),
            onSelect = function()
                MechanicTools.Menu()
            end,
        }

        openMenu(RepairMenu, {
            header    = searchCar(vehicle).name,
            headertxt = headertxt,
        })
    end
end

MechanicTools.Apply = function(data)
    local Ped        = PlayerPedId()
    Helper.removePropHoldCoolDown()

    local stashName  = repairStashName
    local stashItems = {}
    local damageTime = 0
    local vehicle    = nil
    local above      = isVehicleLift(vehicle)

    if not repairing then
        repairing = true
    else
        return
    end

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end

    local getoff   = {}
    local bartext  = locale("repairActions", "actionRepairing")
    local cam      = nil
    local currentFuel = GetVehicleFuelLevel(vehicle)

    local repairTable = {
        ["engine"]  = { dict = "amb@world_human_vehicle_mechanic@male@base", anim = "base", flags = 1 },
        ["body"]    = { propCooldown = "weld" },
        ["oil"]     = { propCooldown = "oil", bartext = locale("repairActions", "actionChanging") },
        ["axle"]    = { dict = "amb@world_human_vehicle_mechanic@male@base", anim = "base", flags = 1 },
        ["spark"]   = { dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 1, bartext = locale("repairActions", "actionChanging") },
        ["battery"] = { dict = "amb@world_human_vehicle_mechanic@male@base", anim = "base", flags = 1, bartext = locale("repairActions", "actionChanging") },
        ["fuel"]    = { dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 1 },
        ["wheels"]  = { dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", bartext = locale("repairActions", "actionChanging"):gsub("%:", "") },
    }

    -- If vehicle is on a lift
    if isVehicleLift(vehicle) then
        for k in pairs(repairTable) do
            repairTable[k].task  = nil
            repairTable[k].dict  = "amb@prop_human_movie_bulb@idle_a"
            repairTable[k].anim  = "idle_b"
            repairTable[k].flags = 32
        end
    end

    -- If ped is not mp_m/f_freemode model, remove dict/anim
    if GetEntityModel(Ped) ~= `mp_f_freemode_01` and GetEntityModel(Ped) ~= `mp_m_freemode_01` then
        for k in pairs(repairTable) do
            repairTable[k].task  = nil
            repairTable[k].dict  = nil
            repairTable[k].anim  = nil
            repairTable[k].flags = nil
        end
    end

    -- Determine cameras and animations based on part
    if data.part == "engine" then
        cam = createTempCam(Ped, GetEntityCoords(vehicle))
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorOpen(vehicle, 4, false, true)
        end
        if #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine"))) >= 1.5 then
            TaskGoStraightToCoord(
                Ped,
                GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")),
                1.0,
                -1,
                GetEntityHeading(Ped),
                0
            )
            Wait(600)
        end
        Helper.lookAtEngine(vehicle)
        Wait(100)
        SetEntityHeading(Ped, GetEntityHeading(Ped) - 180.0)

    elseif data.part == "body" then
        cam = createTempCam(Ped, GetEntityCoords(vehicle))
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorOpen(vehicle, 4, false, true)
        end

    elseif data.part == "oil" then
        cam = createTempCam(Ped, GetEntityCoords(vehicle))
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorOpen(vehicle, 4, false, true)
        end
        if #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine"))) >= 1.5 then
            TaskGoStraightToCoord(
                Ped,
                GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")),
                1.0,
                -1,
                GetEntityHeading(Ped),
                0
            )
            Wait(600)
        end
        Helper.lookAtEngine(vehicle)
        lookEnt(GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")))

    elseif data.part == "wheels" then
        cam = createTempCam(Ped, GetEntityCoords(vehicle))
        local coord = nil
        for _, v in pairs({
            "wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1",
            "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3",
            "wheel_lr", "wheel_rr"
        }) do
            if #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))) <= 1.5 then
                coord = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))
                break
            end
        end
        lookEnt(coord)

    elseif data.part == "battery" then
        cam = createTempCam(Ped, GetEntityCoords(vehicle))
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorOpen(vehicle, 4, false, true)
        end
        if #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine"))) >= 1.5 then
            TaskGoStraightToCoord(
                Ped,
                GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")),
                1.0,
                -1,
                GetEntityHeading(Ped),
                0
            )
            Wait(600)
        end
        lookEnt(GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")))
        Wait(100)
        SetEntityHeading(Ped, GetEntityHeading(Ped) - 180.0)

    elseif data.part == "axle" then
        cam = createTempCam(Ped, GetEntityCoords(vehicle))
        local coord = nil
        for _, v in pairs({
            "wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1",
            "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3",
            "wheel_lr", "wheel_rr"
        }) do
            if #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))) <= 1.5 then
                coord = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))
                break
            end
        end
        lookEnt(coord)
        Wait(100)
        SetEntityHeading(Ped, GetEntityHeading(PlayerPedId()) - 180.0)

    else
        -- By default, just do a basic camera + look
        cam = createTempCam(Ped, GetEntityCoords(vehicle))
        lookEnt(vehicle)
    end

    -- If we have a certain damage % for that part, scale time
    if data.damageTable[data.part] then
        damageTime = math.ceil(
            16000 - ((data.damageTable[data.part] - 0) / (100 - 0)) * (16000 - 8000)
        )
    end

    if (Config.Repairs.StashRepair and (stashName ~= "" and checkStashItem(stashName, data.cost)))
       or not Config.Repairs.StashRepair or stashName == ""
    then
        if repairTable[data.part].propCooldown then
            Helper.propHoldCoolDown(repairTable[data.part].propCooldown, true)
        else
            if repairTable[data.part].dict then
                playAnim(
                    repairTable[data.part].dict,
                    repairTable[data.part].anim,
                    -1,
                    repairTable[data.part].flags
                )
            end
        end


        if not Config.SkillChecks.repairs or skillCheck() then
            if progressBar({
                label = (repairTable[data.part].bartext or bartext).." "..data.partname,
                time  = math.random(15000, 20000) + damageTime,
                cancel= true,
                icon  = "mechanic_tools",
                cam   = cam
            }) then
                repairing = false

                -- Handling each part
                if data.part == "body" then
                    local tirehealth = {}
                    local enhealth   = GetVehicleEngineHealth(vehicle)

                    for _, v in pairs({0,1,2,3,4,5,45,47}) do
                        tirehealth[v] = { health = GetVehicleWheelHealth(vehicle, v) }
                        if IsVehicleTyreBurst(vehicle, v, false) == 1 or IsVehicleTyreBurst(vehicle, v, true) == 1 then
                            tirehealth[v].defalte = IsVehicleTyreBurst(vehicle, v, false)
                            tirehealth[v].rim     = IsVehicleTyreBurst(vehicle, v, true)
                        end
                    end

                    SetVehicleBodyHealth(vehicle, 1000.0)
                    SetVehicleFixed(vehicle)
                    SetVehicleDeformationFixed(vehicle)

                    if isStarted("qs-advancedgarages") then
                        exports["qs-advancedgarages"]:RepairNearestVehicle()
                    end
                    if isStarted("VehicleDeformation") then
                        exports["VehicleDeformation"]:FixVehicleDeformation(vehicle)
                    end

                    SetVehicleEngineHealth(vehicle, enhealth)

                    if Config.Repairs.RepairWheelsWithBody then
                        for _, v in pairs({0,1,2,3,4,5,45,47}) do
                            if getoff[v] then
                                SetVehicleWheelXOffset(vehicle, v, getoff[v])
                            end
                            SetVehicleWheelHealth(vehicle, v, 1000.0)
                            SetVehicleTyreFixed(vehicle, v)
                        end
                    else
                        for _, v in pairs({0,1,2,3,4,5,45,47}) do
                            SetVehicleWheelHealth(vehicle, v, tirehealth[v].health)
                            if tirehealth[v].defalte == 1 then
                                SetVehicleTyreBurst(vehicle, v, 0, tirehealth[v].health)
                            elseif tirehealth[v].rim == 1 then
                                SetVehicleTyreBurst(vehicle, v, 1, 0.0)
                            end
                        end
                    end

                elseif data.part == "engine" then
                    SetVehicleEngineHealth(vehicle, 1000.0)
                    SetVehiclePetrolTankHealth(vehicle, 1000.0)
                    SetVehicleOilLevel(vehicle, 1000.0)
                    SetVehicleUndriveable(vehicle, false)

                    if Config.Repairs.RepairWheelsWithEngine then
                        for _, v in pairs({0,1,2,3,4,5,45,47}) do
                            if getoff[v] then
                                SetVehicleWheelXOffset(vehicle, v, getoff[v])
                            end
                            SetVehicleWheelHealth(vehicle, v, 1000.0)
                            SetVehicleTyreFixed(vehicle, v)
                        end
                    end

                elseif data.part == "wheels" then
                    for _, v in pairs({0,1,2,3,4,5,45,47}) do
                        if getoff[v] then
                            SetVehicleWheelXOffset(vehicle, v, getoff[v])
                        end
                        SetVehicleWheelHealth(vehicle, v, 1000.0)
                        SetVehicleTyreFixed(vehicle, v)
                    end
                    TriggerEvent("kq_wheeldamage:fixCar", vehicle)

                elseif data.part ~= "engine"
                and data.part ~= "body"
                and data.part ~= "wheels"
                then
                    -- For oil, axle, spark, battery, fuel
                    ExtraDamageComponents.setVehicleStatus(vehicle, data.part, 100)
                end

                Helper.addCarToUpdateLoop(vehicle)

                -- Stash or item cost deduction
                if Config.Repairs.StashRepair and stashName ~= "" then
                    TriggerServerEvent(getScript()..":server:stashRemoveItem", stashItems, stashName, data.cost)
                end

                if (stashName == "" or not Config.Repairs.StashRepair) and not Config.Repairs.FreeRepair then
                    for k, v in pairs(data.cost) do
                        removeItem(k, v)
                    end
                end

                triggerNotify(nil, data.partname.." "..locale("repairActions", "repairedMsg"), "success")
                Wait(250)
                MechanicTools.Menu()

            else
                repairing = false
                triggerNotify(nil, data.partname..locale("repairActions", "repairCancelled"), "error")
            end
        else
            repairing = false
        end
        Helper.removePropHoldCoolDown()
        if Config.Overrides.DoorAnimations then
            for i = 0, 5 do
                SetVehicleDoorShut(vehicle, i, false, true)
                Wait(200)
            end
        end

    else
        triggerNotify(nil, locale("repairActions", "noMaterialsInSafe"), "error")
        repairing = false
        return
    end
    pushVehicle(vehicle)
    SetVehicleFuelLevel(vehicle, currentFuel)
end