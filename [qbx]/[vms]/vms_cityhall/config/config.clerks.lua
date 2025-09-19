Config.ClerkMenu = {
    enabled = true,

    requiredJob = 'clerk',
    requiredGrades = {
        ['0'] = {
            label = 'Trainee',
            menuAccess = {
                -- The lack of options will prevent the menu from starting
            },
        },
        ['1'] = {
            label = 'Clerk',
            menuAccess = {
                ['players-and-vehicles'] = true,
            },
        },
        ['2'] = {
            label = 'Senior Clerk',
            menuAccess = {
                ['business-taxes'] = true,
                ['players-and-vehicles'] = true,
            },
        },
        ['3'] = {
            label = 'Department Head',
            menuAccess = {
                ['business-taxes'] = true,
                ['players-and-vehicles'] = true,
                ['employees'] = true,
            },
            allowEmployeesManage = false,
        },
        ['4'] = {
            label = 'Director',
            menuAccess = {
                ['business-taxes'] = true,
                ['players-and-vehicles'] = true,
                ['employees'] = true,
                ['boss-management'] = true,
            },
            needToBeBoss = true, -- need be the boss to grant this grade to an employee
            allowEmployeesManage = true,
            allowBalanceManage = false,
        },
        ['5'] = {
            label = 'Chief Executive Officer',
            menuAccess = {
                ['business-taxes'] = true,
                ['players-and-vehicles'] = true,
                ['employees'] = true,
                ['boss-management'] = true,
            },
            isBoss = true,
            needToBeBoss = true, -- need be the boss to grant this grade to an employee
            allowEmployeesManage = true,
            allowBalanceManage = true,
        }
    },
    -- societyName = 'society_clerk',
    
    command = 'clerk',
    description = 'Clerk Tablet',
    
    key = nil,
    
    item = 'clerk_tablet',

    debugZoneAccess = false, 
    useOnlyZoneAccess = false, -- If set to true, the menu will only be accessible within the zoneAccess
    zoneAccess = {
        vec2(-557.75, -275.48),
        vec2(-474.74, -241.77),
        vec2(-472.78, -238.14),
        vec2(-474.09, -230.38),
        vec2(-520.02, -151.72),
        vec2(-608.49, -187.8),
    },
    zoneAccessMinZ = 34.0,
    zoneAccessMaxZ = 60.0,
}


---@field UseBuildInCompanyBalance boolean: If you dont want to use the balance built into the Management Menu, set this to false and configure config.server.lua to be compatible with your server, for example a script for banks that may have company accounts
Config.UseBuildInCompanyBalance = true
Config.RemoveBalanceFromMenu = false -- if you are using other than our prepared esx_society or buildet-in balance, set it true

Config.ESXSocietyEvents = {
    ['check'] = 'esx_society:checkSocietyBalance',
    ['withdraw'] = 'esx_society:withdrawMoney',
    ['deposit'] = 'esx_society:depositMoney',
}

Config.RequiredJobToBeHired = 'unemployed'
