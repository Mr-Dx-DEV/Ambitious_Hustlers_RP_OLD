lastSentData = { }

function isElectric(model)

    return GetIsVehicleElectric(model) or electricCarModels[model] ~= nil
end

function updateVehicleHUD(dist, veh, plate, model, DistAdd, seat)
    if  veh == 0
        or (not DoesEntityExist(veh) or GetVehiclePedIsIn(PlayerPedId()) ~= veh)
        or (not plate or plate == "ERROR")
        or not VehicleStatus[plate]
    then
        return
    end

    local odo = Config.Odometer.hudConfig

    local isPassenger = (seat ~= -1) and not (seat ~= 1 and Config.Odometer.ShowPassengersAllIcons)
    local headlights = {}
    headlights[1], headlights[2], headlights[3] = GetVehicleLightsState(veh)

    local custom, r, g, b = GetVehicleXenonLightsCustomColor(veh)
    local ur, ug, ub = GetVehicleNeonLightsColour(veh)
    local engHealth = GetVehicleEngineHealth(veh)
    local bodHealth = GetVehicleBodyHealth(veh)
    local axleHealth = (Config.Repairs.ExtraDamages and VehicleStatus[plate].axle) and VehicleStatus[plate].axle * 10 or 0
    local batteryHealth = (Config.Repairs.ExtraDamages and VehicleStatus[plate].battery) and VehicleStatus[plate].battery * 10 or 0
    local oilHealth = (Config.Repairs.ExtraDamages and VehicleStatus[plate].oil) and VehicleStatus[plate].oil * 10 or 0
    local sparkHealth = (Config.Repairs.ExtraDamages and VehicleStatus[plate].spark) and VehicleStatus[plate].spark * 10 or 0
    local fuelHealth = (Config.Repairs.ExtraDamages and VehicleStatus[plate].fuel) and VehicleStatus[plate].fuel * 10 or 0
    local tyreHealth = false
    local doorsOpen = false
    for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do if IsVehicleTyreBurst(veh, v, 0) == 1 or IsVehicleTyreBurst(veh, v, 1) == 1 then tyreHealth = true break end end
    for _, v in pairs({0, 1, 2, 3}) do if GetVehicleDoorAngleRatio(veh, v) > 0.0 then doorsOpen = true break end end

    local nosTable = Helper.getOdoNosValues(plate)

    local iconData = {
        ["engine"] = {
            level = engHealth,
            text = (debugMode or Config.Odometer.hudConfig.showHealthValues) and math.floor(engHealth /10) or nil,
            visible = not isPassenger and Config.Odometer.OdoIconsToShow["engine"] and (Config.Odometer.OdoAlwaysShowIcons or engHealth < Config.Odometer.OdoShowLimit * 10),
        },
        ["body"] = {
            level = bodHealth,
            text = (debugMode or Config.Odometer.hudConfig.showHealthValues) and math.floor(bodHealth /10) or nil,
            visible = not isPassenger and Config.Odometer.OdoIconsToShow["body"] and (Config.Odometer.OdoAlwaysShowIcons or bodHealth < Config.Odometer.OdoShowLimit * 10)
        },
        ["axle"] = {
            level = axleHealth,
            text = (debugMode or Config.Odometer.hudConfig.showHealthValues) and math.floor(axleHealth/10) or nil,
            visible = not isPassenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["axle"] and (Config.Odometer.OdoAlwaysShowIcons or axleHealth < Config.Odometer.OdoShowLimit),
            col = currentEffect["axleEffect"] and "rgba(255, 102, 0, 1.0)" or nil,
        },
        ["battery"] = {
            level = batteryHealth,
            text = (debugMode or Config.Odometer.hudConfig.showHealthValues) and math.floor(batteryHealth/10) or nil,
            visible = not isPassenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["battery"] and (Config.Odometer.OdoAlwaysShowIcons or batteryHealth < Config.Odometer.OdoShowLimit),
            col = currentEffect["batteryEffect"] and "rgba(255, 102, 0, 1.0)" or nil,
        },
        ["oil"] = {
            level = oilHealth,
            text = (debugMode or Config.Odometer.hudConfig.showHealthValues) and math.floor(oilHealth/10) or nil,
            visible = not isPassenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["oil"] and (Config.Odometer.OdoAlwaysShowIcons or oilHealth < Config.Odometer.OdoShowLimit),
            col = currentEffect["oilEffect"] and "rgba(255, 102, 0, 1.0)" or nil,
        },
        ["spark"] = {
            level = sparkHealth,
            text = (debugMode or Config.Odometer.hudConfig.showHealthValues) and math.floor(sparkHealth/10) or nil,
            visible = not isPassenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["spark"] and (Config.Odometer.OdoAlwaysShowIcons or sparkHealth < Config.Odometer.OdoShowLimit),
            col = currentEffect["sparkEffect"] and "rgba(255, 102, 0, 1.0)" or nil,
        },
        ["fuel"] = {
            level = fuelHealth,
            text = (debugMode or Config.Odometer.hudConfig.showHealthValues) and math.floor(fuelHealth/10) or nil,
            visible = not isPassenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["fuel"] and (Config.Odometer.OdoAlwaysShowIcons or fuelHealth < Config.Odometer.OdoShowLimit),
            col = currentEffect["fuelEffect"] and "rgba(255, 102, 0, 1.0)" or nil,
        },
        ["nos"] = {
            level = nosTable.hasNos and (nosTable.level * 10) or 0,
            visible = Config.Odometer.OdoIconsToShow["nos"] and not isPassenger and (nosTable.hasNos and Config.NOS.enable and not purgemode) or false,
            text = boostLevel,
        },
        ["purge"] = {
            visible = Config.Odometer.OdoIconsToShow["nos"] and not isPassenger and(nosTable.hasNos and Config.NOS.enable and purgemode) or false,
            purgeCol = nosColour and nosColour[plate] and "rgba("..nosColour[plate][1]..", "..nosColour[plate][2]..", "..nosColour[plate][3]..")" or "rgb(255,255,255)",
            text = purgeCool,
        },
        ["headlight"] = {
            visible = not isPassenger and (Config.Odometer.OdoIconsToShow["headlight"] and (headlights[2] == 1)) or false,
            headlightToggle = (headlights[3] == 1) or false,
            headLightCol = custom and "rgba("..r..", "..g..", "..b..")" or nil,
        },
        ["seatbelt"] = {
            visible = not Helper.isBike(model) and Config.Odometer.OdoIconsToShow["seatbelt"] and VehicleStatus[plate] and VehicleStatus[plate].harness == 0 and (not Config.Odometer.SeatbeltHideWhenBuckled or not Helper.getSeatbeltForOdo()) or false,
            seatbeltToggle = Helper.getSeatbeltForOdo(),
        },
        ["harness"] = {
            visible = (not Helper.isBike(model) and Config.Odometer.OdoIconsToShow["harness"] and VehicleStatus[plate] and VehicleStatus[plate].harness == 1 and (not Config.Odometer.HarnessHideWhenBuckled or not Helper.getHarnessForOdo())) or false,
            harnessToggle = Helper.getHarnessForOdo()
        },
        ["underglow"] = {
            visible = not isPassenger and (Config.Odometer.OdoIconsToShow["underglow"] and not Helper.isBike(model) and VehicleStatus[plate] and VehicleStatus[plate].underglow == 1) or false,
            underLights = {
                left = IsVehicleNeonLightEnabled(veh, 0),
                right = IsVehicleNeonLightEnabled(veh, 1),
                front = IsVehicleNeonLightEnabled(veh, 2),
                back = IsVehicleNeonLightEnabled(veh, 3),
            },
            underCol = "rgba("..ur..", "..ug..", "..ub..")"
        },
        ["manual"] = {
            visible = not isPassenger and (not Helper.isBike(model) and Config.Odometer.OdoIconsToShow["manual"] and VehicleStatus[plate] and VehicleStatus[plate].manual == 1) or false,
        },
        ["doors"] = {
            visible = not isPassenger and (not Helper.isBike(model) and Config.Odometer.OdoIconsToShow["doors"] and doorsOpen ~= false) or false,
        },
        ["wheel"] = {
            visible = not isPassenger and Config.Odometer.OdoIconsToShow["wheel"] and tyreHealth or false,
        },
        ["antilag"] = {
            visible = not isPassenger and ( VehicleStatus[plate] and VehicleStatus[plate].antiLag == 1) or false,
        },
        ["lowfuel"] = {
            visible = not isElectric(model) and not isPassenger and (Config.Odometer.OdoIconsToShow["lowfuel"] and (GetVehicleFuelLevel(veh) < 20)) or false,
        },
    }

    local mileageText = string.format("%06d", math.floor(dist + DistAdd))
    local mileageData = {
        showMilage = odo.mileage.enabled,
        mileageText = mileageText,
        mileagetextSize = odo.mileage.size,
        mileagetextColor = string.format("rgba(%d,%d,%d,1.0)", table.unpack(odo.mileage.color)),
        mileagetextGlow = odo.mileage.glow.style .. " rgba(" .. table.concat(odo.mileage.glow.color, ",") .. ")",
        font = odo.font,
    }

    local dataChanged = false
    local newData = {
        isRunning = GetIsVehicleEngineRunning(veh),
        iconData = iconData,
        mileageData = mileageData,
        odo = odo,
    }

    for key, value in pairs(newData) do
        if lastSentData[key] ~= nil then
            if type(value) == "table" then
                for l in pairs(newData[key]) do
                    if type(newData[key][l]) ~= "table" then
                        if newData[key][l] ~= lastSentData[key][l] then
                            --debugPrint("data is different, updating", l, newData[key][l])
                            dataChanged = true
                            lastSentData[key] = newData[key]
                        end
                    else
                        if not areTablesEqual(newData[key][l], lastSentData[key][l]) then
                            --debugPrint("data is different, updating", l, json.encode(newData[key][l]))
                            dataChanged = true
                            lastSentData[key] = newData[key]
                        end
                    end
                end
            else
                dataChanged = true
                lastSentData = newData
            end
        else
            dataChanged = true
            lastSentData = newData
        end
    end
    --print(GetIsVehicleEngineRunning(veh))
    -- Only send data if it has changed
    if dataChanged then
        for icon, data in pairs(iconData) do
            SendNUIMessage({
                updateHUD = true,
                isRunning = newData.isRunning,
                canvasId = icon .. "Canvas",
                health = data.level or "",
                isVisible = data.visible,
                positionPercent = odo.position,
                bgColor = string.format("rgba(%d,%d,%d,%f)", odo.background.color[1], odo.background.color[2], odo.background.color[3], odo.background.color[4]),
                borderColor = string.format("rgba(%d,%d,%d,%f)", odo.background.border.color[1], odo.background.border.color[2], odo.background.border.color[3], odo.background.border.color[4]),
                borderWidth = odo.background.border.width,
                cornerRadius = odo.background.radius,
                boxShadow = odo.background.shadow.style .. " rgba(" .. table.concat(odo.background.shadow.color, ",") .. ")",
                iconGlow = odo.icons.glow,
                iconColorMax = string.format("rgba(%d,%d,%d,1.0)", table.unpack(odo.icons.colorHealthy)),
                iconColorMin = string.format("rgba(%d,%d,%d,1.0)", table.unpack(odo.icons.colorDamaged)),
                size = odo.icons.size,
                iconBoxShadow = odo.icons.boxShadow.enabled,
                iconBoxShadowStyle = odo.icons.boxShadow.style,
                iconBoxShadowCorners = odo.icons.boxShadow.corners,
                inlayText = data.level and (odo.showHealthValues and tostring(math.floor((data.level or 1000)/10))) or "",
                inlayTextSize = odo.overlayText.size,
                inlayTextPosition = odo.overlayText.position,
                inlayTextColor = string.format("rgba(%d,%d,%d,1.0)", table.unpack(odo.overlayText.color)),
                inlayTextGlow = odo.overlayText.glow,
                showMilage = mileageData.showMilage,
                mileageText = mileageData.mileageText,
                mileagetextSize = mileageData.mileagetextSize,
                mileagetextColor = mileageData.mileagetextColor,
                mileagetextGlow = mileageData.mileagetextGlow,
                font = mileageData.font,

                seatbeltToggle = data.seatbeltToggle or nil,
                harnessToggle = data.harnessToggle or nil,
                headlightToggle = data.headlightToggle or nil,
                underLights = data.underLights or nil,
                underCol = data.underCol or nil,
                headlightColor = data.headLightCol or nil,
                purgeColor = data.purgeCol or nil,

            })
        end
    end
