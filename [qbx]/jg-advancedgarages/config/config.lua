-----------------------------------------------------------------------------------
-- WAIT! Before editing this file manually, try our new easy configuration tool! --
--            https://configurator.jgscripts.com/advanced-garages                --
-----------------------------------------------------------------------------------
Config = {}

-- Localisation
Config.Locale = "en"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "USD"

-- Framework & Integrations
Config.Framework = "auto" -- or "QBCore", "Qbox", "ESX"
Config.FuelSystem = "ox_fuel" -- or "LegacyFuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "Renewed-Fuel", "rcore_fuel", "none"
Config.VehicleKeys = "qb-vehiclekeys" -- or "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "tgiann-hotwire" "none"
Config.Notifications = "auto" -- or "default", "okokNotify", "ox_lib", "ps-ui"
Config.Banking = "qb-management" -- or "qb-banking", "qb-management", "esx_addonaccount", "Renewed-Banking", "okokBanking", "fd_banking"
Config.Gangs = "auto" -- "qb-gangs", "rcore_gangs"

-- Draw text UI prompts (key binding control IDs here: https://docs.fivem.net/docs/game-references/controls/)
Config.DrawText = "jg-textui" -- or "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "[E] Open Garage"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "[E] Open Impound"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "[E] Store Vehicle"
Config.ExitInteriorKeyBind = 38
Config.ExitInteriorPrompt = "[E] Exit Garage"

-- Target
Config.UseTarget = false
Config.Target = "ox_target" -- or "qb-target"
Config.TargetPed = "s_m_y_valet_01"

-- Radial
Config.UseRadialMenu = true
Config.RadialMenu = "ox_lib"


-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = false

-- Vehicle Spawning & Storing
Config.DoNotSpawnInsideVehicle = false
Config.SaveVehicleDamage = true -- Save and apply body and engine damage when taking the vehicle out a garage
Config.AdvancedVehicleDamage = true -- use Kiminaze's VehicleDeformation
Config.SaveVehiclePropsOnInsert = true
Config.CheckVehicleModel = true -- Extra security

-- If you don't know what this means, don't touch this
-- If you know what this means, I do recommend enabling it but be aware you may experience reliability issues on more populated servers
-- Having significant issues? I beg you to just set it back to false before opening a ticket with us
-- HIGHLY recommended that you set Config.DoNotSpawnInsideVehicle = false if you decide to enable this
-- Want to read my rant about server spawned vehicles? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- Vehicle Transfers
Config.GarageVehicleTransferCost = 250 -- Cost to transfer between garages
Config.TransferHidePlayerNames = false
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = false
}
Config.DisableTransfersToUnregisteredGarages = false -- Potential hacking protection for vigilant servers - unregistered garages are ones created via events in third-party script integrations, such as housing scripts, and therefore could be prone to script kiddie attacks.

-- Prevent vehicle duplication
-- Learn more: https://docs.jgscripts.com/advanced-garages/vehicle-duplication-prevention
Config.AllowInfiniteVehicleSpawns = false -- Public & private garages
Config.JobGaragesAllowInfiniteVehicleSpawns = false -- Job garages
Config.GangGaragesAllowInfiniteVehicleSpawns = false -- Gang garages
Config.GarageVehicleReturnCost = 2500 -- "towing" tax if not placed back in garage after server restart; or if destroyed or underwater while left out
Config.GarageVehicleReturnCostSocietyFund = false -- Job name of society fund to pay return fees into (optional)

