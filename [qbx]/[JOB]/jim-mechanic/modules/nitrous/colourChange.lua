NitrousColour = {}

if Config.NOS.enable then

    onPlayerLoaded(function()
        CreateThread(function()
            while not GlobalState.nosColour do Wait(100) end
            debugPrint("^5Statebag^7: ^2Recieving ^4nosColour: ^7'^6"..countTable(GlobalState.nosColour).."^7'")
            nosColour = GlobalState.nosColour
        end)
    end, true)

    --==========================================================
    -- Statebag Handler for NOS Colour
    --==========================================================
    -- Recieve VehicleStatus update
    AddStateBagChangeHandler("vehicleNitrousColour", nil, function(_, _, newValue)
        if not newValue or type(newValue) ~= "table" then return end
        -- Announce change
        debugPrint("^5StateBag^7: ^2Change recieved^7: vehicleNitrousColour", json.encode(newValue))

        -- Update local cache with server synced cache
        nosColour[newValue.plate] = newValue.newColour
        debugPrint("^5Debug^7: ^2Receiving new ^3nosColour^7[^6"..
                    tostring(newValue.plate).."^7] = { ^2RBG: ^7= ^6"..
                    nosColour[newValue.plate][1].."^7, ^6"..nosColour[newValue.plate][2].."^7, ^6"..
                    nosColour[newValue.plate][3].." ^7}")
    end)

    --==========================================================
    -- Apply NOS RGB
    --==========================================================
    NitrousColour.Apply = function(data)
        local Ped      = PlayerPedId()
        local coords   = GetEntityCoords(Ped)
        local vehicle  = Helper.getClosestVehicle(coords)
        local above    = isVehicleLift(vehicle)
        local emote    = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }

        lookEnt(vehicle)

        loadPtfxDict("scr_recartheft")
        UseParticleFxAssetNextCall("scr_recartheft")
        SetParticleFxNonLoopedColour(data[1] / 255, data[2] / 255, data[3] / 255)
        SetParticleFxNonLoopedAlpha(1.0)

        local sprayCoords = GetOffsetFromEntityInWorldCoords(Ped, 0.0, 0.6, 0.8)
        local spray       = StartNetworkedParticleFxNonLoopedAtCoord("scr_wheel_burnout", sprayCoords, 0.0, 0.0, GetEntityHeading(vehicle), 0.5, 0.0, 0.0, 0.0)

        if progressBar({
            label = locale("common", "actionInstalling"),
            time  = math.random(5000,8000),
            cancel= true,
            anim  = emote.anim,
            dict  = emote.dict,
            flag  = emote.flag,
            icon  = "noscolour"
        }) then
            TriggerServerEvent(getScript()..":server:ChangeNosColour", VehToNet(vehicle), data)
            if Config.Overrides.CosmeticItemRemoval then
                removeItem("noscolour", 1)
            end
            triggerNotify(nil, locale("nosSettings", "nosColor").." "..locale("common", "installedMsg"), "success")
            sendLog(Items["noscolour"].label.."(noscolour) - installed ["..Helper.getTrimmedPlate(vehicle).."]")
        end

        Helper.removePropHoldCoolDown()

        local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 1.8, -3.5, 2.5), vehicle)
        startTempCam(cam)
        Wait(300)

        TriggerServerEvent(getScript()..":server:SyncPurge", VehToNet(vehicle), true, 0.9)
        Wait(2000)
        stopTempCam()
        TriggerServerEvent(getScript()..":server:SyncPurge", VehToNet(vehicle), false, nil)
    end

    --==========================================================
    -- NOS Colour Menu (RGB / HEX)
    --==========================================================
    NitrousColour.RGBHexMenu = function(data)
        local r, g, b = table.unpack(data.currentCol)
        local dialog  = {}

        local dialog = createInput(locale("nosSettings", "nosColor").." - "..(data.hex and locale("paintRGB", "hexPickerLabel") or locale("paintRGB", "rgbPickerLabel")), {
            ((Config.System.Menu == "ox") and {
                type = "color",
                label = data.hex and locale("paintRGB", "hexLabel") or locale("paintRGB", "rgbLabel"),
                format = data.hex and "hex" or "rgb",
                default = data.hex and "#"..Helper.rgbToHex(r, g, b):upper() or "rgb("..r..", "..g..", "..b..")"
            }) or nil,
            ((Config.System.Menu == "qb" and data.hex) and {
                type = "text",
                name = "hex",
                text = "#"..Helper.rgbToHex(r, g, b):upper()
            }) or nil,
            ((Config.System.Menu == "qb" and not data.hex) and { type = "number", name = "r", text = locale("paintRGB", "redLabel")..r }) or nil,
            ((Config.System.Menu == "qb" and not data.hex) and { type = "number", name = "g", text = locale("paintRGB", "greenLabel")..g }) or nil,
            ((Config.System.Menu == "qb" and not data.hex) and { type = "number", name = "b", text = locale("paintRGB", "blueLabel")..b }) or nil,
        })
        if dialog then
            if Config.System.Menu == "ox" then
                if data.hex then
                    dialog[1] = dialog[1]:gsub("#", "")
                    r, g, b   = Helper.HexTorgb(dialog[1])
                else
                    dialog[1] = Helper.convertOxRGB(dialog[1])
                    r, g, b   = tonumber(dialog[1][1]) or r, tonumber(dialog[1][2]) or g, tonumber(dialog[1][3]) or b
                end
            else
                if data.hex then
                    local hex = dialog["hex"]:gsub("#", "")
                    while string.len(hex) < 6 do
                        hex = hex.."0"
                        Wait(10)
                    end
                    r, g, b = Helper.HexTorgb(hex)
                else
                    r, g, b = tonumber(dialog.r or r), tonumber(dialog.g or g), tonumber(dialog.b or b)
                end
            end

            r = r or 0
            g = g or 0
            b = b or 0
            if r > 255 then r = 255 end
            if g > 255 then g = 255 end
            if b > 255 then b = 255 end
            NitrousColour.Apply({ r, g, b })

        else
            NitrousColour.RGBorHex()
        end
    end

    --==========================================================
    -- NOS RGB/HEX Fallback Menu
    --==========================================================
    NitrousColour.RGBorHex = function()
        local Ped     = PlayerPedId()
        local coords  = GetEntityCoords(Ped)
        local vehicle = Helper.getClosestVehicle(coords)
        if not Helper.isInCar() then return end
        local plate = Helper.getTrimmedPlate(vehicle)
        if Helper.isCarParked(plate) then
            triggerNotify(nil, "Vehicle is hard parked", "error")
            return
        end
        local r, g, b = 255, 255, 255

        if nosColour[plate] then
            r, g, b = table.unpack(nosColour[plate])
        end
        currentRBGCol = (Config.System.Menu == "ox") and (r..", "..g..", "..b)
            or "[<span style='color:#"..Helper.rgbToHex(r, g, b):upper()
                .."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black,"
                .." 0em 0em 0.5em white, 0em 0em 0.5em white'>"..r.." "..g.." "..b.."</span>]<br>"

        currentHEXCol = (Config.System.Menu == "ox") and Helper.rgbToHex(r, g, b):upper()
            or "[<span style='color:#"..Helper.rgbToHex(r, g, b):upper()
                .."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black,"
                .." 0em 0em 0.5em white, 0em 0em 0.5em white'>"
                ..Helper.rgbToHex(r, g, b):upper().."</span>]<br>"

        local PaintMenu = {}
        PaintMenu[#PaintMenu+1] = {
            header      = locale("paintRGB", "hexPickerLabel"),
            txt         = locale("common", "currentInstalled")..":"..br..currentHEXCol,
            onSelect    = function()
                NitrousColour.RGBHexMenu({ hex = true, currentCol = { r, g, b } })
            end,
        }
        PaintMenu[#PaintMenu+1] = {
            header      = locale("paintRGB", "rgbPickerLabel"),
            txt         = locale("common", "currentInstalled")..":"..br..currentRBGCol,
            onSelect    = function()
                NitrousColour.RGBHexMenu({ hex = false, currentCol = { r, g, b } })
            end,
        }

        openMenu(PaintMenu, {
            header    = locale("nosSettings", "nosColor"),
            headertxt = locale("paintRGB", "customHeader"),
            canClose  = true,
        })
    end

    RegisterNetEvent(getScript()..":client:NOS:rgbORhex", function()
        NitrousColour.RGBorHex()
    end)
end