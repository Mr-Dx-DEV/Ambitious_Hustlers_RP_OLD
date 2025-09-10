local function isDevMode(source)
    if source == nil then 
        print("snipe-menu: isDevMode() source is nil")
        return false 
    end
    return devMode[source]
end

exports('isDevMode', isDevMode)



local function isAdmin(src)
    return onlineAdmins[src]
end

exports('isAdmin', isAdmin)

local function GetAdminRoleName(src)
    if not onlineAdmins[src] then
        return false
    else
        local label = adminRoleLabel[src]
        for k, v in pairs(Config.GodRoles) do
            if v == label then
                return k
            end
        end
    end
end

exports('GetAdminRoleName', GetAdminRoleName)