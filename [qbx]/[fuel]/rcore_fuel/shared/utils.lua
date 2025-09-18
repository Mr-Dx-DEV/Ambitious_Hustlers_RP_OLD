--- @param amount integer
--- add comma to separate thousands
--- stolen from: http://lua-users.org/wiki/FormattingNumbers
function CommaValue(amount)
    local formatted

    if GetDecimals(amount) >= 2 then
        formatted = RoundDecimalPlace(amount, 2)
    else
        formatted = math.floor(amount)
    end

    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

function GetDecimals(Num)
    local numStr = tostring(Num)
    local decimalPart = numStr:match("%.([^eE]+)")

    if decimalPart then
        return #decimalPart
    else
        return 0
    end
end

-- will round decimal place
function RoundDecimalPlace(number, decimal_places)
    local mult = 10 ^ (decimal_places or 0)
    return math.floor(number * mult) / mult
end

-- all measurement are in metric so no need to return anything specific for metric unit system.
function GetMeasurementUnits(value, type)
    if type == MeasurementTypes.KILOMETERS then
        -- from kilometers to miles.
        if Config.MeasurementUnits == MeasurementUnits.IMPERIAL then
            return value / 1.609
        end
    end

    if type == MeasurementTypes.LITERS then
        -- from liters to gallons
        if Config.MeasurementUnits == MeasurementUnits.IMPERIAL then
            return value * 0.219969
        end
    end
    if type == MeasurementTypes.METERS then
        -- from meters to feet
        if Config.MeasurementUnits == MeasurementUnits.IMPERIAL then
            return value * 3.281
        end
    end

    return value
end

function GetMeasurementTypeLabel(type)
    if type == MeasurementTypes.KILOMETERS then
        if Config.MeasurementUnits == MeasurementUnits.IMPERIAL then
            return "Miles"
        end
        return "KM"
    end

    if type == MeasurementTypes.LITERS then
        if Config.MeasurementUnits == MeasurementUnits.IMPERIAL then
            return "gallons"
        end
        return "liters"
    end
    if type == MeasurementTypes.METERS then
        -- from meters to feet
        if Config.MeasurementUnits == MeasurementUnits.IMPERIAL then
            return "feet"
        end
        return "meters"
    end
end