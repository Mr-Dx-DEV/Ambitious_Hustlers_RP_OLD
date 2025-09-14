PlateChange = {
    server = {}
}

if not isServer() then
    PlateChange.Menu = function(isItem)
        if isItem then
            if Config.PlateChange.ItemRequiresJob then
                for _, v in pairs(Config.PlateChange.ItemJobRestrictions) do
                    if hasJob(v) then goto start end
                end
                triggerNotify(nil, locale("plateChange", "specificJob"), "error") return
            end
        else
            if Config.PlateChange.CommandRequiresJob then
                for _, v in pairs(Config.PlateChange.CommandJobRestrictions) do
                    if hasJob(v) then goto start end
                end
                triggerNotify(nil, locale("plateChange", "specificItem"), "error") return
            end
        end

        ::start::

        local ped = PlayerPedId()
        local veh = Helper.getClosestVehicle(GetEntityCoords(ped))
        local plate = trim(GetVehicleNumberPlateText(veh))

        if Helper.isCarParked(plate) then
            triggerNotify(nil, "Vehicle is hard parked", "error")
            return
        end

        local netId = VehToNet(veh)
        if DoesEntityExist(veh) then
            if Helper.isVehicleOwned(trim(plate)) then
                goto continue
            else
                triggerNotify(nil, locale("common", "vehicleNotOwned"), "error")
                return
            end
        else
            triggerNotify(nil, locale("repairActions", "noVehicleNearby"), "error")
            return
        end

        ::continue::

        Helper.propHoldCoolDown("clipboard", true)

        local model = searchCar(veh).name

        local dialog = createInput(""..
            (Config.System.Menu == "ox" and "Current Plate: ["..plate.."]" or "")..
            (Config.System.Menu == "qb" and
                "<center><img src="..invImg("customplate").." width=100px>"..
                br.."- Customise Plates - "..br..
                br.."Vehicle: "..model..br..
                br.."Current Plate: ["..plate.."]"
            or ""),
        {
            {
                type = "text",
                text = "Max Character: 8",
                default = trim(plate):upper(),
                name = "newplate",
                min = Config.PlateChange.CharacterReq and 8 or 1,
                max = 8
            },
        })
        if dialog then
            Helper.removePropHoldCoolDown()
            local newPlate = dialog[1] or dialog["newplate"] or nil

            if newPlate ~= nil then

                if PlateChange.checkNewPlate(newPlate) then
                    --Start changing server side stuff
                    debugPrint("^5Debug^7: ^2Accepted^7, ^2sending info to server side^7...")
                    TriggerServerEvent(getScript()..":server:setPlate", {
                        vehicle = netId,
                        currentplate = plate,
                        newplate = newPlate,
                        item = isItem
                    })
                else
                    PlateChange.Menu(isItem)
                end
            end
        end
    end

    PlateChange.checkNewPlate = function(newPlate)
        --debugPrint("^5Debug^7: ^2New plate info received^7, ^2capitilizing^7: '^6"..newPlate.."^7' ^2into ^7'^6"..newPlate.."^7'")
        newPlate = newPlate:upper()
        local input = newPlate:gsub("[^"..Config.PlateChange.Filter.."]", "")
        debugPrint("^5Debug^7: ^2Filtering out blacklisted characters ^7'^6"..input.."^7'")

        -- Check if plate doesn't have any characater that wont work
        if string.len(tostring(input)) ~= string.len(newPlate) then
            triggerNotify(nil, locale("plateChange", "illegalChar"), "error")
            debugPrint("^5Debug^7: ^2Blacklisted letters found^7. ^1Cancelling^7.")
            return false

        end

        debugPrint("^5Debug^7: ^2Checking plate length^7...")
        -- Check if plate is too long (qb-input doesn't have limits)
        if string.len(newPlate) > 8 then
            triggerNotify(nil, locale("plateChange", "tooLong"), "error")
            debugPrint("^5Debug^7: ^2Plate too long^7: '^6"..string.len(newPlate).." Letters^7' (^18 Max^7)")
            return false

        -- Check if plate is too short (if you set a limit)
        elseif (string.len(newPlate) < 8 and Config.PlateChange.CharacterReq) then
            triggerNotify(nil, locale("plateChange", "tooShort"), "error")
            return false

        end

        debugPrint("^5Debug^7: ^2Checking for blacklisted phrases^7...")
        -- Check for naughty words
        for _, char in pairs(Config.PlateChange.BlacklistPhrases) do
            local char = char:upper()
            if newPlate:find(char) then
                debugPrint("^5Debug^7: ^2Found blacklisted phrase^7: '^1"..char.."^7'")
                triggerNotify(nil, locale("plateChange", "blacklisted"), "error")
                return false
            end
        end
        return true
    end

    PlateChange.updateVehicle = function(data)
        -- New plate has been changed in database, now you need to physically change the
        local veh = ensureNetToVeh(data.vehicle)
        debugPrint("^5Debug^7: ^3updatePlate^7: ^2Converitng vehicle ^4NetID^7[^6"..data.vehicle.."^7] ^2back to ^4EntityID^7[^6"..veh.."^7]")

        -- Make sure person owns the entity
        pushVehicle(veh)

        triggerNotify(nil, locale("plateChange", "plateUpdated").." ["..data.newplate.."]", "success")

        -- Remove item from player if set to
        if data.item == true then removeItem(Config.PlateChange.ItemToUse, 1) end

        debugPrint("^5Debug^7: ^2Transferring ^3Xenon Colours ^2to new plate")
        local hasCustomXenon, xenonR, xenonG, xenonB = GetVehicleXenonLightsCustomColor(veh)
        if hasCustomXenon == 1 or hasCustomXenon == true then
            TriggerServerEvent(getScript()..":server:ChangeXenonColour", data.vehicle, { r = xenonR, g = xenonG, b = xenonB })
        end

        --Update database mod data to reflect the changes
        ExtraDamageComponents.getVehicleStatus(veh)
        debugPrint("^5Debug^7: ^3updatePlate^7: ^2Saving ^4VehicleProperties^2 to assure changes^7...")
        Helper.addCarToUpdateLoop(veh)
    end

    RegisterNetEvent(getScript()..":client:setplate:Menu", function(isItem)
        PlateChange.Menu(isItem)
    end)

    RegisterNetEvent(getScript()..":client:updateVehicle", function(data)
        PlateChange.updateVehicle(data)
    end)
else
    onResourceStart(function()
		if Config.PlateChange.UseCommand then
			registerCommand("setplate", {
                locale("serverFunctions", "checkVehicleMods"),
                {}, false,
                function(source)
					TriggerClientEvent(getScript()..":client:setplate:Menu", source, false)
                end
            })
		end
		if Config.PlateChange.UseItem then
			createUseableItem(Config.PlateChange.ItemToUse, function(source)
				TriggerClientEvent(getScript()..":client:setplate:Menu", source, true)
			end)
		end
	end, true)

    PlateChange.server.setNewPlate = function(source, data)
        data.src = source
        local netEnt = NetworkGetEntityFromNetworkId(data.vehicle)
        local newPlate, currentPlate, playerOnline = trim(data.newplate):upper(), trim(data.currentplate):upper(), false

        --Check if new plate is already in use
        debugPrint("^5SQL^7: ^2Checking if ^7'^3"..newPlate.."^7' ^2is already in use^7...")
        local plateInUse = MySQL.Sync.fetchScalar("SELECT plate FROM "..vehDatabase.." WHERE plate = ? LIMIT 1", { newPlate })
        if plateInUse then
            debugPrint("^5SQL^7: ^2Plate ^1ALREADY ^2in use^7.")
            triggerNotify(nil, locale("plateChange", "alreadyExists"), "error", data.src)
            return
        end

        --Check if owner is online before changing the plates.
        debugPrint("^5SQL^7: [^3"..currentPlate.."^7] ^2Check if owner is online before changing the plates^7..")

        debugPrint("^5SQL^7: ^2Grabbing database ID of the vehicle to start transfer^7...")
        local citizenidsql = (isStarted(ESXExport) or isStarted(OXCoreExport)) and "owner" or "citizenid"
        local vehicleCitizenID = MySQL.scalar.await("SELECT "..citizenidsql.." FROM "..vehDatabase.." WHERE plate = ?", { currentPlate })
        -- Get citizenID from vehicle and check against currently online players
        for _, src in pairs(GetPlayers()) do
            local Player = getPlayer(src)
            if Player ~= nil then
                if Player.citizenId == vehicleCitizenID then
                    playerOnline = true
                    break
                end
            end
        end
        -- if not online then return to stop abuse
        if not playerOnline then
            debugPrint("^5SQL^7: ^2Player ^7'^3"..vehicleCitizenID.."^7' ^1NOT ^2Online^7!")
            triggerNotify(nil, locale("plateChange", "notOnline"), "error", data.src)
            return
        end
        debugPrint("^5SQL^7: ^2Player^7 '^3"..vehicleCitizenID.."^7' Online^7!")

        debugPrint("^5SQL^7: ^2Changing database entry of vehicle from ^7'^3"..currentPlate.."^7' ^2to ^7'^3"..newPlate.."^7'")
        MySQL.update("UPDATE "..vehDatabase.." SET plate = ? WHERE plate = ?", { newPlate, currentPlate })

        --if Config.CoreVehicles then
        --	MySQL.update('UPDATE vehicle_parts SET plate = ? WHERE plate = ?', {data.newplate, data.currentplate})
        --end

        --Update the cars actual physical plate
        debugPrint("^5Debug^7: ^2Updating physical plate on the current car^7...")
        SetVehicleNumberPlateText(netEnt, newPlate)

        --Wait for database to catch up for next steps
        Wait(500)

        -- Transfer vehiclestatus to new plate
        debugPrint("^5Debug^7: ^2Transferring ^3VehicleStatus ^2to new plate")
        setupVehicleStatus(data.vehicle) -- this should grab it from database and send it to statebags

        -- Transfer Nos if needed
        jsonPrint(VehicleNitrous)
        if VehicleNitrous[currentPlate] then
            debugPrint("^5Debug^7: ^2Transferring ^3Nitrous Info ^2to new plate")
            VehicleNitrous[newPlate] = VehicleNitrous[currentPlate]
            TriggerEvent(getScript()..":server:setNitrous", data.vehicle, { updateNitrous = true, level = VehicleNitrous[currentPlate].level })
        end

        -- Transfer nos color if needed
        if nosColour[currentPlate] then
            debugPrint("^5Debug^7: ^2Transferring ^3NOS Colours ^2to new plate")
            TriggerEvent(getScript()..":server:ChangeNosColour", data.vehicle, nosColour[currentPlate])
        end

        --Give the owner of the vehicle the keys to the updated vehicle.
        debugPrint("^5Debug^7: ^2Grabbing vehicle owners citizenID to give new vehicle keys^7...")
        for _, src in pairs(GetPlayers()) do
            local Player = getPlayer(src)
            if Player ~= nil then
                if Player.citizenId == vehicleCitizenID then

                    debugPrint("^5Debug^7: ^2Giving new keys of vehicle^7[^6"..(data.newplate):upper().."^7] ^2to ^7'^6"..vehicleCitizenID.."^7'(^6"..src.."^7) '^6"..Player.name.."^7")

                    TriggerClientEvent("vehiclekeys:client:SetOwner", src, newPlate)
                    break
                end
            end
        end

        --Update trunk and glovebox database with new plate
        -- QBCore has a separate location for invetories including gloveboxes and trunks
        -- QBOX and OX_Core integrates it into the player_vehicles table so updating the plate automatically changes these
        if isStarted(QBExport) and not isStarted(QBXExport) then
            debugPrint("^5SQL^7: ^2Changing ^4trunkitems ^2to new vehicle plate^7...")
            MySQL.update("UPDATE inventories SET identifier = ? WHERE identifier = ?", {
                "trunk-"..(data.newplate):upper(),
                "trunk-"..(data.currentplate):upper()
            })

            debugPrint("^5SQL^7: ^2Changing ^4gloveboxitems ^2to new vehicle plate^7...")
            MySQL.update("UPDATE inventories SET identifier = ? WHERE identifier = ?", {
                "glovebox-"..(data.newplate):upper(),
                "glovebox-"..(data.currentplate):upper()
            })
        end
        if isStarted(ESXExport) then
            -- ESX doesn't by default support gloveboxes and trunk items
        end

        -- Tell client to save vehicle properties
        TriggerClientEvent(getScript()..":client:updateVehicle", data.src, data)

    end

    RegisterNetEvent(getScript()..":server:setPlate", function(data)
        local src = source
        PlateChange.server.setNewPlate(src, data)
    end)

    --This call back checks for the players name, but also by doing this checks if the vehicles owned.
    createCallback(getScript()..":callback:getParked", function(source, plate)
        local result = MySQL.Sync.fetchAll("SELECT * FROM "..vehDatabase.." WHERE plate = ? LIMIT 1", { plate })
        local vehicle = result[1]

        if vehicle then
            debugPrint("^5SQL^7: ^2Found info ^7- ^3State^7: ^6" .. vehicle.state .. "^7")
            if vehicle.state ~= 3 then
                return result
            else
                return "Parked"
            end
        else
            return "Not Found"
        end
    end)
end