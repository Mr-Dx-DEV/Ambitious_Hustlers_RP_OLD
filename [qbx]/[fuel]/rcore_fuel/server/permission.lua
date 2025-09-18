local SharedGroups = {}
if Config.Framework.Active == Framework.ESX then
    SharedGroups = { "user", "mod", "moderator", "help", "helper", "admin", "superadmin", "god", }
end

if Config.Framework.Active == Framework.QBCORE then
    if not SharedObject or not SharedObject.Config or not SharedObject.Config.Server or not SharedObject.Config.Permissions then
        SharedGroups = { "user", "mod", "moderator", "help", "helper", "admin", "superadmin", "god" }
    else
        SharedGroups = SharedObject.Config.Server.Permissions
    end
end

CreateThread(function()
    local permissionGroup = DeepCopy(Config.PermissionGroup)
    for framework, v in pairs(permissionGroup) do
        for index, _v in pairs(v) do
            for key, permissions in pairs(_v) do
                Config.PermissionGroup[framework][index][key] = nil
                Config.PermissionGroup[framework][index][permissions] = true
            end
        end
    end
end, "permission convert")

for k, v in pairs(SharedGroups) do
    ExecuteCommand(("add_ace qbcore.%s rcore_perm.%s allow"):format(v, v))
    ExecuteCommand(("add_ace group.%s rcore_perm.%s allow"):format(v, v))
end

local grantedPermission = {}
RegisterCommand('fuelgrantpermission', function(source, args, user)
    if source ~= 0 then
        TriggerClientEvent('chat:addMessage', source, { args = { "This command can be used ONLY in console! The 'Live Console' in txadmin panel." } })
        return
    end

    if args[1] == nil then
        print("Please use command: /fuelgrantpermission [player ID] | Example: /fuelgrantpermission 7")
        return
    end

    local sourceNumber = tonumber(args[1])

    if not sourceNumber then
        print("The player ID has to be number!")
        return
    end

    if grantedPermission[sourceNumber] ~= nil then
        print("This player has already temporary permission!")
        return
    end

    grantedPermission[sourceNumber] = true
    print("You granted temporary permission to the user with server ID: ", sourceNumber, "The permission last 60 minutes")
    Wait(1000 * 60 * 60)

    grantedPermission[sourceNumber] = nil
end)

function IsPlayerInGroup(source, groups, acePermission)
    if grantedPermission[source] then
        return true
    end

    if acePermission then
        if IsPlayerAceAllowed(source, acePermission) then
            return true
        end
    end

    if Config.Framework.Active == Framework.QBCORE then
        for k, v in pairs(groups) do
            if IsPlayerAceAllowed(source, "rcore_perm." .. v) then
                return true
            end
        end
    end

    if Config.Framework.Active == Framework.ESX then
        local xPlayer = SharedObject.GetPlayerFromId(source)
        if xPlayer then
            for k, v in pairs(groups) do
                if xPlayer.getPermissions then
                    if Config.PermissionGroup.ESX[1][xPlayer.getPermissions()] then
                        return true
                    end
                end
                if xPlayer.getGroup then
                    if Config.PermissionGroup.ESX[2][xPlayer.getGroup()] then
                        return true
                    end
                end
            end
        end
    end
    return false
end

registerCallback("rcore_fuel:hasPermission", function(source, cb, groups, acePermission)
    cb(IsPlayerInGroup(source, groups, acePermission))
end)