--==========================================================
-- Preview UI / Code
--==========================================================
previewing, stoppreview, properties, carMeta, oldMenu, camTable, currentCam = false, false, nil, {}, (not Config.Previews.oldOxLibMenu), {}, 2

PrevFunc = {}

previewmode = false

PrevFunc.startPreviewCamera = function(vehicle)
    local vehcoords = GetEntityCoords(vehicle)
    for k, v in pairsByKeys({
        GetOffsetFromEntityInWorldCoords(vehicle, 0.0,  4.0, 0.5),
        GetOffsetFromEntityInWorldCoords(vehicle, -1.8, 3.5, 2.0),
        GetOffsetFromEntityInWorldCoords(vehicle, -3.5, 0.0, 0.5),
        GetOffsetFromEntityInWorldCoords(vehicle, -2.6, 0.0, 3.0),
        GetOffsetFromEntityInWorldCoords(vehicle, -1.8, -3.5, 2.0),
        GetOffsetFromEntityInWorldCoords(vehicle, 0.0,  -5.0, 0.5),
        GetOffsetFromEntityInWorldCoords(vehicle, 1.8,  -3.5, 2.5),
        GetOffsetFromEntityInWorldCoords(vehicle, 3.5,   0.0, 0.5),
        GetOffsetFromEntityInWorldCoords(vehicle, 2.6,   0.0, 3.0),
        GetOffsetFromEntityInWorldCoords(vehicle, 1.8,   3.5, 2.0),
    }) do
        camTable[k] = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", v.x, v.y, v.z, 0.0, 0.0, 180.0, 60.00, false, 0)
        PointCamAtCoord(camTable[k], vehcoords.x, vehcoords.y, vehcoords.z)
    end

    SetCamActive(camTable[currentCam], true)
    RenderScriptCams(true, true, 2000, true, true)
    triggerNotify(nil, locale("previewSettings", "cameraEnabledMsg"), "success")
end

local currentPlate = nil

-- Detect if the person editing is in the driver seat
PrevFunc.startPreview = function(Ped, vehicle)
    local plate = Helper.getTrimmedPlate(vehicle)
    if not previewing then
        previewmode = true
        previewing  = true
        sendLog("Used /preview in: ["..plate.."]")
        TriggerServerEvent(getScript()..":server:preview", true, VehToNet(vehicle), plate)
        FreezeEntityPosition(vehicle, true)

        if Config.System.Menu ~= "ox" then
            PrevFunc.startPreviewCamera(vehicle)
        end
    else
        return
    end

    properties   = getVehicleProperties(vehicle)
    currentPlate = plate

    if not Config.Overrides.disablePreviewPlate then
        if isStarted("cd_garage") then
            TriggerServerEvent("cd_garage:RemovePersistentVehicles", exports["cd_garage"]:GetPlate(vehicle))
        end
        TriggerServerEvent(getScript()..":server:changePlate", VehToNet(vehicle), "PREVIEWZ", true)
    end

    while previewing do
        if Helper.GetSeatPedIsIn(vehicle) ~= -1 then
            previewing = false
        end
        if not previewing or stoppreview == true then
            if IsCamActive(camTable[currentCam]) then
                for i = 1, #camTable do
                    SetCamActive(camTable[i], true)
                    DestroyCam(camTable[i], true)
                end
                camTable   = {}
                currentCam = 2
                RenderScriptCams(false, true, 2000, true, true)
            end

            previewmode = false
            previewing  = false
            stoppreview = false

            if DoesEntityExist(vehicle) then
                FreezeEntityPosition(vehicle, false)
                TriggerServerEvent(getScript()..":server:preview", false)

                local newproperties = getVehicleProperties(vehicle)
                setVehicleProperties(vehicle, properties)
                SetVehicleEngineOn(vehicle, true, false, false)

                if newproperties == nil then
                    return
                else
                    PrevFunc.printDifferences(vehicle, properties, newproperties)
                    if not Config.Overrides.disablePreviewPlate then
                        TriggerServerEvent(getScript()..":server:changePlate", VehToNet(vehicle), currentPlate)
                        if isStarted("cd_garage") then
                            TriggerServerEvent("cd_garage:AddPersistentVehicles", exports["cd_garage"]:GetPlate(vehicle), ensureNetToVeh(vehicle))
                        end
                    end
                end
            end
            currentPlate = nil
            break
        end
        Wait(1000)
    end
end

PrevFunc.changeCamAngle = function()
    if IsCamActive(camTable[currentCam]) then
        local prevCam = currentCam
        currentCam    = currentCam + 1
        currentCam    = currentCam < 1 and countTable(camTable) or currentCam
        currentCam    = currentCam > countTable(camTable) and 1 or currentCam
        SetCamActiveWithInterp(camTable[currentCam], camTable[prevCam], 800, 0, 0)
    else
        Wait(3000)
    end
end

PrevFunc.stopPreview = function()
    stoppreview = true
end

RegisterNetEvent(getScript()..":preview:exploitfix", function(vehicle, resetprop)
    debugPrint("^5Debug^7: ^3Preview: ^2Using client to reset vehicle properties of abandoned vehicle^7")
    local netId = ensureNetToVeh(vehicle)
    if not netId or netId == 0 then return end

    setVehicleProperties(netId, resetprop)
    FreezeEntityPosition(netId, false)
end)

RegisterNetEvent(getScript()..":client:giveList", function(item)
    if isStarted(OXInv) and not item.info then
        local items = exports.ox_inventory:Search('slots', 'mechboard')
        for _, v in pairs(items) do
            if (v.slot == item.slot) then
                exports.ox_inventory:closeInventory()
                item.info = (v.metadata and v.metadata["info"]) or {}
                break
            end
        end
    end
    local list    = {}
    local newlist = ""

    for i = 1, #item.info["vehlist"] do
        local lines = {}
        item.info["vehlist"][i]:gsub("[^\n]+", function(line)
            table.insert(lines, line)
        end)

        for _, line in pairsByKeys(lines) do
            local key, value = line:match("^(.-) - %[(.-)%]$")
            if key and value then
                list[#list+1] = {
                    isMenuHeader = true,
                    header       = key:gsub("%-", ""),
                    txt          = " "..value:gsub("^(%d+)%.", "%1.\226\128\139")
                }
            end
        end
    end

    openMenu(list, {
        header    = item.info["veh"],
        headertxt = item.info["vehplate"]
                    ..br..locale("previewSettings", "changesLabel")..": "
                    ..(#item.info["vehlist"]),
        canClose  = true,
        onSelected= oldMenu,
    })
end)

PrevFunc.getInPreview = function()
    return previewmode
end

exports("GetInPreview", function()
    return PrevFunc.getInPreview()
end)