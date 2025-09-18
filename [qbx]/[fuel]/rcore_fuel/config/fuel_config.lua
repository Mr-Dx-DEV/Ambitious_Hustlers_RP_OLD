-- debug
Config.FuelDebug = false

-- How long the fuel nozzle can get before breaking completely?
Config.RopeDistanceBeforeBreak = 10

-- fuel units label
Config.FuelTypeUnitsMeasurementsUnits = {
    [MeasurementUnits.METRIC] = {
        [FuelType.NATURAL .. "_unit"] = "liters",
        [FuelType.DIESEL .. "_unit"] = "liters",
        [FuelType.EV .. "_unit"] = "kWh",
        [FuelType.LPG .. "_unit"] = "liters",
        [FuelType.CNG .. "_unit"] = "liters",
        [FuelType.MILK .. "_unit"] = "liters",
        [FuelType.AVIATION .. "_unit"] = "liters",
    },

    [MeasurementUnits.IMPERIAL] = {
        [FuelType.NATURAL .. "_unit"] = "gallons",
        [FuelType.DIESEL .. "_unit"] = "gallons",
        [FuelType.EV .. "_unit"] = "kWh",
        [FuelType.LPG .. "_unit"] = "gallons",
        [FuelType.CNG .. "_unit"] = "gallons",
        [FuelType.MILK .. "_unit"] = "gallons",
        [FuelType.AVIATION .. "_unit"] = "gallons",
    },
}

-- will the fuel overflow? if player wont stop tanking after 100% it will simply start going outside the fuel
Config.OverflowFuel = false

-- what types of vehicles will have disabled fuel consumption?
Config.IsVehicleTypeAllowed = {
    Bicycle = false,
    Bike = true,
    Boat = false,
    Car = true,
    Heli = true,
    Jetski = true,
    Plane = true,
    QuadBike = true,
    Train = false,
    AmphibiousCar = true,
    AmphibiousQuadbike = true,
}

-- this will disable only specific model
Config.DisableFuelFeatureForModel = {
    "bmx",
}

-- this will enable specific model to use fuel, it will ignore the "Config.DisableFuelFeatureForModel" and "Config.IsVehicleTypeAllowed"
Config.WhitelistFuelFeatureForModel = {
    --"sultan",
}

-- size of the jerry can ( in liters )
Config.JerryCanLitersSize = 20

-- after vehicle reach 140km/h the fuel will take least possible (most efficient way to drive)
Config.SpeedLimitCapForMinFuelTake = 140

-- after vehicle reach this speed it will start to consume more again
Config.MinimumSpeedForIncreasingFuelConsumption = 160

-- this will allow to refuel only specific types
Config.JerrycanRefuelingAllowedForSpecificTypes = {
    FuelType.NATURAL,
    FuelType.DIESEL,
}

-- Should we allow player to tank whatever he wants or not?
-- if he will pump natural into diesel the engine will result in failure and break
-- true = the script wont allow him to do that
-- false = the script will let him do whatever he wants after all he is already adult and got some responsibilities doesn't he?
Config.CheckForFuelType = true

-- example: EV dispenser gun cannot possibly be plug into NATURAL, DIESEL vehicles.
-- So this will prevent people sticking stuff where they are not suppose to
-- you can view all FuelType in const.lua
Config.DenyFuelingFromTypeFuelForTypeFuel = {
    [FuelType.EV] = { FuelType.NATURAL, FuelType.DIESEL, FuelType.LPG, FuelType.CNG, FuelType.AVIATION },
    [FuelType.LPG] = { FuelType.NATURAL, FuelType.DIESEL, FuelType.EV, FuelType.CNG, FuelType.AVIATION, },
    [FuelType.CNG] = { FuelType.NATURAL, FuelType.DIESEL, FuelType.EV, FuelType.LPG, FuelType.AVIATION },

    [FuelType.NATURAL] = { FuelType.EV, FuelType.LPG, FuelType.AVIATION },
    [FuelType.DIESEL] = { FuelType.EV, FuelType.LPG, FuelType.AVIATION },

    [FuelType.AVIATION] = { FuelType.NATURAL, FuelType.DIESEL, FuelType.EV, FuelType.LPG, },
}

-- some types of fuel type doesnt make sense to have the liquid sound effect here is the list
-- which have disabled that sound effect
-- you can view all FuelType in const.lua
Config.NonLiquidFueLTypes = {
    FuelType.EV,
    FuelType.LPG,
    FuelType.CNG,
}

