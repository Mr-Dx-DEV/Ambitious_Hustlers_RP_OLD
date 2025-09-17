Config                   = {}
Config.SQL               = "oxmysql"
Config.ServerName        = "Ambitious Hustlers RP"
Config.Thema             = "blue"            -- white, red, blue, green
Config.MoneyType         = "$"               -- €, $, £
Config.multipleRent      = true              -- If you want to allow multiple rents at the same time
Config.TestDrive         = true              -- If you want to allow test drives
Config.Framework         = "qb"              -- esx- oldesx - qb- oldqb
Config.VehicleGarageBool = false             -- If you want to use a garage system for rented vehicles
Config.TimeLeftCommand   = "timeleft"        -- Command to check the time left for the rented vehicle
Config.Inventory         = "ox_inventory"    -- qb_inventory / esx_inventory / ox_inventory / qs_inventory / codem-inventory
Config.vehicleSQL        = "player_vehicles" -- player_vehicles - owned_vehicles

if Config.Framework == "esx" or Config.Framework == "oldesx" then
    Config.vehicleSQL = "owned_vehicles"
else
    Config.vehicleSQL = "player_vehicles"
end
Config.DefaultBucket        = 0
Config.Interacted           = "ox-target" -- drawtext - qb-target - ox-target
Config.PaymentMethod        = "bank"      -- cash - bank
Config.TestDriveDefaultTime = 15          -- Default time for test drive -- minutes
Config.ReturnVehicle        = true        -- If you want to return the vehicle to the parking spot
Config.TestDrivePlate       = "TESTDRIVE" -- Plate for test drive vehicles

Config.DrawText             = {
    rentVehicle = "Press [~g~E~s~] to rent a vehicle.",
    returnVehicle = "Press [~g~E~s~] to return the vehicle."
}

Config.GiveItem             = true
Config.GiveItemName         = "rental_papers" -- If you want to give an item when the player rents a vehicle

Config.TaskWarpPlayer       = true            -- To teleport the player to the vehicle
Config.TimeRefresh          = 600000          -- Frequency of checking how much time the vehicles have left  - 10 Minutes

Config.Cars                 = {
    one = {
        {
            vehicleName = "blista",
            vehicleLabel = "Blista",
            vehiclePrice = 100,
            vehicleCategory = "Compacts",
            vehicleImage = "blista.png"
        },
        {
            vehicleName = "ingot",
            vehicleLabel = "Ingot",
            vehiclePrice = 800,
            vehicleCategory = "Sedans",
            vehicleImage = "ingot.png"
        },
        {
            vehicleName = "seminole",
            vehicleLabel = "Seminole",
            vehiclePrice = 800,
            vehicleCategory = "SUVs",
            vehicleImage = "seminole.png"
        },
        {
            vehicleName = "blista2",
            vehicleLabel = "Blista Compact",
            vehiclePrice = 1000,
            vehicleCategory = "Sports",
            vehicleImage = "blista2.png"
        },
        {
            vehicleName = "buffalo4",
            vehicleLabel = "Buffalo STX",
            vehiclePrice = 1000,
            vehicleCategory = "Coupes",
            vehicleImage = "buffalo.png"
        },
        {
            vehicleName = "chino",
            vehicleLabel = "Chino",
            vehiclePrice = 1000,
            vehicleCategory = "Muscle",
            vehicleImage = "chino.png"
        },
        {
            vehicleName = "gauntlet",
            vehicleLabel = "Gauntlet",
            vehiclePrice = 1000,
            vehicleCategory = "Sports Classics",
            vehicleImage = "gauntlet.png"
        },
        {
            vehicleName = "glendale",
            vehicleLabel = "Glendale",
            vehiclePrice = 1000,
            vehicleCategory = "Sports Classics",
            vehicleImage = "glendale.png"
        },
    },
    two = {
        {
            vehicleName = "seminole",
            vehicleLabel = "Seminole",
            vehiclePrice = 100,
            vehicleCategory = "SUVs",
            vehicleImage = "seminole.png"
        },
    },
}

