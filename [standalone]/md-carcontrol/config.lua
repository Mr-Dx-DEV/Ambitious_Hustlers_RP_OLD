Config = {}

-- The default keybind used to open/close the vehicle control menu
-- Set this to nil if you dont want a keybind to be used
Config.DefaultKeybind = 'end'

-- Commands used to open, close and toggle vheicle control UI
Config.OpenCommand = "openCC"
Config.CloseCommand = "closeCC"
Config.ToggleCommand = "toggleCC"

-- The fuel script used to display the vehicles fuel on the UI.
-- Supported: cdn-fuel, legacy-fuel, ox_fuel, nil.  Check documentation to learn how to include any other script
Config.FuelScript = nil

-- If set to true, vehicle engines will not automatically turn on when the player enters, or when the gas pedal is pressed, and will stay on when the player leaves the vehicle
-- This forces players to use the vehicle menu to toggle their engines
-- Note that this setting will cause the script to consume an extra 0.03ms - 0.04ms of resmon if enabled
Config.ForceManualEngineControl = false

-- Vehicle classes that do not have access to the menu. See https://docs.fivem.net/natives/?_0x29439776AAA00A62 for vehicle classes
Config.DisabledClasses = {
    13, -- Bicycles
}

-- If set to false, players will not be able to change their headlights xenon colour. Disable if using md-neoncontroller
Config.AllowHeadlightColourChange = false

-- If set to false, players will not be able to change their neon colours. Disable if using md-neoncontroller
Config.AllowNeonColourChange = false

-- If set to false, the whole neon section will be gone. Disable if using md-neoncontroller
Config.ShowNeonSection = false

-- Keyboard controls that are enabled while the vehicle control UI is open. See https://docs.fivem.net/docs/game-references/controls/ for all keys
Config.AllowedControls = {
    75,  -- exit vehicle (F)
    71,  -- accelerate vehicle (W)
    72,  -- deccelerate vehicle (S)
    59,  -- turn vehicle left/right (A/D)
    86,  -- honk (E)
    74,  -- toggle headlight (H)
    101, -- open vehicle roof (H)
    76,  -- handbrake (Spacebar)
    245, -- open chat (T)
    85,  -- use radio (Q)
}

-- Time in ms between each UI update. Lowering this will result in a more responsive UI, but will consume more resources
Config.RefreshTime = 2000      

-- See https://docs.fivem.net/docs/game-references/vehicle-models/ for names of vehicle models 
-- Vehicles that pasengers should have no control of any windows, whatsoever
Config.NoPassengerWindowControl = {  
    "BUS", "AIRBUS", "COACH", "PBUS", "PBUS2", "TOURBUS", "RENTALBUS", 
}

-- Vehicles that pasengers should have no control of any doors, whatsoever
Config.NoPassengerDoorControl = { 
    "BUS", "AIRBUS", "COACH", "PBUS", "PBUS2", "TOURBUS", "RENTALBUS", 
}