-- if the player does pump wrong fuel type into his vehicle then how many meters is he allowed to drive
-- before his engine breaks?
Config.VehicleFailureMileage = 100

-- if the fuel level will go below certain percentage level should be turn off the engine?
Config.DisableEngineAfterCertainFuelLevel = {
    -- if EV percentage of fuel will be below 3.5% it will turn off the engine until player wont recharge his vehicle.
    [FuelType.EV] = 3.5,

    [FuelType.NATURAL] = -99,
    [FuelType.DIESEL] = -99,
    [FuelType.LPG] = -99,
    [FuelType.CNG] = -99,
    [FuelType.MILK] = -99,
    [FuelType.AVIATION] = -99,
}

-- in one minute player will be able to tank 60 liters to his tank
-- more realistic number would be 15L per minute but I don't recommend it because it would take just too long
-- the game it self is not reality and not everything should be as real as possible :D
Config.DispenserGunFlowRatePerMinuteInLiters = 60

-- if you need specific gun flow rate for specific fuel type
Config.FlowRatePerFuelType = {
    [FuelType.EV] = 25,
    [FuelType.LPG] = 30,
}

-- this option is how much kilometers vehicle has to drive in order to take full amount of liters defined above
Config.ConsumptionWLTP = 10

-- Fuel consumption per weather type ( it is in liters )
Config.FuelConsumptionPerWeatherType = {
    ["CLEAR"] = 0,
    ["EXTRASUNNY"] = 0,
    ["CLOUDS"] = 0,
    ["OVERCAST"] = 0,
    ["RAIN"] = 1,
    ["CLEARING"] = 1,
    ["THUNDER"] = 2,
    ["SMOG"] = 0,
    ["FOGGY"] = 0,
    ["XMAS"] = 0,
    ["SNOW"] = 2,
    ["SNOWLIGHT"] = 1,
    ["BLIZZARD"] = 3,
    ["HALLOWEEN"] = 0,
    ["NEUTRAL"] = 0,
}

-- this will force reverse use for consumption of fuel.
-- meaning instead of driving slow = higher consumption it will have lower consumption and higher on fast driving
-- you can find all classes here: https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.ForceSpecificClassToUseReverseConsumption = {
    4, 5, 6, 7
}

-- this will force reverse use for consumption of fuel.
-- meaning instead of driving slow = higher consumption it will have lower consumption and higher on fast driving
Config.ForceSpecificVehicleModelToUseReverseConsumption = {
    --"sultan",
}

-- if you force specific class but want specific model to not be reversed then whitelist the model here
Config.IgnoreSpecificVehicleModelToUseReverseConsumption = {
    "sultan",
}

