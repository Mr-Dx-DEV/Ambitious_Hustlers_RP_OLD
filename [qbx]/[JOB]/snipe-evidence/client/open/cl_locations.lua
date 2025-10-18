if Config.InteractType == "drawtext" or Config.InteractType == "3dtext" then
    local currentLocation = nil
    local showingUI = false

    local function ShowUi(coords)
        if Config.InteractType == "drawtext" then
            lib.showTextUI(Locales["press_evidence"], {
                icon = "fa-solid fa-magnifying-glass",
            })
        end
    end

    local function HideUi()
        if Config.InteractType == "drawtext" then
            lib.hideTextUI()
        end
    end
    local function onInside(point)
        if point.isClosest and point.currentDistance < 2.0 and not showingUI then
            showingUI = true
            currentLocation = point.currentPoint
            ShowUi(point.coords)
        elseif showingUI and point.currentDistance > 2.0 and currentLocation == point.currentPoint  then
            HideUi()
            showingUI = false
            currentLocation = nil
        end
        if point.isClosest and point.currentDistance < 2.0 and Config.InteractType == "3dtext" then
            DrawText3D(point.coords, Locales["press_evidence"])
        end
        if point.isClosest and point.currentDistance < 2.0 and IsControlJustReleased(0, 38) then
            if not CanAccess() then
                ShowNotification(Locales["no_access"], "error")
                return
            end
            OpenEvidenceUI()
        end
    
    end

    for k, v in pairs(Config.LocationsToAccessCrimeScenes) do
        lib.points.new({
            coords = v,
            distance = 5.0,
            nearby = onInside,
            currentPoint = k,
        })
    end
end

if Config.InteractType == "interact" then
    for k, v in pairs(Config.LocationsToAccessCrimeScenes) do
        exports.interact:AddInteraction({
            coords = v,
            distance = 5.5,
            options = {
                {
                    label = 'Evidence',
                    action = function()
                        if not CanAccess() then
                            ShowNotification(Locales["no_access"], "error")
                            return
                        end
                        OpenEvidenceUI()
                    end,
                },
            }
        })
    end
end