Config = {}

-- The default keybind used to open/close the vehicle control menu
-- Set this to null if you dont want a keybind to be used
Config.DefaultKeybind = 'lshift'

-- Commands used to open, close and toggle vheicle control UI
Config.OpenCommand = "openCC"
Config.CloseCommand = "closeCC"
Config.ToggleCommand = "toggleCC"

-- Time in ms between each UI update. Lowering this will result in a more responsive UI, but will consume more resources
Config.RefreshTime = 1250      

-- The fuel script you wish to use. The script comes with support for cdn-fuel, legacy-fuel and standalone functionality. Check documentation for more info
Config.FuelScript = 'none'              

-- If your server has a seperate controller/tuner script to handle neons, you can disable them in this script
Config.HideNeonControl = false

-- If your server has a seperate controller/tuner script to handle headlights, you can disable them in this script
Config.HideHeadlightControl = false

-- Whether or not you want the toggle all buttons to be hidden
Config.HideToggleAll = false

-- Keyboard controls that are enabled while the vehicle control UI is open. See https://docs.fivem.net/docs/game-references/controls/ for all keys
Config.AllowedControls = {
    75,  -- exit vehicle    
    71,  -- accelerate vehicle
    72,  -- deccelerate vehicle
    59,  -- turn vehicle left/right
    86,  -- honk
    74,  -- toggle headlight
    101, -- open vehicle roof
    76,  -- handbrake
    245, -- open chat (T)
    85,  -- use radio
}

-- See https://docs.fivem.net/docs/game-references/vehicle-models/ for names of vehicle models 
-- Vehicles that pasengers should have no control of any windows, whatsoever
Config.NoPassengerWindowControl = {  
    "BUS", "AIRBUS", "COACH", "PBUS", "PBUS2", "TOURBUS", "RENTALBUS", 
}

-- Vehicles that pasengers should have no control of any doors, whatsoever
Config.NoPassengerDoorControl = { 
    "BUS", "AIRBUS", "COACH", "PBUS", "PBUS2", "TOURBUS", "RENTALBUS", 
}