-- this number represent liters (according to google 55 is average size of fuel tank in vehicle, you can increase it if you want to
-- or you can only increase the fuel capacity for certain model below this configuration)
-- (if somehow the car doesn't have any vehicle class so the default will be 55)
Config.MaxFuel = 55

-- this will set for each vehicle class fuel tank size
Config.VehicleClassAverageFuelTankSize = {
    [0] = 55.0, -- Compacts
    [1] = 65.0, -- Sedans
    [2] = 70.0, -- SUVs
    [3] = 60.0, -- Coupes
    [4] = 70.0, -- Muscle
    [5] = 75.0, -- Sports Classics
    [6] = 75.0, -- Sports
    [7] = 85.0, -- Super
    [8] = 15.0, -- Motorcycles
    [9] = 85.0, -- Off-road
    [10] = 150.0, -- Industrial
    [11] = 110.0, -- Utility
    [12] = 75.0, -- Vans
    [13] = 0.0, -- Cycles
    [14] = 150.0, -- Boats
    [15] = 400.0, -- Helicopters
    [16] = 800.0, -- Planes
    [17] = 85.0, -- Service
    [18] = 85.0, -- Emergency
    [19] = 150.0, -- Military
    [20] = 150.0, -- Commercial
    [21] = 150.0, -- Trains
    [22] = 55.0, -- Open Wheel
}

-- custom list with custom values for each car you want
Config.CustomFuelCapacity = {
    {
        model = "phantom3",
        maxFuel = 300,
    },
}

-- tank size per fuel type
Config.AverageFuelTankSizePerFuelType = {
    --[[
    [FuelType.EV] = {
        [0] = 55.0, -- Compacts
        [1] = 65.0, -- Sedans
        [2] = 70.0, -- SUVs
        [3] = 60.0, -- Coupes
        [4] = 70.0, -- Muscle
        [5] = 75.0, -- Sports Classics
        [6] = 75.0, -- Sports
        [7] = 85.0, -- Super
        [8] = 15.0, -- Motorcycles
        [9] = 85.0, -- Off-road
        [10] = 150.0, -- Industrial
        [11] = 110.0, -- Utility
        [12] = 75.0, -- Vans
        [13] = 0.0, -- Cycles
        [14] = 150.0, -- Boats
        [15] = 400.0, -- Helicopters
        [16] = 800.0, -- Planes
        [17] = 85.0, -- Service
        [18] = 85.0, -- Emergency
        [19] = 150.0, -- Military
        [20] = 150.0, -- Commercial
        [21] = 150.0, -- Trains
        [22] = 55.0, -- Open Wheel
    },
    --]]
}

-- custom offset for fueling vehicle ( note: this will replace all existing offsets in "fueling_offset.json" )
Config.CustomOffsetForFuelingVehicle = {
    --[[
    {
        model = "police",

        -- this offset + heading will result the player tanking the fuel into his trunk so use this just as an example.
        offset = vector3(0.62, -3.15, 0),
        heading = 0.0,
    },
    --]]
}


-- this will get selected based on model hash of the vehicle. It will be randomized per model hash but it will persists on the model unless the types get
-- shuffled/added new one
-- you can view all FuelType in const.lua
Config.DefaultRandomFuelTypes = {
    FuelType.DIESEL,
    FuelType.NATURAL,
}

-- this will force fuel type for specific type
-- you can view all FuelType, VehicleTypes in const.lua
Config.RandomFuelTypesPerVehicleType = {
    [VehicleTypes.HELI] = { FuelType.AVIATION, },
    [VehicleTypes.PLANE] = { FuelType.AVIATION, },
}

-- if you want to set specific model to specific fuel type you can do that here
-- the types are generated based by model hash not by reality its better than mapping all 700 vehicles right? :D
-- you can view all FuelTypes in const.lua

-- if you want to set specific model to specific fuel type you can do that here
-- the types are generated based by model hash not by reality its better than mapping all 700 vehicles right? :D
-- you can view all FuelTypes in const.lua
Config.VehicleFuelType = {
    {
        model = "phantom3",
        fuelType = FuelType.DIESEL,
    },
    {
        model = "pavel",
        fuelType = FuelType.MILK,
    },
    {
        model = "voltic",
        fuelType = FuelType.EV,
    },
    {
        model = "t20",
        fuelType = FuelType.EV,
    },
    {
        model = "raiden",
        fuelType = FuelType.EV,
    },
}

-- random fuel types per specific class
-- simply uncomment the vehicle class you want to enforce specific random fuel type
Config.SpecificFuelTypePerVehicleClass = {
    --[0] = { FuelType.DIESEL, FuelType.NATURAL }, -- Compacts
    --[1] = { FuelType.DIESEL, FuelType.NATURAL }, -- Sedans
    --[2] = { FuelType.DIESEL, FuelType.NATURAL }, -- SUVs
    --[3] = { FuelType.DIESEL, FuelType.NATURAL }, -- Coupes
    --[4] = { FuelType.DIESEL, FuelType.NATURAL }, -- Muscle
    --[5] = { FuelType.DIESEL, FuelType.NATURAL }, -- Sports Classics
    --[6] = { FuelType.DIESEL, FuelType.NATURAL }, -- Sports
    --[7] = { FuelType.DIESEL, FuelType.NATURAL }, -- Super
    --[8] = { FuelType.DIESEL, FuelType.NATURAL }, -- Motorcycles
    --[9] = { FuelType.DIESEL, FuelType.NATURAL }, -- Off-road
    --[10] = { FuelType.DIESEL, FuelType.NATURAL }, -- Industrial
    --[11] = { FuelType.DIESEL, FuelType.NATURAL }, -- Utility
    --[12] = { FuelType.DIESEL, FuelType.NATURAL }, -- Vans
    --[13] = { FuelType.DIESEL, FuelType.NATURAL }, -- Cycles ( disabled )
    --[14] = { FuelType.DIESEL, FuelType.NATURAL }, -- Boats
    --[15] = { FuelType.DIESEL, FuelType.NATURAL }, -- Helicopters
    --[16] = { FuelType.DIESEL, FuelType.NATURAL }, -- Planes
    --[17] = { FuelType.DIESEL, FuelType.NATURAL }, -- Service
    --[18] = { FuelType.DIESEL, FuelType.NATURAL }, -- Emergency
    --[19] = { FuelType.DIESEL, FuelType.NATURAL }, -- Military
    --[20] = { FuelType.DIESEL, FuelType.NATURAL }, -- Commercial
    --[21] = { FuelType.DIESEL, FuelType.NATURAL }, -- Trains ( disabled )
    --[22] = { FuelType.DIESEL, FuelType.NATURAL }, -- Open Wheel
}


-- the vehicle will eat 1 liter of fuel per each x kilometers
-- you can view all MaterialType in const.lua
Config.FuelConsumption = {
    -- the slower the vehicle is driving the more fuel it takes from it
    max = 5,
    -- the faster the vehicle is going the lower amount of fuel it takes
    min = 2.5,

    CustomPerTerrarian = {
        [MaterialType.HARD_SAND] = {
            max = 6,
            min = 3,
        },
        [MaterialType.SOFT_SAND] = {
            max = 8,
            min = 4,
        },
        [MaterialType.GRASS] = {
            max = 5.5,
            min = 3,
        },
        [MaterialType.WET] = {
            max = 10,
            min = 5,
        },
    },

    -- custom WLTP per model
    -- because this truck has 300L tank and my research pointed that on average
    -- the WLTP is between 11-17 liters per 100 km we will just adjust the value to match it
    CustomPerModel = {
        ---------------------------------
        {
            -- this will work for this specific model only
            model = "phantom3",

            -- the slower the vehicle is driving the more fuel it takes from it
            max = 11,
            -- the faster the vehicle is going the lower amount of fuel it takes
            min = 7.0,

            CustomPerTerrarian = {
                [MaterialType.HARD_SAND] = {
                    max = 13,
                    min = 10,
                },
                [MaterialType.SOFT_SAND] = {
                    max = 14,
                    min = 11,
                },
                [MaterialType.GRASS] = {
                    max = 12,
                    min = 8,
                },
                [MaterialType.WET] = {
                    max = 15,
                    min = 11,
                },
            },
        },
        ---------------------------------
    },

    -- custom WLTP per fuel type
    CustomPerFuelType = {
        ---------------------------------
        --[[
        {
            -- this will work for specific fuel type only
            fuelType = FuelType.EV,

            -- the slower the vehicle is driving the more fuel it takes from it
            max = 11,
            -- the faster the vehicle is going the lower amount of fuel it takes
            min = 7.0,

            CustomPerTerrarian = {
                [MaterialType.HARD_SAND] = {
                    max = 13,
                    min = 10,
                },
                [MaterialType.SOFT_SAND] = {
                    max = 14,
                    min = 11,
                },
                [MaterialType.GRASS] = {
                    max = 12,
                    min = 8,
                },
                [MaterialType.WET] = {
                    max = 15,
                    min = 11,
                },
            },
        },
        --]]
        ---------------------------------
    }
}

-- this modifier is prepared for min = 2.5 & max = 5.0. So if you're going to edit the WLTP above
-- you will have to edit all of these
-- custom list with custom values for each car you want
-- the higher number = higher fuel consumption
-- Number under 1.0 = more efficient
-- in simply put this is ( Fuel consumption * modifier )
-- You can find possible fuel consumption in "Config.FuelConsumption" where you can edit values per terraian / per vehicle etc.
Config.VehicleClassWLTPModifier = {
    [0] = 1.8, -- Compacts ( 80% less efficient - Fuel consumption per X KM = 9L )
    [1] = 2.0, -- Sedans ( 100% less efficient - Fuel consumption per X KM = 10L )
    [2] = 1.6, -- SUVs ( 60% less efficient - Fuel consumption per X KM = 8L )
    [3] = 1.5, -- Coupes ( 50% less efficient - Fuel consumption per X KM = 7.5L )
    [4] = 2.0, -- Muscle ( 100% less efficient - Fuel consumption per X KM = 10L )
    [5] = 3.0, -- Sports Classics ( 200% less efficient - Fuel consumption per X KM = 15L )
    [6] = 1.8, -- Sports ( 80% less efficient - Fuel consumption per X KM = 9L )
    [7] = 2.0, -- Super ( 100% less efficient - Fuel consumption per X KM = 10L )
    [8] = 0.8, -- Motorcycles ( 20% more efficient - Fuel consumption per X KM = 4L )
    [9] = 1.2, -- Off-road ( 20% less efficient - Fuel consumption per X KM = 6L )
    [10] = 2.2, -- Industrial ( 120% less efficient - Fuel consumption per X KM = 11L )
    [11] = 2.4, -- Utility ( 140% less efficient - Fuel consumption per X KM = 12L )
    [12] = 2.2, -- Vans ( 120% less efficient - Fuel consumption per X KM = 11L )
    [13] = 0.0, -- Cycles ( disabled )
    [14] = 0.3, -- Boats ( 70% more efficient - Fuel consumption per X KM = 1.5L )
    [15] = 20.0, -- Helicopters ( 1900% less efficient - Fuel consumption per X KM = 50L (when full speed) )
    [16] = 16.0, -- Planes ( 1500% less efficient - Fuel consumption per X KM = 40L (when full speed) )
    [17] = 3.6, -- Service ( 260% less efficient - Fuel consumption per X KM = 18L )
    [18] = 3.2, -- Emergency ( 220% less efficient - Fuel consumption per X KM = 16L )
    [19] = 3.0, -- Military ( 200% less efficient - Fuel consumption per X KM = 15L )
    [20] = 2.0, -- Commercial ( 100% less efficient - Fuel consumption per X KM = 10L )
    [21] = 0.0, -- Trains ( disabled )
    [22] = 1.0, -- Open Wheel ( No change - Fuel consumption per X KM = 5L )
}

-- same modifier like above but for specific fuel types
Config.VehicleClassWLTPModifierPerFuelType = {
    -- diesel is 20-30% more efficient so we will only so lets use 25% so we're in middle.
    [FuelType.DIESEL] = {
        [0] = 1.55, -- Compacts ( 55% less efficient - Fuel consumption per X KM = 7.75L )
        [1] = 1.75, -- Sedans ( 75% less efficient - Fuel consumption per X KM = 8.75L )
        [2] = 1.35, -- SUVs ( 35% less efficient - Fuel consumption per X KM = 6.75L )
        [3] = 1.25, -- Coupes ( 25% less efficient - Fuel consumption per X KM = 6.25L )
        [4] = 1.75, -- Muscle ( 75% less efficient - Fuel consumption per X KM = 8.75L )
        [5] = 2.75, -- Sports Classics ( 275% less efficient - Fuel consumption per X KM = 13.75L )
        [6] = 1.55, -- Sports ( 55% less efficient - Fuel consumption per X KM = 7.75L )
        [7] = 1.75, -- Super ( 75% less efficient - Fuel consumption per X KM = 8.75L )
        [8] = 0.55, -- Motorcycles ( 45% more efficient - Fuel consumption per X KM = 2.75L )
        [9] = 0.95, -- Off-road ( 5% more efficient - Fuel consumption per X KM = 4.75L )
        [10] = 1.95, -- Industrial ( 95% less efficient - Fuel consumption per X KM = 9.75L )
        [11] = 2.15, -- Utility ( 115% less efficient - Fuel consumption per X KM = 10.75L )
        [12] = 1.95, -- Vans ( 95% less efficient - Fuel consumption per X KM = 9.75L )
        [13] = 0.0, -- Cycles ( disabled )
        [14] = 0.2, -- Boats ( 80% more efficient - Fuel consumption per X KM = 1L )
        [15] = 18.0, -- Helicopters ( 1700% less efficient - Fuel consumption per X KM = 45L (when full speed) )
        [16] = 15.0, -- Planes ( 1400% less efficient - Fuel consumption per X KM = 37.5L (when full speed) )
        [17] = 3.35, -- Service ( 235% less efficient - Fuel consumption per X KM = 16.75L )
        [18] = 2.95, -- Emergency ( 195% less efficient - Fuel consumption per X KM = 14.75L )
        [19] = 2.75, -- Military ( 175% less efficient - Fuel consumption per X KM = 13.75L )
        [20] = 1.75, -- Commercial ( 75% less efficient - Fuel consumption per X KM = 8.75L )
        [21] = 0.0, -- Trains ( disabled )
        [22] = 0.75, -- Open Wheel ( 25% more efficient - Fuel consumption per X KM = 3.75L )
    },
}

-- if there is need to have custom modifier per vehicle model here you can do it
Config.VehicleModelWLTPModifier = {
    --{
    --    model = "sultan",
    --    modifier = 10.0,
    --},
}