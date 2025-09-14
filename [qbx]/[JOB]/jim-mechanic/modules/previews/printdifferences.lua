PrevFunc.printDifferences = function(vehicle, properties, newproperties)
    local veh      = carMeta["search"]
    local vehplate = "["..trim(properties.plate).."]"
    local vehlist  = {}
    local modlist  = {}

    sendLog("Finished Previewing: ["..carMeta["plate"].."]")

    -- Some vehicles had an issue not resetting windows if changed, so we reset it manually:
    SetVehicleWindowTint(vehicle, properties["windowTint"])

    -- Compare newproperties vs old properties
    for k in pairs(newproperties) do
        if properties[k] ~= newproperties[k] then
            local conTable = {
                ["modSpoilers"]      = { mod = 0,  label = locale("checkDetails", "spoilersLabel").." - [", item = Items["spoiler"].label },
                ["modFrontBumper"]   = { mod = 1,  label = locale("checkDetails", "frontBumpersLabel").." - [", item = Items["bumper"].label },
                ["modRearBumper"]    = { mod = 2,  label = locale("checkDetails", "rearBumpersLabel").." - [", item = Items["bumper"].label },
                ["modSideSkirt"]     = { mod = 3,  label = locale("checkDetails", "skirtsLabel").." - [", item = Items["skirts"].label },
                ["modExhaust"]       = { mod = 4,  label = locale("checkDetails", "exhaustsLabel").." - [", item = Items["exhaust"].label },
                ["modGrille"]        = { mod = 6,  label = locale("checkDetails", "grillesLabel").." - [", item = Items["bumper"].label },
                ["modHood"]          = { mod = 7,  label = locale("checkDetails", "hoodsLabel").." - [", item = Items["hood"].label },
                ["modFender"]        = { mod = 8,  label = locale("checkDetails", "leftFenderLabel").." - [", item = Items["skirts"].label },
                ["modRightFender"]   = { mod = 9,  label = locale("checkDetails", "rightFenderLabel").." - [", item = Items["skirts"].label },
                ["modRoof"]          = { mod = 10, label = locale("checkDetails", "roofLabel").." - [", item = Items["roof"].label },
                ["modPlateHolder"]   = { mod = 25, label = locale("checkDetails", "plateHoldersLabel").." - [", item = Items["customplate"].label },
                ["modVanityPlate"]   = { mod = 26, label = locale("checkDetails", "vanityPlatesLabel").." - [", item = Items["customplate"].label },
                ["modTrimA"]         = { mod = 27, label = locale("checkDetails", "trimALabel").." - [", item = Items["externals"].label },
                ["modTrimB"]         = { mod = 44, label = locale("checkDetails", "trimBLabel").." - [", item = Items["externals"].label },
                ["modTrunk"]         = { mod = 37, label = locale("checkDetails", "trunksLabel").." - [", item = Items["externals"].label },
                ["modEngineBlock"]   = { mod = 39, label = locale("checkDetails", "engineBlocksLabel").." - [", item = Items["externals"].label },
                ["modAirFilter"]     = { mod = 40, label = locale("checkDetails", "airFiltersLabel").." - [", item = Items["externals"].label },
                ["modStruts"]        = { mod = 41, label = locale("checkDetails", "engineStrutLabel").." - [", item = Items["externals"].label },
                ["modArchCover"]     = { mod = 42, label = locale("checkDetails", "archCoversLabel").." - [", item = Items["externals"].label },
                ["modFrame"]         = { mod = 5,  label = locale("checkDetails", "rollCagesLabel").." - [", item = Items["rollcage"].label },
                ["modOrnaments"]     = { mod = 28, label = locale("checkDetails", "ornamentsLabel").." - [", item = Items["internals"].label },
                ["modDashboard"]     = { mod = 29, label = locale("checkDetails", "dashboardsLabel").." - [", item = Items["internals"].label },
                ["modDial"]          = { mod = 30, label = locale("checkDetails", "dialsLabel").." - [", item = Items["internals"].label },
                ["modDoorSpeaker"]   = { mod = 31, label = locale("checkDetails", "doorSpeakersLabel").." - [", item = Items["internals"].label },
                ["modSeats"]         = { mod = 32, label = locale("checkDetails", "seatsLabel").." - [", item = Items["seat"].label },
                ["modSteeringWheel"] = { mod = 33, label = locale("checkDetails", "steeringWheelsLabel").." - [", item = Items["internals"].label },
                ["modShifterLeavers"]= { mod = 34, label = locale("checkDetails", "shifterLeversLabel").." - [", item = Items["internals"].label },
                ["modAPlate"]        = { mod = 35, label = locale("checkDetails", "plaquesLabel").." - [", item = Items["internals"].label },
                ["modSpeakers"]      = { mod = 36, label = locale("checkDetails", "speakersLabel").." - [", item = Items["internals"].label },
                ["modHydrolic"]      = { mod = 38, label = locale("checkDetails", "hydraulicsLabel").." - [", item = Items["externals"].label },
                ["modAerials"]       = { mod = 43, label = locale("checkDetails", "aerialsLabel").." - [", item = Items["externals"].label },
                ["modTank"]          = { mod = 45, label = locale("checkDetails", "fuelTanksLabel").." - [", item = Items["externals"].label },
                ["modLivery"]        = { mod = 48, label = locale("checkDetails", "wrapLabel").." - [", item = Items["livery"].label },
            }

            if conTable[k] then
                local labelText = GetLabelText(GetModTextLabel(vehicle, conTable[k].mod, (newproperties[k])))
                vehlist[#vehlist+1] = conTable[k].label..tostring(newproperties[k] + 1)..". "..labelText.." ]"
                modlist[#modlist+1] = {
                    ["type"] = "("..labelText..")",
                    ["item"] = conTable[k].label..tostring(newproperties[k] + 1).." ] - "..conTable[k].item
                }
            end
        end
    end

    -- Paint differences
    for typeNo, typeName in pairs({
        "color1", "color2", "pearlescentColor", "wheelColor", "dashboardColor", "interiorColor"
    }) do
        if properties[typeName] ~= newproperties[typeName] then
            if type(newproperties[typeName]) ~= "table" then
                local paintTable = {
                    Loc[Config.Lan].vehicleResprayOptionsClassic,
                    Loc[Config.Lan].vehicleResprayOptionsMatte,
                    Loc[Config.Lan].vehicleResprayOptionsMetals,
                    Loc[Config.Lan].vehicleResprayOptionsChameleon
                }
                local typeList = {
                    [1] = locale("paintOptions", "metallicFinish"),
                    [2] = locale("paintOptions", "matteFinish"),
                    [3] = locale("paintOptions", "metalsFinish"),
                    [4] = locale("paintOptions", "chameleonFinish")
                }
                local paintNames = {
                    [1] = locale("paintOptions", "primaryColor"),
                    [2] = locale("paintOptions", "secondaryColor"),
                    [3] = locale("paintOptions", "pearlescent"),
                    [4] = locale("paintOptions", "wheelColor"),
                    [5] = locale("paintOptions", "dashboardColor"),
                    [6] = locale("paintOptions", "interiorColor"),
                }

                for k, v in pairs(paintTable) do
                    for i = 1, #v do
                        if newproperties[typeName] == v[i].id then
                            vehlist[#vehlist+1] =
                                paintNames[typeNo].." - [ "..v[i].name.." ("..typeList[k]..") ]"
                            modlist[#modlist+1] = {
                                ["type"] = v[i].name.." ("..typeList[k]..")",
                                ["item"] = paintNames[typeNo].." - "..Items["paintcan"].label
                            }
                        end
                    end
                end
            end
        end
    end

    -- Wheel differences
    for typeNo, typeName in pairs({ "modFrontWheels", "modBackWheels" }) do
        if properties[typeName] ~= newproperties[typeName] then
            local name     = ""
            local wheelCats= {
                { id = 0,  name = locale("rimsMod", "sportRims") },
                { id = 1,  name = locale("rimsMod", "muscleRims") },
                { id = 2,  name = locale("rimsMod", "lowriderRims") },
                { id = 3,  name = locale("rimsMod", "suvRims") },
                { id = 4,  name = locale("rimsMod", "offroadRims") },
                { id = 5,  name = locale("rimsMod", "tunerRims") },
                { id = 7,  name = locale("rimsMod", "highendRims") },
                { id = 8,  name = locale("rimsMod", "bennysOriginals") },
                { id = 9,  name = locale("rimsMod", "bennysBespoke") },
                { id = 10, name = locale("rimsMod", "openWheel") },
                { id = 11, name = locale("rimsMod", "streetRims") },
                { id = 12, name = locale("rimsMod", "trackRims") },
                { id = 6,  name = locale("rimsMod", "frontWheel") },
                { id = 7,  name = locale("rimsMod", "backWheel") },
            }

            for i = 1, #wheelCats do
                if newproperties["wheels"] == wheelCats[i].id then
                    name = wheelCats[i].name
                end
            end

            local originalWheel = GetVehicleWheelType(vehicle)
            SetVehicleWheelType(vehicle, newproperties["wheels"])

            vehlist[#vehlist+1] = (typeNo == 1 and "" or locale("common", "backButton"))
               .." Wheels - [ "..GetLabelText(GetModTextLabel(
                    vehicle,
                    (typeNo == 1 and 23 or 24),
                    newproperties[typeName]
                ))
               .." ("..newproperties[typeName]..") ("..name..") ]"
            modlist[#modlist+1] = {
                ["type"] = "("..name..")",
                ["item"] = (typeNo == 1 and "" or locale("common", "backButton")).." Wheels - [ " ..
                           GetLabelText(
                                GetModTextLabel(vehicle, (typeNo == 1 and 23 or 24), newproperties[typeName])
                           )
                          .." ("..newproperties[typeName]..") - "..Items["rims"].label
            }

            SetVehicleWheelType(vehicle, originalWheel)
        end
    end

    -- Plate differences
    if properties["plateIndex"] ~= newproperties["plateIndex"] then
        for k, v in pairs(Loc[Config.Lan].vehiclePlateOptions) do
            if newproperties["plateIndex"] == v.id then
                vehlist[#vehlist+1] = locale("checkDetails", "plateLabel").." - [ "..v.name.." ]"
                modlist[#modlist+1] = {
                    ["type"] = "("..v.name..")",
                    ["item"] = locale("checkDetails", "plateLabel").." - "..Items["customplate"].label
                }
            end
        end
    end

    -- Window tint differences
    if properties["windowTint"] ~= newproperties["windowTint"] then
        local name = ""
        if newproperties["windowTint"] == 0 then
            name = locale("common", "stockLabel")
        else
            for _, v in pairs(Loc[Config.Lan].vehicleWindowOptions) do
                if v.id == newproperties["windowTint"] then
                    name = v.name
                end
            end
        end
        vehlist[#vehlist+1] = locale("windowTints", "menuHeader").." - [ "..name.." ]"
        modlist[#modlist+1] = {
            ["type"] = "("..name..")",
            ["item"] = locale("windowTints", "menuHeader").." - "..Items["tint_supplies"].label
        }
    end

    -- Vehicle extras differences
    for k, v in pairs(newproperties["extras"]) do
        if properties["extras"][k] ~= newproperties["extras"][k] then
            vehlist[#vehlist+1] = locale("policeMenu", "extrasOption")
                                 .." - [ "..locale("policeMenu", "extraOption").." "..k..": "..(v and locale("common", "toggleOn") or locale("common", "toggleOff")).." ]"
            modlist[#modlist+1] = {
                ["type"] = "(Extra: "..k..": "..(v and locale("common", "toggleOn") or locale("common", "toggleOff"))..")",
                ["item"] = locale("policeMenu", "extrasOption").." - "..Items["externals"].label
            }
        end
    end

    -- Finalizing
    local hasPhone = false
    for _, v in pairs(Config.Previews.PhoneItems) do
        if Items[v] and hasItem(v) then
            hasPhone = true
            break
        end
        Wait(10)
    end

    if Config.Previews.PreviewPhone and hasPhone then
        if vehlist[1] then
            local newlist = ""
            for i = 1, #vehlist do
                newlist = newlist.."<br>"..vehlist[i]
            end
            local mailData = {
                sender  = vehplate,
                subject = veh,
                image   = "http://clipart-library.com/image_gallery2/Spanner-PNG-Image.png",
                message = veh.."<br>"..locale("checkDetails", "plateLabel")..": "..vehplate
                         .."<br><br>"..locale("previewSettings", "changesLabel")..": "..#vehlist.."<br>"
                         .." ----------------------- ".."<br>"..newlist
            }
            sendPhoneMail(mailData)
        end
    elseif not Config.Previews.PreviewPhone or not hasPhone then
        if vehlist[1] then
            local info = { veh = veh, vehplate = vehplate, vehlist = vehlist }
            currentToken = triggerCallback(AuthEvent)
            addItem("mechboard", 1, {
                description = string.format("Model: %s\nPlate: %s\n\nChanges: %s", info.veh, info.vehplate, #info.vehlist),
                info = info
            })
        end
    end

    if Config.Discord.DiscordPreview then
        if modlist[1] then
            local shopName = " - "..locale("common", "unknownStatus")
            local thumb    = "http://clipart-library.com/image_gallery2/Spanner-PNG-Image.png"
            local htmllink = Config.Discord.DiscordDefault
            local colour   = 16753920

            for k, v in pairs(Locations) do
                if inLocation == v.designatedName then
                    if v.discord.link ~= "" then
                        shopName = " - "..(v.blip and v.blip.label or locale("common", "notApplicable"))
                        thumb    = "" -- v.payments.img
                        htmllink = v.discord.link
                        colour   = v.discord.colour
                    end
                    break
                end
            end

            TriggerServerEvent(getScript()..":server:discordLog", {
                veh      = veh,
                vehplate = vehplate,
                modlist  = modlist,
                shopName = shopName,
                htmllink = htmllink,
                colour   = colour,
                thumb    = thumb
            })
        end
    end
end