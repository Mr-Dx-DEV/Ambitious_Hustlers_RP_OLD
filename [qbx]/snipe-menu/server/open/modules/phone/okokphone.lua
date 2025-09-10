if Config.Phone ~= "okokphone" then return end

function GetPlayerPhoneNumber(id)
    local phoneNumber = exports['okokPhone']:getPhoneNumberFromSource(source)
    if phoneNumber then
        return phoneNumber
    else
        return nil
    end
end