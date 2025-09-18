-- will display a help text on left top screen
function showHelpNotification(text)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, 5000)
end

RegisterNetEvent("rcore_buyradio:showNotification", showHelpNotification)

-- We will create a markers around the map that are defined in config
CreateThread(function()
    Wait(500)
    for k, v in pairs(Config.MarkerList) do
        local marker = createMarker()

        marker.setType(v.style)

        marker.setPosition(v.pos)
        marker.setScale(v.size)
        marker.setColor(v.color)
        marker.setInRadius(2.0)

        marker.setJob(v.job)

        marker.setRotation(v.rotate)
        marker.setFaceCamera(v.faceCamera)

        if v.onlyInVehicle then
            marker.setOnlyVehicle(v.onlyInVehicle)
        end

        marker.setKeys(Config.KeyListToInteract)

        -- on enter we will check if player is in vehicle if yes show open message of no show deny message.
        marker.on("enter", function()
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                showHelpNotification(_U("to_open_menu"))
            else
                showHelpNotification(_U("vehicle_needed"))
            end
        end)

        marker.on("leave", function()
            CloseAll()
        end)

        -- on key event we control if player is in vehicle if yes = open menu, if no = nothing will happen
        marker.on("key", function()
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                local menu = CreateMenu("carbuy")

                menu.SetPrimaryTitle(_U("menu_primary_title"))
                menu.SetSecondaryTitle(_U("menu_secondary_title", Config.RadioPrice))

                menu.SetProperties({
                    float = "right",
                    position = "middle",
                })

                menu.AddChoiceItem(_U("style_1"), {
                    {
                        label = _U("preview"),
                        style = 1,
                    },
                    {
                        label = _U("install"),
                        style = 1,
                    },
                })

                menu.AddChoiceItem(_U("style_2"), {
                    {
                        label = _U("preview"),
                        style = 2,
                    },
                    {
                        label = _U("install"),
                        style = 2,
                    },
                })

                -- or use another event
                menu.OnSelectEvent(function(index, data, isArrowKey)
                    if data.isChoice() and not isArrowKey then
                        if data.label == _U("preview") then
                            SendNUIMessage({ type = "preview", style = data.style })
                            SetNuiFocus(true, true)
                        end
                        if data.label == _U("install") then
                            TriggerServerEvent("rcore_buyradio:BuyRadioVehicle", data.style)
                            menu.Close()
                        end
                    end
                end)

                menu.AddItem(_U("remove_radio"), function()
                    TriggerServerEvent("rcore_buyradio:RemoveRadioVehicle")
                    menu.Close()
                end)

                menu.Open()
            end
        end)

        marker.render()
    end
end)

RegisterNUICallback("closePreview", function(data, cb)
    SetNuiFocus(false, false)
    if cb then
        cb(true)
    end
end)