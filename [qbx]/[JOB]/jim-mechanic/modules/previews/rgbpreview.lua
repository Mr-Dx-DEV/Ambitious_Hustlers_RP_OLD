PrevFunc.RGBPaint = {}

setTable = {}

PrevFunc.RGBPaint.Menu = function()
    if not isStarted(OXLibExport) then
        print("/previewrgb feature requires OX_Lib")
        return
    end
    if not Helper.canUsePreviewLocation() then return end
    local Ped = PlayerPedId()
    local vehicle = nil
    if not IsPedInAnyVehicle(Ped, false) then
        return triggerNotify(nil, locale("common", "needVehicle"), "error")
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
    end
    if not GetPedInVehicleSeat(vehicle, -1) == Ped then
        return triggerNotify(nil, locale("common", "needDriver"), "error")
    end

    local Menu = {}
    Menu[#Menu+1] = {
        header = locale("paintOptions", "primaryColor"),
        onSelect = function()
            -- Note: We keep the internal value "Primary" for logic purposes.
            PrevFunc.RGBPaint.Apply(vehicle, "Primary")
        end,
    }
    Menu[#Menu+1] = {
        header = locale("paintOptions", "secondaryColor"),
        onSelect = function()
            PrevFunc.RGBPaint.Apply(vehicle, "Secondary")
        end,
    }
    openMenu(Menu, {
        header = locale("previewSettings", "rgbPreviewToolHeader"),
        onExit = function()
            if IsCamActive(camTable[currentCam]) then
                camWasActive = true
                RenderScriptCams(false, true, 500, true, true)
            end
        end,
    })
end
RegisterNetEvent(getScript()..":client:Preview:RGBPaintMenu", PrevFunc.RGBPaint.Menu)


PrevFunc.RGBPaint.Apply = function(vehicle, paint)
    TriggerServerEvent(getScript()..":server:preview", true, VehToNet(vehicle), Helper.getTrimmedPlate(vehicle))

    local Ped = PlayerPedId()
    FreezeEntityPosition(Ped, true)
    setTable = {
        previewing = true,
        R = nil, G = nil, B = nil,
        isPriCustom = GetIsVehiclePrimaryColourCustom(vehicle),
        isSecCustom = GetIsVehicleSecondaryColourCustom(vehicle),
        finishes = {
            [1] = locale("paintOptions", "classicFinish"),
            [2] = locale("paintOptions", "matteFinish"),
            [3] = locale("paintRGB", "chromeLabel"),
            [4] = locale("paintOptions", "metalsFinish"):gsub("s", "")
        },
        finishId = {
            [1] = 147, [2] = 12, [3] = 120, [4] = 117
        },
        setFinish = 147,
        values = {},
    }
    if paint == "Primary" then
        setTable.R, setTable.G, setTable.B = GetVehicleCustomPrimaryColour(vehicle)
    else
        setTable.R, setTable.G, setTable.B = GetVehicleCustomSecondaryColour(vehicle)
    end

    setTable.colorPrimary, setTable.colorSecondary = GetVehicleColours(vehicle)
    for i = 1, 256 do setTable.values[i] = i-1 end -- make default table of 0 - 255
    local origProps = getVehicleProperties(vehicle)

    lib.registerMenu({
        id = "RBGPaintPreview",
        title = (paint == "Primary" and locale("paintOptions", "primaryColor") or locale("paintOptions", "secondaryColor")),
        position = "top-right",
        onSideScroll = function(selected, scrollIndex, _)
            if selected == 1 then setTable.setFinish = setTable.finishId[scrollIndex] end
            if selected == 2 then setTable.R = scrollIndex end
            if selected == 3 then setTable.G = scrollIndex end
            if selected == 4 then setTable.B = scrollIndex end
            if paint == "Primary" then
                SetVehicleCustomPrimaryColour(vehicle, setTable.R, setTable.G, setTable.B)
                SetVehicleColours(vehicle, setTable.setFinish, setTable.colorSecondary)
            else
                SetVehicleCustomSecondaryColour(vehicle, setTable.R, setTable.G, setTable.B)
                SetVehicleColours(vehicle, setTable.colorPrimary, setTable.setFinish)
            end
            pushVehicle(vehicle)
        end,
        onClose = function()
            PrevFunc.RGBPaint.Stop(Ped, vehicle, origProps, setTable)
            setTable.previewing = false
        end,
        onSelect = function()
            PrevFunc.RGBPaint.Stop(Ped, vehicle, origProps, setTable)
        end,
        options = {
            { label = locale("previewSettings", "finishOption"), icon = "spray-can", values = setTable.finishes },
            { label = locale("previewSettings", "redOption"), icon = "left-right", values = setTable.values, defaultIndex = setTable.R },
            { label = locale("previewSettings", "greenOption"), icon = "left-right", values = setTable.values, defaultIndex = setTable.G },
            { label = locale("previewSettings", "blueOption"), icon = "left-right", values = setTable.values, defaultIndex = setTable.B },
        }
    }, function()
        PrevFunc.RGBPaint.Stop(Ped, vehicle, origProps, setTable)
        setTable.previewing = false
    end)

    CreateThread(function()
        while true do
            Helper.propHoldCoolDown("clipboard")
            Wait(1000)
            if (#(GetEntityCoords(vehicle) - GetEntityCoords(Ped)) <= 5.0) and setTable.previewing then
                -- Continue previewing
            else
                PrevFunc.RGBPaint.Stop(Ped, vehicle, origProps, setTable)
                lib.hideMenu(true)
                break
            end
        end
    end)

    lib.showMenu("RBGPaintPreview")
end

PrevFunc.RGBPaint.Stop = function(Ped, vehicle, origProps, setTable)
    FreezeEntityPosition(Ped, false)
    if not setTable.isPriCustom then

        print("primary wasn't rgb originall, removing")
        ClearVehicleCustomPrimaryColour(vehicle)

    end
    if not setTable.isSecCustom then

        ClearVehicleCustomSecondaryColour(vehicle)

    end
    TriggerServerEvent(getScript()..":server:preview", false)
    Helper.removePropHoldCoolDown()

    setVehicleProperties(vehicle, origProps)
end