Config.Locations            = {
    ['one'] = {
        ['vehicleLabel'] = 'Rent you',
        ['testdrivecoords'] = vector4(-297.44, -989.44, 30.9, 337.9),
        ['coords'] = vector4(-291.89, -985.96, 31.08, 340.31),
        ['carspawn'] = {
            vector4(-297.44, -989.44, 30.9, 337.9),
            vector4(-304.41, -986.97, 30.9, 338.73),
            vector4(-311.32, -984.52, 30.9, 339.77),
        },
        ['ped'] = 'a_m_m_hasjew_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Rent Vehicle',
        ["vehicleCategory"] = Config.Cars.one,
        ['showblip'] = true,
        ['blipname'] = 'Rent Vehicle',
        ['blipsprite'] = 38,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 38
    },
    ['two'] = {
        ['vehicleLabel'] = 'Rent you',
        ['testdrivecoords'] = vector4(1855.49, 2571.32, 45.49, 266.89),
        ['coords'] = vector4(1852.37, 2582.12, 45.67, 270.72),
        ['carspawn'] = {
            vector4(1855.78, 2578.98, 45.49, 271.03),
            vector4(1870.12, 2577.93, 45.49, 90.15),
            vector4(1870.33, 2570.86, 45.49, 91.36),
            vector4(1855.49, 2571.32, 45.49, 266.89),
        },
        ['ped'] = 'a_m_m_hasjew_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Rent Vehicle',
        ["vehicleCategory"] = Config.Cars.two,
        ['showblip'] = true,
        ['blipname'] = 'Rent Vehicle',
        ['blipsprite'] = 38,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 38
    },
}

Config.setFuel              = function(vehicle, fuel_level)
    if not DoesEntityExist(vehicle) then return end
    if GetResourceState("LegacyFuel") == "started" then
        return exports["LegacyFuel"]:SetFuel(vehicle, tonumber(fuel_level))
    elseif GetResourceState("cdn-fuel") == "started" then
        return exports["cdn-fuel"]:SetFuel(vehicle, tonumber(fuel_level))
    else
        return SetVehicleFuelLevel(vehicle, fuel_level + 0.0)
    end
end

Config.GiveVehicleKey       = function(plate, vehicle, createdVehicle)
    if GetResourceState("cd_garage") == "started" then
        TriggerEvent("cd_garage:AddKeys", exports["cd_garage"]:GetPlate(vehicle))
    elseif GetResourceState("qs-vehiclekeys") == "started" then
        model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    elseif GetResourceState("wasabi-carlock") == "started" then
        exports.wasabi_carlock:GiveKey(plate)
    elseif GetResourceState("qb-vehiclekeys") == "started" then
        TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", plate)
    end
end

Config.RemoveVehicleKey     = function(plate, vehicle, createdVehicle)
    if GetResourceState("cd_garage") == "started" then
        TriggerClientEvent('cd_garage:AddKeys', source, plate)
        TriggerEvent("cd_garage:AddKeys", plate)
    elseif GetResourceState("qs-vehiclekeys") == "started" then
        model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    elseif GetResourceState("wasabi-carlock") == "started" then
        exports.wasabi_carlock:GiveKey(plate)
    elseif GetResourceState("qb-vehiclekeys") == "started" then
        TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", plate)
    end
end

Config.Notification         = function(message, type, isServer, src) -- You can change here events for notifications
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end

Config.NotificationText     = {
    ['alreadyCar'] = {
        text = "You already have a rented vehicle",
        type = "error"
    },
    ['succespurchase'] = {
        text = "Purchase transaction successful",
        type = "success"
    },
    ['notEnoughMoney'] = {
        text = "You don't have enough money",
        type = "error"
    },
    ['dayAlert'] = {
        text = "You successfly rent this car until %s",
        type = "success"
    },
    ['noparkingspot'] = {
        text = "No available parking spot",
        type = "error"
    },
    ['returnVehicle'] = {
        text = "You have returned the vehicle",
        type = "success"
    },
    ['notRentalCar'] = {
        text = "This vehicle is not a rental car",
        type = "error"
    }
}
