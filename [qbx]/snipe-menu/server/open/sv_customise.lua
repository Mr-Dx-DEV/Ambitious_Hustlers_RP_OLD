invalid = false

function GetPlayerIdentifiersList(source, type)
    local identifiers = GetPlayerIdentifiers(source)
    for _, identifier in pairs(identifiers) do
        if string.find(identifier, type) then
            return identifier
        end
    end
    return nil
end

-- This is used to fetch the necessary licenses that show on the player list. You can add more info here if you want.

function GetPlayerAllLicenses(id)
    local returnData = {}
    local licenses = GetPlayerIdentifiers(id)
    for k, v in pairs(licenses) do
        if string.match(v, "license:") then
            returnData[#returnData + 1] = v
        elseif string.match(v, "steam:") then
            returnData[#returnData + 1] = v
        elseif string.match(v, "discord:") then
            returnData[#returnData + 1] = v
        elseif string.match(v, "fivem:") then
            returnData[#returnData + 1] = v
        end
    end
    return returnData
end

RegisterServerEvent("snipe-menu:server:notifyAdmins", function(name)
    for k, v in pairs(onlineAdmins) do
        if v then
            ShowNotification(k, "New Admin message from: "..name, "success")
        end
    end
end)