-- Public Garages
Config.GarageShowBlips = true
Config.GarageUniqueBlips = false
Config.GarageUniqueLocations = true
Config.GarageEnableInteriors = true
Config.GarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["Legion Square"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(215.09, -805.17, 30.81),
    spawn = {vector4(216.84, -802.02, 30.78, 69.82), vector4(218.09, -799.42, 30.76, 66.17), vector4(219.29, -797.23, 30.75, 65.4), vector4(219.59, -794.44, 30.75, 69.35), vector4(220.63, -792.03, 30.75, 63.76), vector4(206.81, -798.35, 30.99, 248.53)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Islington South"] = {
    coords = vector3(273.0, -343.85, 44.91),
    spawn = vector4(270.75, -340.51, 44.92, 342.03),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grove Street"] = {
    coords = vector3(14.66, -1728.52, 29.3),
    spawn = vector4(23.93, -1722.9, 29.3, 310.58),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Mirror Park"] = {
    coords = vector3(1032.84, -765.1, 58.18),
    spawn = vector4(1023.2, -764.27, 57.96, 319.66),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Beach"] = {
    coords = vector3(-1248.69, -1425.71, 4.32),
    spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Great Ocean Highway"] = {
    coords = vector3(-2961.58, 375.93, 15.02),
    spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy South"] = {
    coords = vector3(217.33, 2605.65, 46.04),
    spawn = vector4(216.94, 2608.44, 46.33, 14.07),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy North"] = {
    coords = vector3(1878.44, 3760.1, 32.94),
    spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["North Vinewood Blvd"] = {
    coords = vector3(365.21, 295.65, 103.46),
    spawn = vector4(364.84, 289.73, 103.42, 164.23),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grapeseed"] = {
    coords = vector3(1713.06, 4745.32, 41.96),
    spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Paleto Bay"] = {
    coords = vector3(107.32, 6611.77, 31.98),
    spawn = vector4(110.84, 6607.82, 31.86, 265.28),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Boats"] = {
    coords = vector3(-795.15, -1510.79, 1.6),
    spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
    distance = 20,
    type = "sea",
    hideBlip = false,
    blip = {
      id = 356,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Hangar"] = {
    coords = vector3(-1243.49, -3391.88, 13.94),
    spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
    distance = 20,
    type = "air",
    hideBlip = false,
    blip = {
      id = 359,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- Private Garages
Config.PrivGarageCreateCommand = "privategarages"
Config.PrivGarageCreateJobRestriction = {"realestate"}
Config.PrivGarageEnableInteriors = true
Config.PrivGarageHideBlips = false
Config.PrivGarageBlip = {
  id = 357,
  color = 0,
  scale = 0.5
}

-- Job Garages
Config.JobGarageShowBlips = true
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- admin only
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- admin only
Config.JobGarageUniqueBlips = false
Config.JobGarageUniqueLocations = true
Config.JobGarageEnableInteriors = true
Config.JobGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["Mechanic"] = {
    coords = vector3(157.86, -3005.9, 7.03),
    spawn = vector4(165.26, -3014.94, 5.9, 268.8),
    distance = 15,
    job = {"mechanic"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
    ["SAHP"] = {
    coords = vector3(2793.184, 4726.93, 46.566),
    spawn = vector4(2793.184, 4726.93, 46.566, 10.247),
    distance = 15,
    job = {"sahp"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "NF1", -- spawn code for vehicle
        plate = "SAHP", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2},
        maxMods = false
      },
      [2] = {
        model = "NF2",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2},
        maxMods = false
      },
      [3] = {
        model = "NF3",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [4] = {
        model = "NF4",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [5] = {
        model = "NF5",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [6] = {
        model = "NF6",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [7] = {
        model = "NF7",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [8] = {
        model = "NF8",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [9] = {
        model = "NF9",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [10] = {
        model = "NF10",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      }
    }
  },
      ["SAHP2"] = {
    coords = vector3(-3170.273, 1391.477, 20.624),
    spawn = vector4(-3170.273, 1391.477, 20.624, 316.573),
    distance = 15,
    job = {"sahp"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "NF1", -- spawn code for vehicle
        plate = "SAHP", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2},
        maxMods = false
      },
      [2] = {
        model = "NF2",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2},
        maxMods = false
      },
      [3] = {
        model = "NF3",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [4] = {
        model = "NF4",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [5] = {
        model = "NF5",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [6] = {
        model = "NF6",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [7] = {
        model = "NF7",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [8] = {
        model = "NF8",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [9] = {
        model = "NF9",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [10] = {
        model = "NF10",
        plate = "SAHP",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      }
    }
  },
    ["Rangers"] = {
    coords = vector3(-793.143, 5410.487, 34.234),
    spawn = vector4(-793.143, 5410.487, 34.234, 22.559),
    distance = 15,
    job = {"rangers"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "pranger1", -- spawn code for vehicle
        plate = "Ranger", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2},
        maxMods = false
      },
      [2] = {
        model = "pranger2",
        plate = "Ranger",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [3] = {
        model = "pranger3",
        plate = "Ranger",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [4] = {
        model = "pranger4",
        plate = "Ranger",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      }
    }
  },
    ["Blane County"] = {
    coords = vector3(1851.283, 3686.979, 33.993),
    spawn = vector4(1851.283, 3686.979, 33.993, 207.166),
    distance = 15,
    job = {"bcso"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "bcso1", -- spawn code for vehicle
        plate = "BCSO", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2},
        maxMods = false
      },
      [2] = {
        model = "bcso2",
        plate = "BCSO",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [3] = {
        model = "bcso3",
        plate = "BCSO",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [4] = {
        model = "bcso4",
        plate = "BCSO",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [5] = {
        model = "bcso5",
        plate = "BCSO",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      }
    }
  },
  ["LSPD"] = {
    coords = vector3(442.63, -988.378, 25.71),
    spawn = vector4(442.63, -988.378, 25.71, 86.661),
    distance = 15,
    job = {"police"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "11CVPI", -- spawn code for vehicle
        plate = "LSPD", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2},
        maxMods = false
      },
      [2] = {
        model = "14CHGR",
        plate = "LSPD",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [3] = {
        model = "14HOE",
        plate = "LSPD",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [4] = {
        model = "17F150",
        plate = "LSPD",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [5] = {
        model = "17SILV",
        plate = "LSPD",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [6] = {
        model = "18CHGR",
        plate = "LSPD",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      },
      [7] = {
        model = "20HOE",
        plate = "LSPD",
        minJobGrade = 0,
        livery = 2,
        extras = {1, 2},
        maxMods = false
      }
    }
  }
}

-- Gang Garages (QBCore/Qbox only by default)
Config.GangEnableCustomESXIntegration = false -- Set to true if you've added a custom system to cl/sv-functions.lua
Config.GangGarageShowBlips = true
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- admin only
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- admin only
Config.GangGarageUniqueBlips = false
Config.GangGarageUniqueLocations = true
Config.GangGarageEnableInteriors = true
Config.GangGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["The Lost MC"] = {
    coords = vector3(439.18, -1518.48, 29.28),
    spawn = vector4(439.18, -1518.48, 29.28, 139.06),
    distance = 15,
    gang = {"lostmc"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  }
}

-- Impound
Config.ImpoundCommand = "iv"
Config.ImpoundFeesSocietyFund = {"police", "sahp", "rangers", "bcso","sadoc", "marshals"} -- Job name of society fund to pay impound fees into (optional)
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundTimeOptions = {0, 1, 4, 12, 24, 72, 168} -- in hours
Config.ImpoundLocations = { -- IMPORTANT - Every impound name must be unique
  ["Impound A"] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = vector4(408.44, -1630.88, 29.29, 136.88),
    distance = 15,
    type = "car",
    job = {"police", "bcso", "sahp", "rangers", "sadoc", "marshals"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Impound B"] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 15,
    type = "car",
    job = {"police", "bcso", "sahp", "rangers", "sadoc", "marshals"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- Garage Interior
Config.GarageInteriorEntrance = vector4(227.96, -1003.06, -99.0, 0.0)
Config.GarageInteriorCameraCutscene = {
  vector4(227.96, -977.81, -98.99, 0.0), -- from
  vector4(227.96, -1006.96, -98.99, 0.0), -- to (this should be the entrance, or slightly further back from the entrance coords for a better final player transition)
}
Config.GarageInteriorVehiclePositions = {
  vector4(233.000000, -984.000000, -99.410004, 118.000000),
  vector4(233.000000, -988.500000, -99.410004, 118.000000),
  vector4(233.000000, -993.000000, -99.410004, 118.000000),
  vector4(233.000000, -997.500000, -99.410004, 118.000000),
  vector4(233.000000, -1002.000000, -99.410004, 118.000000),
  vector4(223.600006, -979.000000, -99.410004, 235.199997),
  vector4(223.600006, -983.599976, -99.410004, 235.199997),
  vector4(223.600006, -988.200012, -99.410004, 235.199997),
  vector4(223.600006, -992.799988, -99.410004, 235.199997),
  vector4(223.600006, -997.400024, -99.410004, 235.199997),
  vector4(223.600006, -1002.000000, -99.410004, 235.199997),
}

-- Staff Commands
Config.ChangeVehiclePlate = "vplate" -- admin only
Config.DeleteVehicleFromDB = "dvdb" -- admin only
Config.ReturnVehicleToGarage = "vreturn" -- admin only

-- Add your import vehicle's spawn name and desired label here for pretty vehicle names in the garage
-- This is mainly designed for ESX - if you are using QB, do this in shared!
Config.VehicleLabels = {
  ["spawnName"] = "Pretty Vehicle Label"
}

-- Block certain vehicles from being transferred to other players
Config.PlayerTransferBlacklist = {
  "spawnName"
}

Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = false
Config.__v3Config = true
Config.Debug = false