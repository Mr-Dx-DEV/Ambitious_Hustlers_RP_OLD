Toolbox = {}
Modify = {}

Toolbox.Menu = function(editable)
    if Config.BreakTool.ToolBox then
        breakTool({ item="toolbox", damage=math.random(2,3) })
    end

    local ped    = PlayerPedId()
    Helper.removePropHoldCoolDown()
    local coords = GetEntityCoords(ped)
    local vehicle= nil

    if not Helper.isAnyVehicleNear(coords) then return end
    if not Helper.isInCar() then return end

    if not IsPedInAnyVehicle(ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
    end

    if Helper.isVehicleLocked(vehicle) then return end
    if not DoesEntityExist(vehicle) then return end

    local possMods = Helper.checkHSWMods(vehicle)

    if editable then
        if not Helper.enforceSectionRestricton("perform") then return end
        if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end
        if not Helper.haveCorrectItemJob() then return end
        if not Helper.canWorkHere() then return end
    end

    local plate = Helper.getTrimmedPlate(vehicle)
    if Helper.isCarParked(plate) then
        triggerNotify(nil, "Vehicle is hard parked", "error")
        return
    end
    ExtraDamageComponents.getVehicleStatus(vehicle)

    local CheckMenu = {}
    local headertxt =
          locale("checkDetails", "plateLabel")..": "
          .." ["..plate.."]"
          ..br..(isOx() and br or "")
          ..locale("checkDetails", "valueLabel")
          ..cv(searchCar(vehicle).price)
          ..br..(isOx() and br or "")
          ..Helper.getMilageString(plate)

    local CheckTable = {
        ["nos"]         = { id=1,  lock=true, part="nos",          head=locale("checkDetails", "nitrousLabel")..": "..locale("common", "notInstalled"), hide = true },
        ["engine"]      = { id=2,  lock=true, part="engine",       desc=locale("common", "stockLabel")..": [LVL 0 / "..possMods[11].."]",  head=locale("checkDetails", "engineLabel"), hide = false },
        ["brakes"]      = { id=3,  lock=true, part="brakes",       desc=locale("common", "stockLabel")..": [LVL 0 / "..possMods[12].."]",  head=locale("checkDetails", "brakesLabel"), hide = false },
        ["suspension"]  = { id=4,  lock=true, part="suspension",   desc=locale("common", "stockLabel")..": [LVL 0 / "..possMods[15].."]",  head=locale("checkDetails", "suspensionLabel"), hide = false },
        ["transmission"]= { id=5,  lock=true, part="transmission", desc=locale("common", "stockLabel")..": [LVL 0 / "..possMods[13].."]",  head=locale("checkDetails", "transmissionLabel"), hide = false },
        ["car_armor"]   = { id=6,  lock=true, part="car_armor",    head=locale("checkDetails", "armorLabel")..": "..locale("common", "stockLabel"), hide = false },
        ["turbo"]       = { id=7,  lock=true, part="turbo",        head=locale("checkDetails", "turboLabel")..": "..locale("common", "notInstalled"), hide = false },
        ["headlights"]  = { id=8,  lock=true, part="headlights",   head=locale("checkDetails", "xenonLabel")..": "..locale("common", "notInstalled"), hide = true },
        ["drifttires"]  = { id=9,  lock=true, part="drifttires",   head=locale("checkDetails", "driftTyresLabel")..": "..locale("common", "notInstalled"), hide = true },
        ["bprooftires"] = { id=10, lock=true, part="bprooftires",  head=locale("checkDetails", "bulletproofTyresLabel")..": "..locale("common", "notInstalled"), hide = true },
        ["antilag"]     = { id=11, lock=true, part="antilag",      head=locale("checkDetails", "antilagLabel")..": ".." "..locale("common", "notInstalled"), hide = true },
        ["harness"]     = { id=12, lock=true, part="harness",      head=locale("checkDetails", "harnessLabel")..": "..locale("common", "notInstalled"), hide = true },
        ["manual"]      = { id=13, lock=true, part="manual",       head=Items["manual"].label.." "..locale("common", "notInstalled"), hide = true },
        ["underglow"]   = { id=14, lock=true, part="underglow",    head=Items["underglow"].label.." "..locale("common", "notInstalled"), hide = true },
    }

    -- NOS
    if VehicleNitrous[plate] and Config.NOS.enable and CheckTable["nos"] then
        CheckTable["nos"].lock   = false
        CheckTable["nos"].head   = locale("checkDetails", "nitrousLabel")..": "..math.floor(VehicleNitrous[plate].level).."%"
        CheckTable["nos"].icon   = invImg(CheckTable["nos"].part)
        CheckTable["nos"].progress = math.floor(VehicleNitrous[plate].level)
    end

    -- Engine
    if CheckTable["engine"] then
        if possMods[11] == 0 then
            CheckTable["engine"].head = locale("checkDetails", "engineLabel")
            CheckTable["engine"].desc = locale("checkDetails", "unavailable")
        else
            if GetVehicleMod(vehicle, 11) ~= -1 then
                local lvl = (GetVehicleMod(vehicle, 11) + 1)
                CheckTable["engine"].lock  = false
                CheckTable["engine"].desc  = Items[CheckTable["engine"].part..lvl].label..": [LVL "..lvl.." / "..possMods[11].."]"
                CheckTable["engine"].icon  = invImg(CheckTable["engine"].part..lvl)
            end
        end
    end

    -- Brakes
    if CheckTable["brakes"] then
        if possMods[12] == 0 then
            CheckTable["brakes"].head = locale("checkDetails", "brakesLabel")
            CheckTable["brakes"].desc = locale("checkDetails", "unavailable")
        else
            if GetVehicleMod(vehicle, 12) ~= -1 then
                local lvl = (GetVehicleMod(vehicle, 12) + 1)
                CheckTable["brakes"].lock = false
                CheckTable["brakes"].desc = Items[CheckTable["brakes"].part..lvl].label..": [LVL "..lvl.." / "..possMods[12].."]"
                CheckTable["brakes"].icon = invImg(CheckTable["brakes"].part..lvl)
            end
        end
    end

    -- Suspension
    if CheckTable["suspension"] then
        if possMods[15] == 0 then
            CheckTable["suspension"].head = locale("checkDetails", "suspensionLabel")
            CheckTable["suspension"].desc = locale("checkDetails", "unavailable")
        else
            if GetVehicleMod(vehicle, 15) ~= -1 then
                local lvl = (GetVehicleMod(vehicle, 15) + 1)
                CheckTable["suspension"].lock = false
                CheckTable["suspension"].desc = Items[CheckTable["suspension"].part..lvl].label..": [LVL "..lvl.." / "..possMods[15].."]"
                CheckTable["suspension"].icon = invImg(CheckTable["suspension"].part..lvl)
            end
        end
    end

    -- Transmission
    if CheckTable["transmission"] then
        if possMods[13] == 0 then
            CheckTable["transmission"].head = locale("checkDetails", "transmissionLabel")
            CheckTable["transmission"].desc = locale("checkDetails", "unavailable")
        else
            if GetVehicleMod(vehicle, 13) ~= -1 then
                local lvl = (GetVehicleMod(vehicle, 13) + 1)
                CheckTable["transmission"].lock = false
                CheckTable["transmission"].desc = Items[CheckTable["transmission"].part..lvl].label.." [LVL "..lvl.." / "..possMods[13].."]"
                CheckTable["transmission"].icon = invImg(CheckTable["transmission"].part..lvl)
            end
        end
    end

    -- Armor
    if CheckTable["car_armor"] then
        if GetNumVehicleMods(vehicle, 16) == 0 then
            CheckTable["car_armor"].head = locale("checkDetails", "armorLabel")
            CheckTable["car_armor"].desc = locale("checkDetails", "unavailable")
        else
            if (GetVehicleMod(vehicle, 16) + 1) == GetNumVehicleMods(vehicle, 16) then
                CheckTable["car_armor"].lock = false
                CheckTable["car_armor"].head = locale("checkDetails", "armorLabel")..":"
                CheckTable["car_armor"].desc = locale("common", "installedMsg"):gsub("!", "")
                CheckTable["car_armor"].icon = invImg(CheckTable["car_armor"].part)
            end
        end
    end

    -- Turbo
    if CheckTable["turbo"] then
        if not IsToggleModOn(vehicle, 18) and GetNumVehicleMods(vehicle, 11) ~= 0 then
            -- do nothing
        elseif IsToggleModOn(vehicle, 18) then
            CheckTable["turbo"].lock = false
            CheckTable["turbo"].head = locale("checkDetails", "turboLabel")..":"
            CheckTable["turbo"].desc = locale("common", "installedMsg"):gsub("!", "")
            CheckTable["turbo"].icon = invImg(CheckTable["turbo"].part)
        elseif GetNumVehicleMods(vehicle,11) == 0 then
            CheckTable["turbo"].desc = locale("checkDetails", "unavailable")
        end
    end

    -- Xenons
    if CheckTable["headlights"] then
        local _, r, g, b = GetVehicleXenonLightsCustomColor(vehicle)
        if not IsToggleModOn(vehicle, 22) and GetNumVehicleMods(vehicle,11) ~= 0 then
            -- do nothing
        elseif IsToggleModOn(vehicle, 22) then
            CheckTable["headlights"].lock = false
            CheckTable["headlights"].head = locale("checkDetails", "xenonLabel")..":"
            CheckTable["headlights"].icon = invImg(CheckTable["headlights"].part)

            if Config.System.Menu == "ox" then
                CheckTable["headlights"].desc = "R: "..r.." G: "..g.." B: "..b
            else
                CheckTable["headlights"].desc = "<span style='color:#"..Helper.rgbToHex(r, g, b):upper()
                    .."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black,"
                    .." 0em 0em 0.5em white, 0em 0em 0.5em white'> ⯀ </span> R: "..r.." G: "..g.." B: "..b
            end
        elseif GetNumVehicleMods(vehicle, 11) == 0 then
            CheckTable["headlights"].desc = locale("checkDetails", "unavailable")
        end
    end

    -- Drift Tires
    if GetGameBuildNumber() >= 2372 and CheckTable["drifttires"] then
        if GetDriftTyresEnabled(vehicle) == 1 then
            CheckTable["drifttires"].lock = false
            CheckTable["drifttires"].head = Items[CheckTable["drifttires"].part].label
            CheckTable["drifttires"].desc = locale("common", "installedMsg"):gsub("!", "")
            CheckTable["drifttires"].icon = invImg(CheckTable["drifttires"].part)
        end
    end

    -- Bullet Proof Tires
    if CheckTable["bprooftires"] then
        if GetVehicleTyresCanBurst(vehicle) == false then
            CheckTable["bprooftires"].lock = false
            CheckTable["bprooftires"].head = Items[CheckTable["bprooftires"].part].label
            CheckTable["bprooftires"].desc = locale("common", "installedMsg"):gsub("!", "")
            CheckTable["bprooftires"].icon = invImg(CheckTable["bprooftires"].part)
        end
    end

    -- Additional Stats
    if not IsThisModelABicycle(GetEntityModel(vehicle)) then
        if CheckTable["manual"] then
            if VehicleStatus[plate].manual == 1 then
                CheckTable["manual"].lock = false
                CheckTable["manual"].head = Items[CheckTable["manual"].part].label
                CheckTable["manual"].desc = locale("common", "installedMsg"):gsub("!", "")
                CheckTable["manual"].icon = invImg(CheckTable["manual"].part)
            end
        end

        if CheckTable["underglow"] then
            if VehicleStatus[plate].underglow == 1 then
                CheckTable["underglow"].lock = false
                CheckTable["underglow"].head = Items[CheckTable["underglow"].part].label
                CheckTable["underglow"].desc = locale("common", "installedMsg"):gsub("!", "")
                CheckTable["underglow"].icon = invImg(CheckTable["underglow"].part)

                local r, g, b = GetVehicleNeonLightsColour(vehicle)
                if Config.System.Menu == "ox" then
                    CheckTable["underglow"].desc = CheckTable["underglow"].desc
                                                   .."\n".."R: "..r.." G: "..g.." B: "..b
                else
                    CheckTable["underglow"].desc = "<span style='color:#"..Helper.rgbToHex(r, g, b):upper()
                        .."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black,"
                        .." 0em 0em 0.5em white, 0em 0em 0.5em white'> ⯀ </span> R: "..r.." G: "..g.." B: "..b
                end
            end
        end

        if CheckTable["antilag"] then
            if VehicleStatus[plate].antiLag == 1 then
                CheckTable["antilag"].lock = false
                CheckTable["antilag"].head = Items[CheckTable["antilag"].part].label
                CheckTable["antilag"].desc = locale("common", "installedMsg"):gsub("!", "")
                CheckTable["antilag"].icon = invImg(CheckTable["antilag"].part)
            end
        end

        -- Harness
        if CheckTable["harness"] then
            if VehicleStatus[plate].harness == 1 then
                CheckTable["harness"].lock = false
                CheckTable["harness"].head = Items[CheckTable["harness"].part].label
                CheckTable["harness"].desc = locale("common", "installedMsg"):gsub("!", "")
                CheckTable["harness"].icon = invImg(CheckTable["harness"].part)
            end
            if not Config.Harness.HarnessControl then
                CheckTable["harness"] = nil
            end
        end

        if Config.Repairs.ExtraDamages == true then
            CheckTable["oillevel"] = {
                id   = 15,
                lock = (VehicleStatus[plate].oillevel == 0),
                part = "oilp",
                head = "Oil Pump",
                icon = VehicleStatus[plate].oillevel ~= 0 and invImg("oilp"..VehicleStatus[plate].oillevel) or "",
                desc = (VehicleStatus[plate].oillevel ~= 0 and Items["oilp"..VehicleStatus[plate].oillevel].label or locale("common", "stockLabel"))
                       ..": [LVL "..VehicleStatus[plate].oillevel.." / ".."3".."]"
            }
            CheckTable["shaftlevel"] = {
                id   = 16,
                lock = (VehicleStatus[plate].shaftlevel == 0),
                part = "drives",
                head = "Drive Shaft",
                icon = VehicleStatus[plate].shaftlevel ~= 0 and invImg("drives"..VehicleStatus[plate].shaftlevel) or "",
                desc = (VehicleStatus[plate].shaftlevel ~= 0 and Items["drives"..VehicleStatus[plate].shaftlevel].label or locale("common", "stockLabel"))
                       ..": [LVL "..VehicleStatus[plate].shaftlevel.." / ".."3".."]"
            }
            CheckTable["cylinderlevel"] = {
                id   = 17,
                lock = (VehicleStatus[plate].cylinderlevel == 0),
                part = "cylind",
                head = "Cylinder Head",
                icon = VehicleStatus[plate].cylinderlevel ~= 0 and invImg("cylind"..VehicleStatus[plate].cylinderlevel) or "",
                desc = (VehicleStatus[plate].cylinderlevel ~= 0 and Items["cylind"..VehicleStatus[plate].cylinderlevel].label or locale("common", "stockLabel"))
                       ..": [LVL "..VehicleStatus[plate].cylinderlevel.." / ".."3".."]"
            }
            CheckTable["cablelevel"] = {
                id   = 18,
                lock = (VehicleStatus[plate].cablelevel == 0),
                part = "cables",
                head = "Battery Cables",
                icon = VehicleStatus[plate].cablelevel ~= 0 and invImg("cables"..VehicleStatus[plate].cablelevel) or "",
                desc = (VehicleStatus[plate].cablelevel ~= 0 and Items["cables"..VehicleStatus[plate].cablelevel].label or locale("common", "stockLabel"))
                       ..": [LVL "..VehicleStatus[plate].cablelevel.." / ".."3".."]"
            }
            CheckTable["fuellevel"] = {
                id   = 19,
                lock = (VehicleStatus[plate].fuellevel == 0),
                part = "fueltank",
                head = "Fuel Tank",
                icon = VehicleStatus[plate].fuellevel ~= 0 and invImg("fueltank"..VehicleStatus[plate].fuellevel) or "",
                desc = (VehicleStatus[plate].fuellevel ~= 0 and Items["fueltank"..VehicleStatus[plate].fuellevel].label or locale("common", "stockLabel"))
                       ..": [LVL "..VehicleStatus[plate].fuellevel.." / ".."3".."]"
            }
        end
    end

    CheckTable = createConsecutiveTable(CheckTable)

    for _, v in pairsByKeys(CheckTable) do
        if v.hide and v.lock then
            -- do nothing
        else
            local extra = false
            for _, b in pairs({"oilp", "drives", "cylind", "cables", "fueltank"}) do
                if v.part == b then extra = true end
            end

            CheckMenu[#CheckMenu+1] = {
                icon        = v.icon,
                isMenuHeader= (not editable) or v.lock,
                header      = v.head,
                txt         = v.desc,
                onSelect    = not v.lock and (function()
                    Toolbox.Remove({ vehicle=vehicle, mod=v.part, extra=extra })
                end),
                progress    = v.progress,
                colorScheme = (editable and Config.System.Menu == "ox")
                                and (((v.progress and (v.progress > 80)) and "green.5"
                                or ((v.progress and (v.progress < 30)) and "red.6")
                                or "yellow.5")
                                or "gray.0") or nil,
                progressColor = (editable and Config.System.Menu == "lation")
                                and (((v.progress and (v.progress > 80)) and "#1EA622"
                                or ((v.progress and (v.progress < 30)) and "#6b0a1c")
                                or "#ba861e")
                                or "#707070") or nil
            }
        end
    end

    if editable then
        CheckMenu[#CheckMenu+1] = {
            arrow   = true,
            icon    = "fas fa-toolbox",
            txt     = locale("checkDetails", "cosmeticsListHeader"),
            onSelect= function()
                Toolbox.CosmeticList()
            end,
        }
    end

    Helper.propHoldCoolDown("toolbox")

    openMenu(CheckMenu, {
        header    = searchCar(vehicle).name,
        headertxt = headertxt,
        canClose  = true,
        onExit    = function()
            Helper.removePropHoldCoolDown()
        end
    })
end

RegisterNetEvent(getScript()..":client:Menu", function(editable) Toolbox.Menu(editable) end)
RegisterNetEvent(getScript()..":client:CosmeticList", function() Toolbox.CosmeticList() end)

Toolbox.CosmeticList = function()
    local Ped = PlayerPedId()
    if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end

    local vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
    pushVehicle(vehicle)

    local CheckMenu = {}
    local exTable   = {
        [0]= locale("checkDetails", "spoilersLabel").." - [ ",
        [1]= locale("checkDetails", "frontBumpersLabel").." - [ ",
        [2]= locale("checkDetails", "rearBumpersLabel").." - [ ",
        [3]= locale("checkDetails", "skirtsLabel").." - [ ",
        [4]= locale("checkDetails", "exhaustsLabel").." - [ ",
        [6]= locale("checkDetails", "grillesLabel").." - [ ",
        [7]= locale("checkDetails", "hoodsLabel").." - [ ",
        [8]= locale("checkDetails", "leftFenderLabel").." - [ ",
        [9]= locale("checkDetails", "rightFenderLabel").." - [ ",
        [10]= locale("checkDetails", "roofLabel").." - [ ",
        [25]= locale("checkDetails", "plateHoldersLabel").." - [ ",
        [26]= locale("checkDetails", "vanityPlatesLabel").." - [ ",
        [27]= locale("checkDetails", "trimALabel").." - [ ",
        [44]= locale("checkDetails", "trimBLabel").." - [ ",
        [37]= locale("checkDetails", "trunksLabel").." - [ ",
        [39]= locale("checkDetails", "engineBlocksLabel").." - [ ",
        [40]= locale("checkDetails", "airFiltersLabel").." - [ ",
        [41]= locale("checkDetails", "engineStrutLabel").." - [ ",
        [42]= locale("checkDetails", "archCoversLabel").." - [ ",
    }
    local inTable = {
        [5]=  locale("checkDetails", "rollCagesLabel").." - [ ",
        [25]= locale("checkDetails", "ornamentsLabel").." - [ ",
        [29]= locale("checkDetails", "dashboardsLabel").." - [ ",
        [30]= locale("checkDetails", "dialsLabel").." - [ ",
        [31]= locale("checkDetails", "doorSpeakersLabel").." - [ ",
        [32]= locale("checkDetails", "seatsLabel").." - [ ",
        [33]= locale("checkDetails", "steeringWheelsLabel").." - [ ",
        [34]= locale("checkDetails", "shifterLeversLabel").." - [ ",
        [35]= locale("checkDetails", "plaquesLabel").." - [ ",
        [36]= locale("checkDetails", "speakersLabel").." - [ ",
        [38]= locale("checkDetails", "hydraulicsLabel").." - [ ",
        [43]= locale("checkDetails", "aerialsLabel").." - [ ",
        [45]= locale("checkDetails", "fuelTanksLabel").." - [ ",
    }

    local external, internal = nil, nil
    for k in pairs(exTable) do
        if GetNumVehicleMods(vehicle, k) ~= 0 then
            external = true
            break
        end
    end
    for k in pairs(inTable) do
        if GetNumVehicleMods(vehicle, k) ~= 0 then
            internal = true
            break
        end
    end

    if external then
        CheckMenu[#CheckMenu+1] = {
            isMenuHeader= true,
            disabled    = (Config.System.Menu == "ox"),
            header      = locale("checkDetails", "externalCosmetics").." -",
        }
        if GetNumVehicleMods(vehicle,48) ~= 0 then
            CheckMenu[#CheckMenu+1] = {
                isMenuHeader= true,
                txt         = locale("checkDetails", "wrapLabel").." - [ "..GetNumVehicleMods(vehicle, 48).." "..locale("checkDetails", "optionsLabel").." ]",
            }
        end
        if GetVehicleLiveryCount(vehicle) ~= -1 then
            CheckMenu[#CheckMenu+1] = {
                isMenuHeader= true,
                txt         = locale("checkDetails", "wrapLabel").." - [ "..GetVehicleLiveryCount(vehicle).." "..locale("checkDetails", "optionsLabel").." ]",
            }
        end
        for k, v in pairs(exTable) do
            if GetNumVehicleMods(vehicle, k) ~= 0 then
                CheckMenu[#CheckMenu+1] = {
                    isMenuHeader= true,
                    txt         = v..GetNumVehicleMods(vehicle, k).." "..locale("checkDetails", "optionsLabel").." ]",
                }
            end
        end
    end

    if internal then
        CheckMenu[#CheckMenu+1] = {
            isMenuHeader= true,
            header      = locale("checkDetails", "internalCosmetics").." -",
        }
        for k, v in pairs(inTable) do
            if GetNumVehicleMods(vehicle, k) ~= 0 then
                CheckMenu[#CheckMenu+1] = {
                    isMenuHeader= true,
                    header      = "",
                    txt         = v..GetNumVehicleMods(vehicle, k).." "..locale("checkDetails", "optionsLabel").." ]",
                }
            end
        end
    end

    local mods = nil
    for k in pairs(exTable) do
        if GetNumVehicleMods(vehicle, k) ~= 0 then
            mods = true
            break
        end
    end
    for k in pairs(inTable) do
        if GetNumVehicleMods(vehicle, k) ~= 0 then
            mods = true
            break
        end
    end
    if GetVehicleLiveryCount(vehicle) ~= -1 then
        mods = true
    end

    if mods then
        Helper.propHoldCoolDown("toolbox")
        openMenu(CheckMenu, {
            header    = locale("checkDetails", "vehicleLabel")..": "..searchCar(vehicle).name,
            headertxt = locale("checkDetails", "cosmeticsListHeader"),
            canClose  = true,
            onExit    = function()
                Helper.removePropHoldCoolDown()
            end,
        })
    else
        triggerNotify(nil, locale("common", "noOptionsAvailable"), "error")
        return
    end
end

Toolbox.Remove = function(data)
    local plate = Helper.getTrimmedPlate(data.vehicle)

    jsonPrint(VehicleStatus)
    local orgTable = {
        ["brakes"] = {
            icon  = invImg((GetVehicleMod(data.vehicle,12)+1) > 0 and "brakes"..(GetVehicleMod(data.vehicle,12)+1) or ""),
            head  = ((GetVehicleMod(data.vehicle,12)+1) > 0 and Items["brakes"..(GetVehicleMod(data.vehicle,12)+1)].label or ""),
            event = function()
                Modify.applyBrakes({ client ={  mod = data.mod, remove = true } })
            end,
        },
        ["engine"] = {
            icon  = invImg((GetVehicleMod(data.vehicle,11)+1) > 0 and "engine"..(GetVehicleMod(data.vehicle,11)+1) or ""),
            head  = ((GetVehicleMod(data.vehicle,11)+1) > 0 and Items["engine"..(GetVehicleMod(data.vehicle,11)+1)].label or ""),
            event = function()
                Modify.applyEngine({ client ={  mod = data.mod, remove = true } })
            end,
        },
        ["suspension"] = {
            icon  = invImg((GetVehicleMod(data.vehicle,15)+1) > 0 and "suspension"..(GetVehicleMod(data.vehicle,15)+1) or ""),
            head  = ((GetVehicleMod(data.vehicle,15)+1) > 0 and Items["suspension"..(GetVehicleMod(data.vehicle,15)+1)].label or ""),
            event = function()
                Modify.applySuspension({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["transmission"] = {
            icon  = invImg((GetVehicleMod(data.vehicle,13)+1) > 0 and "transmission"..(GetVehicleMod(data.vehicle,13)+1) or ""),
            head  = ((GetVehicleMod(data.vehicle,13)+1) > 0 and Items["transmission"..(GetVehicleMod(data.vehicle,13)+1)].label or ""),
            event = function()
                Modify.applyTransmission({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["car_armor"] = {
            icon  = invImg("car_armor"),
            head  = Items["car_armor"].label,
            event = function()
                Modify.applyArmour({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["turbo"] = {
            icon  = invImg("turbo"),
            head  = Items["turbo"].label,
            event = function()
                Modify.applyTurbo({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["headlights"] = {
            icon  = invImg("headlights"),
            head  = Items["headlights"].label,
            event = function()
                Modify.applyXenons(true)
            end,
        },
        ["drifttires"] = {
            icon  = invImg("drifttires"),
            head  = Items["drifttires"].label,
            event = function()
                Modify.applyDriftTires({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["bprooftires"] = {
            icon  = invImg("bprooftires"),
            head  = Items["bprooftires"].label,
            event = function()
                Modify.applyBulletProofTires({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["nos"] = {
            icon  = invImg("noscan"),
            head  = Items["noscan"].label,
            event = function()
                Nitrous.RemoveNos()
            end,
        },
        ["oilp"] = {
            icon  = invImg(VehicleStatus[plate].oillevel > 0 and "oilp"..VehicleStatus[plate].oillevel or ""),
            head  = (VehicleStatus[plate].oillevel > 0 and Items["oilp"..VehicleStatus[plate].oillevel].label or ""),
            event = function()
                ExtraDamageComponents.applyExtraPart({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["drives"] = {
            icon  = invImg(VehicleStatus[plate].shaftlevel > 0 and "drives"..VehicleStatus[plate].shaftlevel or ""),
            head  = (VehicleStatus[plate].shaftlevel > 0 and Items["drives"..VehicleStatus[plate].shaftlevel].label or ""),
            event = function()
                ExtraDamageComponents.applyExtraPart({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["cylind"] = {
            icon  = invImg(VehicleStatus[plate].cylinderlevel > 0 and "cylind"..VehicleStatus[plate].cylinderlevel or ""),
            head  = (VehicleStatus[plate].cylinderlevel > 0 and Items["cylind"..VehicleStatus[plate].cylinderlevel].label or ""),
            event = function()
                ExtraDamageComponents.applyExtraPart({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["cables"] = {
            icon  = invImg(VehicleStatus[plate].cablelevel > 0 and "cables"..VehicleStatus[plate].cablelevel or ""),
            head  = (VehicleStatus[plate].cablelevel > 0 and Items["cables"..VehicleStatus[plate].cablelevel].label or ""),
            event = function()
                ExtraDamageComponents.applyExtraPart({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["fueltank"] = {
            icon  = invImg(VehicleStatus[plate].fuellevel > 0 and "fueltank"..VehicleStatus[plate].fuellevel or ""),
            head  = (VehicleStatus[plate].fuellevel > 0 and Items["fueltank"..VehicleStatus[plate].fuellevel].label or ""),
            event = function()
                ExtraDamageComponents.applyExtraPart({ client={ mod=data.mod, remove=true } })
            end,
        },
        ["harness"] = {
            icon  = invImg("harness"),
            head  = Items["harness"].label,
            event = function()
                Modify.applyHarness({ client = { remove = true } })
            end,
        },
        ["antilag"] = {
            icon  = invImg("antilag"),
            head  = Items["antilag"].label,
            event = function()
                Modify.applyAntiLag({ client={ remove=true } })
            end,
        },
        ["manual"] = {
            icon  = invImg("manual"),
            head  = Items["manual"].label,
            event = function()
                Modify.applyManualTransmission({ client={ remove=true } })
            end,
        },
        ["underglow"] = {
            icon  = invImg("underglow"),
            head  = Items["underglow"].label,
            event = function()
                Modify.applyUnderglow({ client={ remove=true } })
            end,
        },
    }

    local CheckMenu = {}
    CheckMenu[#CheckMenu+1] = {
        icon        = orgTable[data.mod].icon,
        isMenuHeader= true,
        header      = locale("checkDetails", "removePrompt")..orgTable[data.mod].head.."?",
    }
    CheckMenu[#CheckMenu+1] = {
        icon    = "fas fa-circle-check",
        txt     = locale("checkDetails", "yesLabel"),
        onSelect= function()
            orgTable[data.mod].event()
        end,
    }
    CheckMenu[#CheckMenu+1] = {
        icon    = "fas fa-circle-xmark",
        txt     = locale("checkDetails", "noLabel"),
        onSelect= function()
            Toolbox.Menu(true)
        end,
    }

    Helper.propHoldCoolDown("screwdriver")

    openMenu(CheckMenu, {
        header    = searchCar(data.vehicle).name,
        headertxt = locale("checkDetails", "plateLabel")..": "
                    .." ["
                    ..plate
                    .."]"
                    ..br..(isOx() and br or "")
                    ..Helper.getMilageString(plate),
        onExit    = function()
            Helper.removePropHoldCoolDown()
        end,
    })
end