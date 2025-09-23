Config = {}

Config.TestMode = false                   -- set to true to write prescriptions for yourself instead of the closest player
Config.Debug = false                      -- set to true to enable debug zones
Config.Target = true                    -- set to true if you want to use either ox_target, qb-target or qtarget. Set to false to use zones and TextUI

Config.Job = 'ambulance'                 -- job name           -- to write presctiptions (note to self: add support for multiple jobs)
Config.MinimumGrade = 3                  -- minimum job grade

Config.PharmacyJob = 'ambulance'         -- NEW IN 3.0: job name (Ambulance by default because EMS workers are always looking for more activities to do)
Config.PharmacyJobMinimumGrade = 2        -- NEW IN 3.0: job grade to access the pharamcy jobs
Config.PharmacySociety = 'ambulance'     -- NEW IN 3.0: ( NOTE: The money will ONLY go to the society IF the pharmacy is stocked up - If there is no stock, players can still collect prescriptions, but the money will NOT go to the society)

Config.ItemUse = true                    -- use item from inventory to activiate menu (true) or use command (false)
Config.ItemName = 'prescription_pad'     -- item name - only if Config.ItemUse is set to 'true'
Config.CommandName = 'prescription'      -- command name - only if Config.ItemUse is set to 'false'

Config.PrescriptionItem = 'prescription' -- item name for prescription receipt
Config.PayForMedication = true           -- set to true if you want to charge the player for the medication when collecting. If set to false, the player will not be charged.
Config.PaymentType = 'cash'              -- 'cash' or 'bank' or another account name
Config.MedicationCost = 250              -- BASE cost of medication - New in 3.0: Cost Per Dose is now added to Config.Medications table  - which will add to the base price - These prices will also be affected by different levels of insurance

Config.SideEffectsChance = 5             -- % chance of side effects

Config.CoughSyrupItem = 'cough_syrup'    -- item name for cough syrup - (use this item to craft Lean)
Config.LeanCupItem = 'lean_cup'          -- item name for lean cup - (must have this item on you to craft Lean)
Config.SprunkItem = 'sprunk_bottle'      -- item name for sprunk - (must have this item on you to craft Lean)
Config.LeanItem = 'lean'                 -- item name for lean - (Final Lean item)
Config.NarcanItem = 'narkan'                     -- item name for narcan - (use this item while NEXT TO ANOTHER PLAYER to stop them overdosing)

-- Database cleanup settings
Config.DatabaseCleanup = {
    Claims = 90,              -- Number of days to keep insurance claims (default 90 days)
    AdjusterActivity = 30,    -- Number of days to keep adjuster activity records (default 30 days)
    InactiveBans = 14         -- Number of days to keep inactive ban records after they've been unbanned (default 14 days)
}

Config.MeleeWeapons = { 'WEAPON_UNARMED', 'WEAPON_KNIFE', 'WEAPON_KNUCKLE', 'WEAPON_NIGHTSTICK', 'WEAPON_HAMMER',  -- Will get double damage if player has a weapon is on steroids
  'WEAPON_BAT', 'WEAPON_GOLFCLUB', 'WEAPON_CROWBAR', 'WEAPON_BOTTLE', 'WEAPON_DAGGER', 'WEAPON_HATCHET', 'WEAPON_MACHETE',
  'WEAPON_SWITCHBLADE', 'WEAPON_BATTLEAXE', 'WEAPON_POOLCUE', 'WEAPON_WRENCH', 'WEAPON_FLASHLIGHT',
  'WEAPON_STONE_HATCHET' }

Config.ServerSidePeds = true -- set to false if you want to use client-side peds instead of server-side peds (added for those with sync issues)


