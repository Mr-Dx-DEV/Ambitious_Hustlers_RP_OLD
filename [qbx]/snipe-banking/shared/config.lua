Config = {}

-- if you have renamed your qb-core, es_extended, event names, make sure to change them. Based on this information your framework will be detected.
Config.FrameworkTriggers = {
    ["qb"] = {
        ResourceName = "qb-core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        OnJobUpdate = "QBCore:Client:OnJobUpdate",
        OnGangUpdate = "QBCore:Client:OnGangUpdate",
    },
    ["esx"] = {
        ResourceName = "es_extended",
        PlayerLoaded = "esx:playerLoaded",
        PlayerUnload = "esx:playerDropped",
        OnJobUpdate = "esx:setJob",
        OnPlayerUnload = "esx:onPlayerLogout",
    }
}

Config.Notify = "ox" -- qb || ox || esx || okok

-- ONLY FOR ESX, THIS IS BY DEFAULT SET TO TRU IF YOU ARE USING QBCore
Config.JobAccounts = true -- If you want to use job accounts inside my banking, set this to true

-- char id for ESX and citizenid for QBCore
Config.DefaultIdentifier = "12345" -- set the identifier for the player to whom the loans should be transferred when a player who has given out loans deletes their character


Config.Options = "target" -- target || drawtext || 3dtext (if draw text, it will show draw text ui using lib or if you select target, it will be target based. 3d text is 3d text Code is open in client/open/cl_locations.lua)

Config.Interact = true -- if you want to use the interact (https://github.com/darktrovx/interact) Only works with the Config.Options is "target"

Config.BankConfig = "default" -- gabz || default (If you use some other banks, make sure to create a file in locations folder and put the file name here!!)

-- if true, only one person can access one atm model at one time. If false, multiple people can access the same atm model at the same time.
Config.OnlyOnePersonToAccessOneATMAtOneTime = false

Blips = {
    unique_blips = false, -- this will create each blip which will show individually in the side bar. If you see flashing side bar due to the high number of blips, set this to false.
    blip_scale = 0.5,
    blip_sprite = 108,
    generic_blip_label = "Bank", -- only shows if you set unique_blips to false
    generic_blip_color = 2 -- only shows if you set unique_blips to false
}

-- the vector is offset (x, y, z) from the object for the interact
Config.ATMModels = {
    [`prop_atm_01`] = vec3(0.0, 0.0, 1.0),
    [`prop_atm_02`] = vec3(0.0, 0.0, 1.0),
    [`prop_atm_03`] = vec3(0.0, 0.0, 1.0),
    [`prop_fleeca_atm`] = vec3(0.0, 0.0, 1.0)
}


Config.AllowLoans = true -- Do you want evenyone to see the loans tab in the bank.

Config.AnyOneCanCreateLoans = true -- set to true if you want any to create loans, if you set this to false, make sure to change the job names in Config.LoanJobs
Config.LoanJobs = { -- job with grade. If you want to add more jobs, just add the job name and grade. For example, ["police"] = 0, ["judge"] = 0. Anyone with grade mentioned and above can create loans. This logic can be changed in cl_loans_customise
    ["police"] = 0,
}

-- this is the place from which only the manage UI will open. So for example, you can put this in the police station or cityhall from where police/judges can freeze/flag accounts.
Config.ManagementLocations = {
    vector3(441.16, -978.85, 30.69)
}

Config.SupervisorJobs = { -- jobs that can manage the accounts like freeze/manage/export transactions for anyone
    ["police"] = 4,
}

Config.Dispatch = "cd" -- cd || ps || moz || other (if you select other, you will have to add your own dispatch alert from the function SendPoliceAlertForFlaggedAccount() in client/open/cl_customise.lua)

Config.Progress = "ox" -- "ox" || "qb"

-- ONLY FOR ESX
-- if you have any job that starts with off, make sure to add it here. For example, if you have a job called office, you can add it here and it will be shown in the job list.
-- I have added clause for off duty jobs and I neglect all the jobs that start with off, so if you have any job that starts with off, make sure to add it here.
-- do not add off duty jobs here (eg .offpolice)
Config.WhitelistJobsThatStartWithOff = {
    ["office"] = true 
}

-- DO NOT TOUCH THIS!!!!

for k, v in pairs(Config.FrameworkTriggers) do
    if GetResourceState(v.ResourceName) == "started" then
        Config.Framework = k
        break
    end
end
