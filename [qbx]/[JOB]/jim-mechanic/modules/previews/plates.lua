PrevFunc.Plates = {}

PrevFunc.Plates.Menu = function()
    local PlateMenu, vehicle, Ped = {}, nil, PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
        if DoesEntityExist(vehicle) then
            if IsCamActive(camTable[currentCam]) then
                PlateMenu[#PlateMenu+1] = {
                    icon = "fas fa-camera",
                    header = "",
                    txt = locale("previewSettings", "classLabel")..": "..carMeta["class"]
                       ..br..locale("checkDetails", "plateLabel")..": "..carMeta["plate"]
                       ..br..locale("checkDetails", "valueLabel")..carMeta["price"]
                       ..br..carMeta["dist"],
                    onSelect = function()
                        PrevFunc.changeCamAngle()
                        PrevFunc.Plates.Menu()
                    end,
                }
            end

            for k, v in pairs(Loc[Config.Lan].vehiclePlateOptions) do
                PlateMenu[#PlateMenu + 1] = {
                    icon         = (GetVehicleNumberPlateTextIndex(vehicle) == v.id) and "fas fa-check" or "",
                    isMenuHeader = (GetVehicleNumberPlateTextIndex(vehicle) == v.id),
                    header       = k.." - "..v.name,
                    txt          = (GetVehicleNumberPlateTextIndex(vehicle) == v.id) and locale("common", "stockLabel") or "",
                    onSelect     = function()
                        PrevFunc.Plates.Apply(v.id)
                    end,
                    refresh      = true,
                }
            end

            openMenu(PlateMenu, {
                header    = carMeta["search"],
                onBack    = function()
                    PrevFunc.Main.Menu()
                end,
                onSelected= oldMenu,
            })
        end
    end
end

PrevFunc.Plates.Apply = function(index)
    local vehicle, Ped = nil, PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    if GetVehicleNumberPlateTextIndex(vehicle) == tonumber(index) then
        triggerNotify(nil, " "..locale("common", "alreadyInstalled"), "error")
        PrevFunc.Plates.Menu()
    elseif GetVehicleNumberPlateTextIndex(vehicle) ~= tonumber(index) then
        SetVehicleNumberPlateTextIndex(vehicle, index)
        PrevFunc.Plates.Menu()
    end
end