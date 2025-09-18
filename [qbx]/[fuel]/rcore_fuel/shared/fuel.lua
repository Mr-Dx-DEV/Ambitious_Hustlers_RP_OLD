function GetGunFlowRatePerMinute(fuelType)
    return Config.FlowRatePerFuelType[fuelType] or Config.DispenserGunFlowRatePerMinuteInLiters
end

exports("GetGunFlowRatePerMinute", GetGunFlowRatePerMinute)

function GetGunFlowRateInMilliseconds(fuelType)
    return (60 * 1000) / (Config.FlowRatePerFuelType[fuelType] or Config.DispenserGunFlowRatePerMinuteInLiters)
end

exports("GetGunFlowRateInMilliseconds", GetGunFlowRateInMilliseconds)

function GetFuelLabelByType(type)
    return _U(type)
end

exports("GetFuelLabelByType", GetFuelLabelByType)

function GetVehicleFuelType(model)
    local vehicleClass = GetVehicleClassFromName(model)
    local data = Config.VehicleFuelType[model]
    if data then
        return data
    end

    local vehicleClassFuel = Config.SpecificFuelTypePerVehicleClass
    if vehicleClassFuel[vehicleClass] then
        local fuelTypes = vehicleClassFuel[vehicleClass]
        return fuelTypes[(model % #fuelTypes) + 1]
    end

    local vehicleTypeFuel = Config.RandomFuelTypesPerVehicleType[GetVehicleType(model)]
    if vehicleTypeFuel then
        return vehicleTypeFuel[(model % #vehicleTypeFuel) + 1]
    end

    return Config.DefaultRandomFuelTypes[(model % #Config.DefaultRandomFuelTypes) + 1]
end

exports("GetVehicleFuelType", GetVehicleFuelType)

function GetVehicleFuelTypeLabel(model)
    return _U(GetVehicleFuelType(model))
end

exports("GetVehicleFuelTypeLabel", GetVehicleFuelTypeLabel)