end


-- Helper function to compare two tables
function areTablesEqual(t1, t2)
    if t1 == t2 then return true end
    if type(t1) ~= "table" then print(t1) end
    for k, v in pairs(t1) do
        if type(v) == "table" and type(t2[k]) == "table" then
            if not areTablesEqual(v, t2[k]) then
                return false
            end
        else
            if v ~= t2[k] then
                return false
            end
        end
    end
    return true
end

RegisterCommand("showodohud", function()
    SendNUIMessage({ showHUD = true })
    if Config.Odometer.showSpeedometer then
        SendNUIMessage({ showSpeed = true })
    end
end, false)

RegisterCommand("hideodohud", function()
    SendNUIMessage({ hideHUD = true  })
    if Config.Odometer.showSpeedometer then
        SendNUIMessage({ hideSpeed = true })
    end
end, false)

function updateSpeedometer(vehicle, model, plate)
    local nosTable = Helper.getOdoNosValues(plate)
    if Config.Odometer.showSpeedometer then
        if vehicle ~= 0 then -- Check if the player is in a vehicle
            local doorsOpen = false
            for _, v in pairs({0, 1, 2, 3}) do if GetVehicleDoorAngleRatio(vehicle, v) > 0.0 then doorsOpen = true break end end
            local rpm = GetVehicleCurrentRpm(vehicle)
            local gear = GetVehicleCurrentGear(vehicle)
            local speed = GetEntitySpeed(vehicle) * (Config.System.distkph and 3.6 or 2.236936)
            local maxSpeed = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
            local cus = Config.Odometer.speedoConfig
            local plane = IsThisModelAPlane(model) or IsThisModelAHeli(model)
            local isRunning = GetIsVehicleEngineRunning(vehicle)
            SendNUIMessage({
                updateSpeedometer = true,
                isRunning = isRunning,

                speed = isRunning == 1 and (speed > math.ceil(maxSpeed*0.99) and math.random(math.ceil(speed*0.99)+1, math.floor(speed)+1) or speed) or 0,
                maxSpeed = maxSpeed, -- Fetch max speed from handling
                rpm = isRunning == 1 and (plane and math.ceil(GetEntityCoords(vehicle).z * 0.5) or (rpm > 0.95 and math.random(95, 100) / 100 or rpm)) or 0,
                gear = isRunning == 1 and (gear ~= 0 and gear or "R") or 0,
                maxGear = isElectric(model) and 10 or GetVehicleHighGear(vehicle),
                fuel = isRunning == 1 and (not isElectric(model) and GetVehicleFuelLevel(vehicle) or 100) or 0,
                isPlane = plane,
                isElectric = isElectric(model),

                hasNos = nosTable.hasNos and true or false,
                nos = isRunning == 1 and ((purgemode and purgeSize * 100) or (nosTable.hasNos and nosTable.level) or 0) or 1,
                nosActive = nosTable.hasNos and nosTable.active or false,
                purgeMode = purgemode,
                nosActiveLevel = boostLevel or 0,

                SpeedLocation = cus.position,
                SpeedSize = cus.size,

                BorderWidth = cus.style.border.width,
                BorderCol = "rgba("..cus.style.border.color[1]..", "..cus.style.border.color[2]..", "..cus.style.border.color[3]..", "..cus.style.border.color[4]..")",
                BorderTrans = cus.style.border.color[4],
                BorderStyle = cus.style.border.style,

                BackgroundCol = "rgba("..cus.style.background.color[1]..", "..cus.style.background.color[2]..", "..cus.style.background.color[3]..", "..cus.style.background.color[4]..")",
                BackgroundShadow = cus.style.background.shadow.style,
                BackgroundShadowColor = "rgba("..cus.style.background.shadow.color[1]..", "..cus.style.background.shadow.color[2]..", "..cus.style.background.shadow.color[3]..", "..cus.style.background.shadow.color[4]..")",

                TextColour = "rgba("..cus.text.color[1]..", "..cus.text.color[2]..", "..cus.text.color[3]..", "..cus.text.color[4]..")",
                TextSize = cus.text.size,
                font = cus.font,
                ColourHigh = "rgba("..cus.text.highlightColor[1]..", "..cus.text.highlightColor[2]..", "..cus.text.highlightColor[3]..", "..cus.text.highlightColor[4]..")",


                showFuelMeter = cus.needles.fuel.enable,
                showRpmMeter = cus.needles.rpm.enable,
                showNosMeter = cus.needles.nos.enable,

                ShowDigitalSpeed = cus.digitalSpeed.enable,
                digitalSpeedLoc = cus.digitalSpeed.position,
                digitalSpeedSize = cus.digitalSpeed.size,
                digitalSpeedCol = "rgba("..cus.markers.color[1]..", "..cus.markers.color[2]..", "..cus.markers.color[3]..", "..cus.markers.color[4]..")",
                digitalSpeedGlow = cus.digitalSpeed.size,

                MarkerColour = "rgba("..cus.markers.color[1]..", "..cus.markers.color[2]..", "..cus.markers.color[3]..", "..cus.markers.color[4]..")",
                MarkerColourHigh = "rgba("..cus.markers.highlightColor[1]..", "..cus.markers.highlightColor[2]..", "..cus.markers.highlightColor[3]..", "..cus.markers.highlightColor[4]..")",

                NeedleType = cus.needles.type,

                SpeedNeedleLength = cus.needles.speed.length,
                SpeedNeedleWidth = cus.needles.speed.width,
                SpeedNeedleCol = "rgba("..cus.needles.speed.color[1]..", "..cus.needles.speed.color[2]..", "..cus.needles.speed.color[3]..", "..cus.needles.speed.color[4]..")",
                SpeedNeedleShadow = cus.needles.speed.shadow.style,
                SpeedNeedleShadowCol = "rgba("..cus.needles.speed.shadow.color[1]..", "..cus.needles.speed.shadow.color[2]..", "..cus.needles.speed.shadow.color[3]..", "..cus.needles.speed.shadow.color[4]..")",
                SpeedDigitalBack = "rgba("..cus.needles.speed.digital.back[1]..", "..cus.needles.speed.digital.back[2]..", "..cus.needles.speed.digital.back[3]..", "..cus.needles.speed.digital.back[4]..")",
                SpeedNosActive = "rgba("..cus.needles.speed.digital.nosActive[1]..", "..cus.needles.speed.digital.nosActive[2]..", "..cus.needles.speed.digital.nosActive[3]..", "..cus.needles.speed.digital.nosActive[4]..")",

                rpmMeterLocation = "translate("..cus.needles.rpm.position.x..", "..cus.needles.rpm.position.y..")",
                rpmMeterSize = cus.needles.rpm.size,
                rpmNeedleLength = cus.needles.rpm.length,
                rpmNeedleWidth = cus.needles.rpm.width,
                rpmNeedleCol = "rgba("..cus.needles.rpm.color[1]..", "..cus.needles.rpm.color[2]..", "..cus.needles.rpm.color[3]..", "..cus.needles.rpm.color[4]..")",
                rpmNeedleShadow = cus.needles.rpm.shadow.style,
                rpmNeedleShadowCol = "rgba("..cus.needles.rpm.shadow.color[1]..", "..cus.needles.rpm.shadow.color[2]..", "..cus.needles.rpm.shadow.color[3]..", "..cus.needles.rpm.shadow.color[4]..")",
                rpmDigitalBack = "rgba("..cus.needles.rpm.digital.back[1]..", "..cus.needles.rpm.digital.back[2]..", "..cus.needles.rpm.digital.back[3]..", "..cus.needles.rpm.digital.back[4]..")",
                rpmNosActive = "rgba("..cus.needles.rpm.digital.nosActive[1]..", "..cus.needles.rpm.digital.nosActive[2]..", "..cus.needles.rpm.digital.nosActive[3]..", "..cus.needles.rpm.digital.nosActive[4]..")",

                fuelMeterLocation = "translate("..cus.needles.fuel.position.x..", "..cus.needles.fuel.position.y..")",
                fuelMeterSize = cus.needles.fuel.size,
                fuelNeedleLength = cus.needles.fuel.length,
                fuelNeedleWidth = cus.needles.fuel.width,
                fuelNeedleCol = "rgba("..cus.needles.fuel.color[1]..", "..cus.needles.fuel.color[2]..", "..cus.needles.fuel.color[3]..", "..cus.needles.fuel.color[4]..")",
                fuelNeedleShadow = cus.needles.fuel.shadow.style,
                fuelNeedleShadowCol = "rgba("..cus.needles.fuel.shadow.color[1]..", "..cus.needles.fuel.shadow.color[2]..", "..cus.needles.fuel.shadow.color[3]..", "..cus.needles.fuel.shadow.color[4]..")",
                fuelDigitalBack = "rgba("..cus.needles.fuel.digital.back[1]..", "..cus.needles.fuel.digital.back[2]..", "..cus.needles.fuel.digital.back[3]..", "..cus.needles.fuel.digital.back[4]..")",
                fuelNosActive = "rgba("..cus.needles.fuel.digital.nosActive[1]..", "..cus.needles.fuel.digital.nosActive[2]..", "..cus.needles.fuel.digital.nosActive[3]..", "..cus.needles.fuel.digital.nosActive[4]..")",

                nosMeterLocation = "translate("..cus.needles.nos.position.x..", "..cus.needles.nos.position.y..")",
                nosMeterSize = cus.needles.nos.size,
                nosNeedleLength = cus.needles.nos.length,
                nosNeedleWidth = cus.needles.nos.width,
                nosNeedleCol = "rgba("..cus.needles.nos.color[1]..", "..cus.needles.nos.color[2]..", "..cus.needles.nos.color[3]..", "..cus.needles.nos.color[4]..")",
                nosNeedleShadow = cus.needles.nos.shadow.style,
                nosNeedleShadowCol = "rgba("..cus.needles.nos.shadow.color[1]..", "..cus.needles.nos.shadow.color[2]..", "..cus.needles.nos.shadow.color[3]..", "..cus.needles.nos.shadow.color[4]..")",
                nosDigitalBack = "rgba("..cus.needles.nos.digital.back[1]..", "..cus.needles.nos.digital.back[2]..", "..cus.needles.nos.digital.back[3]..", "..cus.needles.nos.digital.back[4]..")",
                nosNosActive = "rgba("..cus.needles.nos.digital.nosActive[1]..", "..cus.needles.nos.digital.nosActive[2]..", "..cus.needles.nos.digital.nosActive[3]..", "..cus.needles.nos.digital.nosActive[4]..")",

                nosMarker = "rgba("..cus.nosBoostIndicator.back[1]..", "..cus.nosBoostIndicator.back[2]..", "..cus.nosBoostIndicator.back[3]..", "..cus.nosBoostIndicator.back[4]..")",
                nosMarkerLight = "rgba("..cus.nosBoostIndicator.active[1]..", "..cus.nosBoostIndicator.active[2]..", "..cus.nosBoostIndicator.active[3]..", "..cus.nosBoostIndicator.active[4]..")",

                highlights = {
                    speed = cus.highlights.speed,
                    high = cus.highlights.highSpeed
                },
            })
        end
    end
end