-- [❗ PLEASE NOTE ❗] --
-- WHEN UPGRADING TO 3.0: THE STRUCTURE OF THE MEDICATIONS TABLE HAS SLIGHTLY CHANGED!
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Config.Medications = { -- Add more drugs/medications here (you could edit effects and animations in client_open.lua)
  ['adrenaline'] = { item = 'adrenaline', label = 'Adrenaline', total = 3, effects = 'speed', sideEffects = 'blurryvision', anim = 'needle', costPerDose = 500 },
  ['steroids'] = { item = 'steroids', label = 'Steroids', total = 5, effects = 'strength', sideEffects = 'headaches', anim = 'pill', costPerDose = 100 },
  ['oxy'] = { item = 'oxy', label = 'Oxycontin', total = 10, effects = 'heal', sideEffects = 'drowsy', anim = 'pill', costPerDose = 50 },
  ['valium'] = { item = 'valium', label = 'Valium', total = 15, effects = 'stress', sideEffects = 'slow', anim = 'pill', costPerDose = 25 },
  ['xanax'] = { item = 'xanax', label = 'Xanax', total = 20, effects = 'armor', sideEffects = 'drowsy', anim = 'pill', costPerDose = 20 },

  -- Total = Max amount that can be prescribed!
  -- costPerDose = Extra Cost per dose of the medication

  -- 'cough_syrup' IS A GOOD EXAMPLE OF HOW TO ADD ITEMS TO BE PRESCRIBED VIA THIS SCRIPT - BUT TO HAVE THE EFFECTS BE HANDLED ELSEWHERE
  ['cough_syrup'] = { item = 'cough_syrup', label = 'Cough Syrup' }, -- Needed for Lean Crafting

  -- Uncomment the lines below if you want to use together with Wasabi Ambulance
  -- Download it here: https://store.wasabiscripts.com/package/5306547

  -- ['morphine30'] = {item = 'morphine30', label = 'Morphine 30MG', costPerDose = 100},
  -- ['morphine15'] = {item = 'morphine15', label = 'Morphine 15MG', costPerDose = 50},
  -- ['perc30'] = {item = 'perc30', label = 'Percocet 30MG', costPerDose = 100},
  -- ['perc10'] = {item = 'perc10', label = 'Percocet 10MG', costPerDose = 50},
  -- ['perc5'] = {item = 'perc5', label = 'Percocet 5MG', costPerDose = 25},
  -- ['vic10'] = {item = 'vic10', label = 'Vicodin 10MG', costPerDose = 50},
  -- ['vic5'] = {item = 'vic5', label = 'Vicodin 5MG', costPerDose = 25},




-- [❗ PLEASE NOTE ❗] --
-- WHEN UPGRADING TO 3.0: THE STRUCTURE OF THE PHARMACIES TABLE HAS CHANGED A LOT!
-----------------------------------------------------------------------------------------------------
}

