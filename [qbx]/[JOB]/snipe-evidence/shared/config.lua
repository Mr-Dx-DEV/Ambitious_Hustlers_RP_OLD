Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}


Config = {}
Config.Debug = false -- if you want to see debug messages in console, set this to true. It will show you what is happening in the background. (You can also use F8 console to see the messages)
-- if you have renamed your qb-core, es_extended, event names, make sure to change them. Based on this information your framework will be detected.
Config.FrameworkTriggers = {
    ["qbx"] = {
        ResourceName = "qbx_core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        OnJobUpdate = "QBCore:Client:OnJobUpdate",
        OnGangUpdate = "QBCore:Client:OnGangUpdate",
    },
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
Config.UseQBCoreVehicleLabels = false -- set to true if you use qb-core vehicles.lua label
Config.Notify = "ox" -- qb || ox || esx || okok
Config.ProgressBar = "ox" -- ox (qb is only for QBCore)

Config.ImageSaving = "fivemanage" -- fivemerr (Depending on what you choose, put your api key in server/open/sv_image_api.lua)
Config.ScreenshotResource = "screenshot-basic" -- screenshot-basic || screencapture

Config.Timer = {
    ["gunshot"] = 3, -- seconds delay between gunshot dropping 
    ["blood"] = 5 -- seconds delay between blood dropping
}

Config.Jobs = {
    ["police"] = true,
    ['bcso'] = true,
    ['sahp'] = true,
    ['rangers'] = true,
    ['sadoc'] = true,
    ['marshals'] = true,
}

Config.EditPerms = {
    ["police"] = 0, -- police grade 2 and above can edit the crime scene
    ['bcso'] = 0,
    ['sahp'] = 0,
    ['rangers'] = 0,
    ['sadoc'] = 0,
    ['marshals'] = 0
}

Config.InteractType = "target" -- 3dtext || drawtext || target || interact (to use interact, you need https://github.com/darktrovx/interact)

-- locations from where evidence ui can be opened
Config.LocationsToAccessCrimeScenes = {
    vector3(441.41, -995.99, 30.69), 
}

--[[
    1: 'top-left', 2: 'top-center', 3: 'top-right',
    4: 'bottom-left', 5: 'bottom-center', 6: 'bottom-right',
    7: 'left-center', 8: 'right-center'
]]--

-- choose the position number above
Config.Positions = {
    camera = 2,
    recreate = 2,
    recreatehelper = 'top-left', -- available option top-left, top-right, bottom-left, bottom-right
}

-- when used near a vehicle, it will give you access to the vehicle and give you keys. You can change the item name to your liking.
Config.AccessTool ={
    enabled = true,
    item = "accesstool",
    Keys = "qb" -- cd, mk, other (if you choose other, make changes in client/open/cl_accesstool.lua)
}

Config.NoProjectileIfWeaponSilenced = false -- if you want to disable projectile dropping when the weapon is silenced, set this to true

Config.GSR = {
    enabled = true,
    command = "gsr",
    allowcleaningGSRInWater = true, -- if you want to allow cleaning GSR when player goes near water body, set this to true (You can check all the logic to clean GSR in client/open/cl_gsr.lua)
    item = "gsrkit", -- item that will be used to check the GSR (set to nil if you dont want to use item)
}

-- to use BAC feature, you have to use exports exports["snipe-evidence"]:AddBac(level) to your own scripts where the player consumes alcohol.
Config.BAC = {
    enabled = true,
    removeBACtimer = 30, -- time in minutes to remove Blood alcoholo level from player. (keep it high number!)
    item = "backit", -- item that will be used to check the BAC (set to nil if you dont want to use item)
}

Config.CrimeSceneCleanupsForCivilians = { -- this evidence can only be picked up by civilians if they have a flashlight and the required item.
    ["blood"] = {
        enabled = true, -- if you want to allow civilians to clean blood from crime scene
        item = "bleach", -- item that will be used to clean the blood
        removeItemOnUse = false, -- if you want to remove the item when used to pick up the blood
    },
    ["casing"] = {
        enabled = true, -- if you want to allow civilians to clean casings from crime scene
        item = "evidence_tweezers", -- item that will be used to clean the casings
        removeItemOnUse = false, -- if you want to remove the item when used to pick up the casings
    },
    ["projectile"] = {
        enabled = true, -- if you want to allow civilians to clean projectile from crime scene
        item = "evidence_tweezers", -- item that will be used to clean the projectile
        removeItemOnUse = false, -- if you want to remove the item when used to pick up the projectile
    },
    ["vehiclefragment"] = {
        enabled = true, -- if you want to allow civilians to clean vehicle fragments
        item = "evidence_tweezers", -- item that will be used to clean the vehicle fragments
        removeItemOnUse = false, -- if you want to remove the item when used to pick up the vehicle fragments
    },
}

-- Please read the comments for each option below. You can enable/disable the evidence types you want to use. You can also change the percentage chance of dropping the evidence.
Config.VehicleEvidence = {
    enabled = true,
    fingerprint = true, -- drops fingerprint when player enters vehicle
    blood = true, -- drops blood when player is injured in vehicle (either shot or crashes)
    casing = true, -- drops casing when player shoots from vehicle
    fragment = true, -- drops vehicle fragment when vehicle is shot at or crashed
    Chance = {
        fingerprint = 100, -- percentage chance of dropping fingerprint in vehicle
        blood = 100, -- percentage chance of dropping blood in vehicle
        casing = 100, -- percentage chance of dropping casing in vehicle
        fragment = 100, -- percentage chance of dropping fragment in vehicle
    },

    -- speed Diff is high when the vehicle crashes into static frozen object like wall, pole, building etc
    -- damage Diff is high when the vehicle crashes into dynamic objects like other vehicles, peds
    -- this will require a lot of testing (enable debug and see the values in console) I have tested for a while and these values seem to work fine. You can change them to your liking.
    Crash = {
        debug = false, -- if you want to see debug messages in console, set this to true. It will show you what is happening in the background. (You can also use F8 console to see the messages)
        speedDiff = 2.0, -- minimum speed difference to consider it a crash (these numbers work a little differently than regular speed. You will have to test it out a bit to get the right feel)
        damageDiff = 2.0, -- minimum body health difference to consider it a crash (these numbers work a little differently than regular health. You will have to test it out a bit to get the right feel)
    }
}

-- Weapons that dont have fingerprints on the guns when used
-- weapons that by default dont have serial wont have any fingerprints so you dont have to add them here.
-- Serial number is required to recognize in the evidence ui.
-- Gloves logic still applies here if enabled in config
-- if same person keeps on using the gun, the fingerprint wont be added again and again. It will only add if a different person uses the gun.
Config.FingerPrintWeapons = {
    IgnoreWeapons = {
        ["WEAPON_STUNGUN"] = true,
    },
    -- Please keep this low so you are not overloading your inventory table because these are stored as part of metadata
    MaxFingerprintsOnGuns = 5, -- maximum number of fingerprints that can be left on a gun (if a 6th fingerprint is left, the oldest one will be removed which will be number 1) 
    Chance = 100, -- percentage chance of leaving fingerprint on gun when used/equipped
}

Config.Gloves = {
    enabled = true, -- if you want the gloves functionality enabled (add your gloves component in shared/gloves.lua)
    disableFingerprintIfGlovesOn = false, -- This will disable fingerpritns on casings if player is wearing gloves
}

-- You dont have to technically enable this. All the props are created properly and will not cause server crashes whatsoever. This is only if you want to cleanup and dont care about all the evidence. I WOULD NOT SUGGEST ENABLING THIS!!
Config.PeriodicCleanup = {
    enabled = false, 
    time = 60, -- check every x minutes
    deleteBefore = 120, -- evidence older than x minutes will be cleaned up
}

Config.WhitelistedWeapons = { -- weapons that wont drop bullet casings
    [`weapon_unarmed`] = true, 
    [`weapon_snowball`] = true,
    [`weapon_stungun`] = true,
    [`weapon_petrolcan`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fireextinguisher`] = true,
}

-- these are the images that will show in inventory on the item (These use my fivemanage but you can make your own and upload to any image hosting and paste it here)
Config.EvidenceImages = {
    ["projectile"] = "https://r2.fivemanage.com/t6XERDhAGAVuwaEs4RK6N/images/Projectile.png",
    ["casing"] = "https://r2.fivemanage.com/t6XERDhAGAVuwaEs4RK6N/images/Casing.png",
    ["vehiclefragment"] = "https://r2.fivemanage.com/t6XERDhAGAVuwaEs4RK6N/images/Fragment.png",
    ["blood"] = "https://r2.fivemanage.com/t6XERDhAGAVuwaEs4RK6N/images/Blood.png",
    ["casing_car"] = "https://r2.fivemanage.com/t6XERDhAGAVuwaEs4RK6N/images/Casing.png",
    ["blood_car"] = "https://r2.fivemanage.com/t6XERDhAGAVuwaEs4RK6N/images/Blood.png",
    ["fingerprintevidence"] = "https://r2.fivemanage.com/t6XERDhAGAVuwaEs4RK6N/image/FINGERPRINT.png",
    ["fingerprint_car"] = "https://r2.fivemanage.com/t6XERDhAGAVuwaEs4RK6N/image/FINGERPRINT.png",
}

Config.Props = {
    ["projectile"] = "max_crimeprop_green",
    ["casing"] = "max_crimeprop_cream",
    ["vehiclefragment"] = "max_crimeprop_grey",
    ["blood"] = "max_crimeprop_red",
    ["fingerprintevidence"] = "max_crimeprop_black",
}

-- DO NOT TOUCH BELOW THIS!!!!
for k, v in pairs(Config.FrameworkTriggers) do
    if GetResourceState(v.ResourceName) == "started" then
        if v.ResourceName == "qb-core" and GetResourceState("qbx_core") == "started" then
            Config.Framework = "qbx" -- prefer qbx over qb-core if both are started
        else
            Config.Framework = k
        end
        print("snipe-evidence: Detected framework as "..Config.Framework)
        break
    end
end