Config.Pharmacies = {    -- [❗ NOTE: PRE-CONFIGURED FOR BRAND NEW ENVI-POPS-PILLS PHARMACY MAP! - GET IT HERE: https://envi-scripts.tebex.io/package/6784929 ❗ ]
  [1] = {
    id = 1,                         -- ID for this pharmacy
    netEntity = nil,                -- Added for Shoplifting System (New in 3.0)
    name = 'Pop\'s Pills Pharmacy', -- Added for Supplies System (New in 3.0)
    PedModel = "s_m_m_scientist_01",
    PedSpawnCoords = vector4(106.3716, 0.5345, 67.9312, 342.6946),
    PedInteractionRadius = 2.2,   -- NEW in 3.0.2
    PedBlip = {
      sprite = 51,
      scale = 0.75,
      colour = 38,
      display = 2,
      name = 'Pop\'s Pills Pharmacy',
      shortRange = true,
    },

    PedWalkCoords = vector4(106.0149, -0.6917, 67.9279, 161.8356),
    PharmacyAnimation = {
      dict = "anim@amb@business@bgen@bgen_inspecting@",
      anim = "inspecting_med_counting_02_inspector",
      flag = 49
    },

    EmployeeCounter = {           -- Enables an employyee counter where people with Config.PharmacyJob can do a few Player-To-Player interactions
                                  -- These include: Viewing Ban History, Taking a players prescription item and processing it, which will give them an extra reward of % of money taken
      coords = vector3(104.0633, 1.4082, 67.8259),
      distance = 0.8,
      drugCollectLocation = vector3(105.3853, 16.5593, 68.0727),
      drugCollectRadius = 0.8,
      features = {
        viewBanHistory = true,
        processPrescription = true,
        reward = 50, -- % of money taken goes to the employee and the rest goes to the society
      }
    },

    PharmacyRestocks = {
      menuLocation = vector3(117.1916, 8.3125, 67.8254),
      vehicleLocation = vector4(79.0531, 21.3949, 69.0612, 76.5318),
      cooldown = 10, -- cooldown in mins before restocking can start again
      vanModel = 'rumpo2',
      vehicleLivery = 1,
    },

    Robberies = { -- NEW FOR 3.0 - Shoplifting System
      enabled = true,
      busyChance = 10,   -- Chance of shopkeeper or CCTV catching you when the shopkeeper is busy
      defaultChance = 69, -- Chance of shopkeeper or CCTV catching you when the shopkeeper is not busy
      shelves = {
        [1] = {
          coords = vector3(107.8548, 4.5698, 67.8268),
          distance = 0.8,
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          cooldown = 5, -- cooldown (per shelf) in mins
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
        [2] = {
          coords = vector3(108.6813, 6.6053, 67.8268),
          distance = 0.8,
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          cooldown = 5, -- cooldown (per shelf) in mins
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
        [3] = {
          coords = vector3(110.9172, 8.7361, 67.8260),
          distance = 0.8,
          cooldown = 5, -- cooldown (per shelf) in mins
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
        [4] = {
          coords = vector3(112.9106, 7.9299, 67.8260),
          distance = 0.8,
          cooldown = 5, -- cooldown (per shelf) in mins
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
        [5] = {
          coords = vector3(106.6526, 4.9684, 67.8262),
          distance = 0.8,
          cooldown = 5, -- cooldown (per shelf) in mins
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
        [6] = {
          coords = vector3(107.4476, 6.9486, 67.8262),
          distance = 0.8,
          cooldown = 5, -- cooldown (per shelf) in mins
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
        [7] = {
          coords = vector3(100.6447, 5.0346, 67.8243),
          distance = 0.8,
          cooldown = 5, -- cooldown (per shelf) in mins
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          loot = {
            ['cough_syrup'] = {
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              min = 1,
              max = 1
            }
          }
        },
        [8] = {
          coords = vector3(101.3977, 7.0210, 67.8243),
          distance = 0.8,
          cooldown = 5, -- cooldown (per shelf) in mins
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
        [9] = {
          coords = vector3(102.2041, 9.0029, 67.8243),
          distance = 0.8,
          cooldown = 5, -- cooldown (per shelf) in mins
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
        [10] = {
          coords = vector3(102.9109, 10.7530, 67.8243),
          distance = 0.8,
          cooldown = 5, -- cooldown (per shelf) in mins
          rotation = 150.0,  -- NEW -- for target only
          size = vector3(1.0, 1.0, 2.0), -- NEW -- for target only
          loot = {
            ['cough_syrup'] = {
              label = 'Cough Syrup',
              min = 1,
              max = 2
            }, -- item name and max amount to loot
            ['pseudoephedrine'] = {
              label = 'Pack of Pseudo',
              min = 1,
              max = 5
            },
            ['eggtimer'] = {
              label = 'Egg Timer',
              min = 1,
              max = 1
            },
          }
        },
      }
    }
  },
}

-- Bans System for Shoplifting System (New in 3.0)
Config.Bans = {
  MaxDatabaseHistory = 90,      -- max number of days to keep a ban in the database - since the last expired ban (Auto Cleanup to Avoid Database Clogging)
  RepeatBanMultiplier = 2,      -- Days multiplier for each time caught shoplifting
  TimesCaughtBeforePermBan = 3, -- number of times caught before permanent ban
}

-- Prescription Records System
Config.MaxPrescriptionRecords = 100  -- max number of prescription records to keep in the database per doctor (Auto Cleanup to Avoid Database Clogging)

-- Pharmacy permissions by job grade
Config.PharmacyPermissions = {
  ViewRecords = 2,           -- Minimum grade to view prescription records
  SearchRecords = 2,         -- Minimum grade to search in prescription records
  ViewFlagged = 3,           -- Minimum grade to view flagged prescriptions
  FlagPrescription = 2,      -- Minimum grade to flag a prescription
  UnflagPrescription = 3,    -- Minimum grade to unflag a prescription
}

-- NEW FOR 3.0 --
-- Simple Medical Insurance System - Envi-Advanced-Insurance/Subscription-System Coming Soon?
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Config.InsuranceSystem = {
  Enabled = true,
  MaxDatabaseClaimsHistory = 25, -- max number of claims to keep in the database per player (Auto Cleanup to Avoid Database Clogging)
  MaxDatabaseClaimsDaysOld = 60, -- max number of days to keep a claim in the database (Auto Cleanup to Avoid Database Clogging)
  MaxDatabaseInactiveDays = 30,  -- max number of days since the insurance has become in to keep a player in the database (Auto Cleanup to Avoid Database Clogging)
  DefaultPlan = 'none',
  PaymentCycle = 7,              -- days between payments
  RejectionChance = {            -- chance of insurance rejecting a claim based on medication
    ['adrenaline'] = 5,          -- 5% chance of rejection
    ['oxy'] = 15,
    ['steroids'] = 30,
    ['valium'] = 5,
    ['xanax'] = 5,
    ['cough_syrup'] = 50,
    -- Add other medications here
  }
}

-- Insurance Job Settings - NEW!
Config.InsuranceJob = {
  Enabled = true,                 -- Set to true to enable the player-to-player insurance sales
  JobName = 'ambulance',          -- Job name for insurance providers
  MinimumGrade = 3,               -- Minimum job grade to sell insurance to other players
  BossGrade = 4,                  -- Minimum job grade to check all claim records and ban people from being able to access / buy insurance
  Commission = 10,                -- Percentage of the first payment that goes to the broker as commission
  SelfServiceEnabled = true,      -- Set to true to keep the self-service option available for players
}

Config.InsuranceMoneySociety = 'ambulance'   -- Society that recieve money from insurance payments, set to false to make the money disappear instead!

Config.InsurancePlans = {
  none = {
    name = "No Insurance",
    discount = 0,   -- 0% discount
    downpayment = 0,      -- no downpayment (normal price)
    description = "No medical coverage. You will pay full price for all medications.",
    fee = 0,
    cancelationFee = 1500,
    benefits = {},
    eligibleMedications = {}   -- empty means no medications covered
  },
  basic = {
    name = "Basic Coverage",
    discount = 30,   -- 30% discount on covered medications
    downpayment = 100,     -- $100 downpayment per prescription
    description = "Basic healthcare coverage for essential medications.",
    fee = 500,
    cancelationFee = 1500,
    benefits = {
      "Reduced prices on basic medications",
      "No coverage for specialized treatments",     -- examples of RP related things you can add here
      "One free health checkup per month"           -- examples of RP related things you can add here
    },
    eligibleMedications = {
      "oxy", "valium", "xanax"     -- only these medications are covered
    }
  },
  standard = {
    name = "Standard Coverage",
    discount = 50,   -- 50% discount on covered medications
    downpayment = 50,      -- $50 downpayment per prescription
    description = "Comprehensive coverage for most common treatments.",
    fee = 950,
    cancelationFee = 2000,
    benefits = {
      "Significant discounts on most medications",
      "Reduced downpayment costs",
      "Two free health checkups per month",       -- examples of RP related things you can add here
      "50% coverage for emergency treatments"     -- examples of RP related / export integration things you can add here
    },
    eligibleMedications = {
      "oxy", "valium", "xanax", "steroids", "cough_syrup"
    }
  },
  premium = {
    name = "Premium Coverage",
    discount = 85,   -- 85% discount on covered medications
    downpayment = 0,       -- no downpayment
    description = "Elite medical coverage with maximum benefits.",
    fee = 1800,
    cancelationFee = 3000,
    benefits = {
      "Maximum discount on all medications",
      "No downpayment fees",
      "Unlimited health checkups",                  -- examples of RP / export integration related things you can add here
      "Full coverage for emergency treatments",     -- examples of RP / export integration related things you can add here
    },
    eligibleMedications = {
      "all"     -- all medications covered
    }
  }
}

Config.InsuranceLocations = {
  [1] = {
    coords = vector3(110.1827, 15.0098, 66.8244),
    icon = 'fas fa-file-medical',
    distance = 2.0,
    rotation = 150.0,
    size = vector3(1.0, 1.0, 2.0),
  },
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- NEW FOR 3.0 --
-- Pharmacy Supplies System 
Config.SuppliesSystem = {
  Enabled = true,
  DefaultSupplies = 50,                     -- Starting supplies for each pharmacy
  MaxSupplies = 100,                        -- Maximum supplies a pharmacy can hold
  LowSupplyThreshold = 10,                  -- Notification threshold for low supplies
  CheckEvery = 1,                           -- Minutes between supply checks
  SuppliesPerRestock = 25,                  -- How many supplies are added per successful restock mission
  RestockReward = 500,                      -- Money rewarded to player for completing a restock mission
  BoxModel = 'xm3_prop_xm3_box_pharma_01a', -- Model for supply box
}

-- Restock Mission (New in 3.0)
Config.RestockMission = {
  MissionTimeout = 45,                  -- Minutes before restock mission fails
  VehicleModel = 'rumpo',               -- Default vehicle model for restock missions
  VehicleLivery = 1,                    -- Default livery for restock vehicles
  RestockCooldown = 2,                  -- Minutes before another restock can be initiated
  SupplyPedModel = 's_m_m_cntrybar_01', -- Ped model for supply pickup
  PickupAnimation = {
    dict = 'anim@heists@box_carry@',
    anim = 'idle',
    flag = 49
  },
  LoadAnimation = {
    dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
    anim = "machinic_loop_mechandplayer",
    flag = 49,
    doors = { 2, 3 } -- Door indexes that will be opened and closed when loading the supplies -- https://gtamods.com/wiki/SET_VEHICLE_DOOR_OPEN
  }
}

Config.PharmacyRestockMissionLocations = {
  [1] = {
    coords = vector3(-9.1247, -2535.9907, 7.3854),
    heading = 237.5113,
    distance = 2.0,
  },
  [2] = {
    coords = vector3(115.8958, -2688.9924, 6.0018),
    heading = 265.3506,
    distance = 2.0,
  },
  [3] = {
    coords = vector3(192.0927, -2226.7539, 6.9851),
    heading = 97.8723,
    distance = 2.0,
  },
  [4] = {
    coords = vector3(-375.0622, -424.0552, 31.1566),
    heading = 355.0202,
    distance = 2.0,
  },
  [5] = {
    coords = vector3(-3158.3723, 1095.2410, 20.8959),
    heading = 244.9649,
    distance = 2.0,
  },
  [6] = {
    coords = vector3(592.0750, 2744.6079, 42.0359),
    heading = 191.8587,
    distance = 2.0,
  },
  [7] = {
    coords = vector3(-172.8039, 6381.2095, 31.4728),
    heading = 243.4026,
    distance = 2.0,
  },
  [8] = {
    coords = vector3(151.4423, 6647.1738, 31.5963),
    heading = 183.1042,
    distance = 2.0,
  },
  [9] = {
    coords = vector3(748.8046, -528.9615, 27.7781),
    heading = 63.7618,
    distance = 2.0,
  },
  [10] = {
    coords = vector3(213.6679, -1835.1527, 27.5682),
    heading = 318.1909,
    distance = 2.0,
  },
  -- Add more locations if you like!
}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Notify(message, type, time)
  lib.notify({           -- OX Lib (Styled)
    id = 'prescription'..math.random(),
    title = 'Prescriptions',
    description = message,
    position = 'top',
    style = {
      backgroundColor = '#141517',
      color = '#909296'
    },
    icon = 'heartbeat',
    iconColor = '#C53030',
    length = time or 3000
  })
  -- Framework.Notify(message, type, time)  -- Normal Framwoek Notifys
end

function TextUI(textUILabel)
  lib.showTextUI(textUILabel, {
    position = "top-center",
    icon = 'fas fa-prescription-bottle-alt',
    style = {
      borderRadius = 3,
      backgroundColor = '#141517',
      color = '#68D391'
    }
  })
end

function HideTextUI()
  lib.hideTextUI()
end


