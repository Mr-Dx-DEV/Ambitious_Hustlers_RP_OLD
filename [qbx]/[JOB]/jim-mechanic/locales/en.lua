Loc = Loc or {}

Loc["en"] = {
    common = {
        vehicleNotOwned        	= "Vehicle not owned",
        close            		= "Close",
        ret           			= "Return",
        stockLabel             	= "Stock", -- Default, Original, whatever word you use for this
        currentInstalled       	= "Currently Installed",
        noOptionsAvailable     	= "No options available for this item",
        notInstalled           	= "Not Installed",
        actionInstalling       	= "Installing",
        installedMsg           	= "Installed!",
        installationFailed     	= "Installation failed!",
        removedMsg             	= "Removed!",
        actionRemoving         	= "Removing",
        removalFailed          	= " removal failed!",
        cannotInstall          	= "Cannot be installed on this vehicle",
        optionsCount           	= "Amount of Options: ",
        alreadyInstalled       	= "already installed", -- eg. "Stock Bumper already Installed"
        menuInstalledText      	= "Installed", -- e.g., "[4 Options] Installed: Grille 1"
        nearWheelWarning       	= "You need to move closer to a wheel",
        nearEngineWarning      	= "You need to move closer to the engine",
        closerToHeadlights     	= "Move closer to the headlights",
        attachingHarness       	= "Attaching Racing Harness...",
        liveryPrefix           	= "Livery",
        extraPrefix            	= "Extra",
        oldLiverySuffix        	= " oldLiv",		--- only shows when debugmode is enabled
        zeroPrefix             	= "0 - ",
        submit           	    = "Submit",
        settingBaseCoat        	= "Setting base coat...",
        sprayCancelled         	= "Spray cancelled",

        toggleOn               	= "ON",
        toggleOff              	= "OFF",
        backButton             	= "Back",
        unknownStatus          	= "Unknown",
        notApplicable          	= "N/A",

        needVehicle            	= "You need to be in a vehicle to do this...",
        needDriver             	= "You need to be the driver to do this...",

        dutyMessage             = "Please contact a Mechanic!",
    },

	stancer = {
		wheel_lf                = "Left Front Wheel",
		wheel_rf                = "Right Front Wheel",
		wheel_lr                = "Left Rear Wheel",
		wheel_rr                = "Right Rear Wheel",
		wheel_lm1               = "Left Middle (1) Wheel",
		wheel_rm1               = "Right Middle (1) Wheel",
		wheel_lm2               = "Left Middle (2) Wheel",
		wheel_rm2               = "Right Middle (2) Wheel",
		wheel_lm3               = "Left Middle (3) Wheel",
		wheel_rm3               = "Right Middle (3) Wheel",
		spacer                  = "Spacer",
		camber                  = "Camber",
		width                   = "Width (All Wheels)",
		size                    = "Size (All Wheels)",
		stance                  = "Stance",
		reset                   = "Reset",
		resetAll                = "Reset All",
		resetBar                = "Resetting All Wheels",
        adjusting               = "Adjusting"
    },

    pushvehicle = {
        push                    = "Push Vehicle",
        stop                    = "[E] Stop Pushing"
    },

    -- Progress Bar Texts
    progressbar = {
        progress_washing 		= "Washing hands",
        progress_mix 			= "Mixing a ",
        progress_pour 			= "Pouring a ",
        progress_drink 			= "Drinking a ",
        progress_eat 			= "Eating a ",
        progress_make 			= "Making a ",
    },

    -- Error Messages
    error = {
        not_clockedin          	= "Not on duty",
        cancelled     			= "Cancelled",
    },

    -- Tire Actions
    tireActions = {
        removeBulletProofTires 	= "Bulletproof tires removed!",
        removeDriftTires       	= "Drift tires removed!",
    },

    -- Xenon / Neon Settings
    xenonSettings = {
        notInstalled           	= "Xenon headlights not installed",
        headerLighting     	    = "Lighting Controls",
        neonHeaderUnderglow    	= "Underglow Lighting Controls",
        neonHeaderColor        	= "Underglow Color Controls",
        xenonHeaderHeadlight    = "Xenon Headlight Controls",
        customRGBHeader        	= "Custom RGB",  -- corrected from "Custom RBG"
        customConfirm          	= "APPLY",
        neonTextDescription    	= "Fine control of neon lighting",
        toggleAll              	= "Toggle ALL",
        frontLabel             	= "Front",
        rightLabel             	= "Right",
        backLabel             	= "Back",
        leftLabel              	= "Left",
        neonTextChangeColor    	= "Change underglow color",
        xenonHeader            	= "Xenon Controls",
        xenonTextDescription   	= "Adjust vehicle headlight color",
    },

    -- Cosmetic Items: Bumpers
    bumpers = {
        grilleMenu             	= "Grille",
        frontBumperMenu        	= "Front Bumper",
        backBumperMenu         	= "Back Bumper",
    },

    -- Cosmetic Items: Exhaust
    exhaustMod = {
        menuHeader             	= "Exhaust Modification",
    },

    -- Cosmetic Items: Exterior	 Modifications
    exteriorMod = {
		stockMod 				= "Stock Exterior Mod..",
    },

    -- Cosmetic Items: Hood
    hoodMod = {
        menuHeader             	= "Hood Modification",
    },

    -- Cosmetic Items: Horns
    hornsMod = {
        testCurrentHorn        	= "Test current horn",
        testHorn               	= "Test horn",
        applyHorn              	= "Apply horn",
        menuHeader             	= "Horn Modification",
    },

    -- Cosmetic Items: Livery /	 Wrap
    liveryMod = {
        oldMod                 	= "old",
        menuHeader             	= "Wrap Modification",
        menuOldHeader          	= "Roof Wrap Modification",
    },

    -- NOS / Turbo Settings
    nosSettings = {
        turboNotInstalled      	= "Turbo not installed",
        needNOSCan             	= "You need a NOS can for this",
        refillingMsg           	= "Refilling",
        insufficientCash       	= "Not enough cash",
        nosPurchased           	= "Purchased a NOS refill",

        nosColor               	= "NOS Purge Color",
        boostMode              	= "Boost Mode",
        purgeMode              	= "Purge Mode",
        boostPower             	= "Boost Power",
        sprayStrength          	= "Spray Strength",

        keyBoostLevelUp        	= "Boost/Purge Level Up",
        keyBoostLevelDown      	= "Boost/Purge Level Down",
        keyToggleBoost         	= "Boost/Purge Switch",
        keyBoost               	= "Boost",
    },

    -- Paint Options
    paintOptions = {
        primaryColor           	= "Primary",
        secondaryColor         	= "Secondary",
        pearlescent            	= "Pearlescent",
        wheelColor             	= "Wheel",
        dashboardColor         	= "Dashboard",
        interiorColor          	= "Interior",

        classicFinish          	= "Classic",
        metallicFinish         	= "Metallic",
        matteFinish            	= "Matte",
        metalsFinish           	= "Metals",
        chameleonFinish        	= "Chameleon",

        menuHeader             	= "Respray",
    },

    -- Paint RGB / HEX Picker
    paintRGB = {
        --selectLabel            	= "Selection:",
        finishSelectLabel      	= "Finish Select:",
        --hexError               	= "Hex code must be 6 characters",
        customHeader           	= "Custom HEX and RGB",
        chromeLabel            	= "Chrome",
        hexPickerLabel         	= "HEX Picker",
        rgbPickerLabel         	= "RGB Picker",
        sprayingBase           	= "Spraying base coat...",
        sprayingVehicle        	= "Spraying vehicle paint...",
        stopInstruction        	= "Stop - [Backspace]",
        hexLabel               	= "HEX:",
        rgbLabel               	= "RGB:",
        redLabel               	= "R - ",
        greenLabel             	= "G - ",
        blueLabel              	= "B - ",
    },

    -- Plates Options
    plates = {
        plateHolder            	= "Plate Holder",
        vanityPlates           	= "Vanity Plates",
        customPlates           	= "Custom Plates",
    },

    -- Rims / Wheels Modifications
    rimsMod = {
        menuHeader             	= "Rims Modification",
        sportRims              	= "Sport",
        muscleRims             	= "Muscle",
        lowriderRims           	= "Lowrider",
        suvRims                	= "SUV",
        offroadRims            	= "Offroad",
        tunerRims              	= "Tuner",
        highendRims            	= "Highend",
        bennysOriginals        	= "Benny's Originals",
        bennysBespoke          	= "Benny's Bespoke",
        openWheel              	= "Open Wheel",
        streetRims             	= "Street",
        trackRims              	= "Track",
        frontWheel             	= "Front Wheel",
        backWheel              	= "Back Wheel",
        motorcycleRims         	= "Motorcycle",
        customRims             	= "Custom Rims",
        customTires            	= "Custom Tires",
    },

    -- Roll Cage Modification
    rollCageMod = {
        menuHeader             	= " Roll Cage Modification",
    },

    -- Roof Modification
    roofMod = {
        menuHeader             	= " Roof Modification",
    },

    -- Seat Modification
    seatMod = {
        menuHeader             	= " Seat Modification",
    },

    -- Spoiler Modification
    spoilersMod = {
        menuHeader             	= "Spoiler Modification",
    },

    -- Smoke / Tire Smoke Options
    smokeSettings = {
        alreadyApplied         	= "This color is currently applied!",
        menuHeader             	= "Tire Smoke Modification",
        removeSmoke            	= "Remove Smoke Colour",
        customRGB              	= "CUSTOM RGB",
    },

    -- Window Tint Options
    windowTints = {
        menuHeader             	= "Window Tints",
    },

    -- Store / Shop Menu
    storeMenu = {
        browseStore            	= "Browse Store",
        mechanicTools          	= "Mechanic Tools",
        performanceItems       	= "Performance Items",
        cosmeticItems          	= "Cosmetic Items",
        repairItems            	= "Repair Items",
        nosItems               	= "NOS Items",
    },

    -- Crafting / Mechanic Craf	ting Menu
    craftingMenu = {
        menuHeader             	= "Mechanic Crafting",
        toolsHeader            	= "Mechanic Tools",
        repairHeader           	= "Repair Items",
        performanceHeader      	= "Performance Items",
        cosmeticHeader         	= "Cosmetic Items",
        nosHeader              	= "NOS Items",
        itemsCountSuffix       	= " items",  -- e.g., "11 items"
        extras                 	= "Extras",
    },

    -- Payments
    payments = {
        charge         	        = "Charge Customer",
    },

    -- Damage Warnings / Messag	es
    damageMessages = {
        engineOverheating      	= "Your engine is overheating",
        steeringIssue          	= "The steering feels wrong...",
        engineStalled          	= "The engine has stalled",
        lightsAffected         	= "Something is affecting your lights...",
        drippingSound          	= "You hear something dripping...",
    },

    -- Check / Vehicle Details
    checkDetails = {
        plateLabel             	= "Plate",
        valueLabel             	= "Value: $",
        unavailable            	= "❌ Unavailable",

        engineLabel            	= "Engine",
        brakesLabel            	= "Brakes",
        suspensionLabel        	= "Suspension",
        transmissionLabel      	= "Transmission",
        armorLabel             	= "Armor",
        turboLabel             	= "Turbo",
        xenonLabel             	= "Xenon",
        driftTyresLabel        	= "Drift Tyres",
        bulletproofTyresLabel  	= "Bulletproof Tyres",
        cosmeticsListHeader    	= "List of Possible Cosmetics",
        vehicleLabel           	= "Vehicle",

        optionsLabel           	= "options",
        externalCosmetics      	= "External Cosmetics",
        internalCosmetics      	= "Internal Cosmetics",
        spoilersLabel          	= "Spoilers",
        frontBumpersLabel      	= "Front Bumpers",
        rearBumpersLabel       	= "Rear Bumpers",
        skirtsLabel            	= "Skirts",
        exhaustsLabel          	= "Exhausts",
        grillesLabel           	= "Grilles",
        hoodsLabel             	= "Hoods",
        leftFenderLabel        	= "Left Fender",
        rightFenderLabel       	= "Right Fender",
        roofLabel              	= "Roof",
        plateHoldersLabel      	= "Plate Holders",
        vanityPlatesLabel      	= "Vanity Plates",
        trimALabel             	= "Trim A",
        trimBLabel             	= "Trim B",
        trunksLabel            	= "Trunks",
        engineBlocksLabel      	= "Engine Blocks",
        airFiltersLabel        	= "Air Filters",
        engineStrutLabel       	= "Engine Strut",
        archCoversLabel        	= "Arch Covers",

        rollCagesLabel         	= "Roll Cages",
        ornamentsLabel         	= "Ornaments",
        dashboardsLabel        	= "Dashboards",
        dialsLabel             	= "Dials",
        doorSpeakersLabel      	= "Door Speakers",
        seatsLabel             	= "Seats",
        steeringWheelsLabel    	= "Steering Wheels",
        shifterLeversLabel     	= "Shifter Levers",
        plaquesLabel           	= "Plaques",
        speakersLabel          	= "Speakers",
        hydraulicsLabel        	= "Hydraulics",
        aerialsLabel           	= "Aerials",
        fuelTanksLabel         	= "Fuel Tanks",
        wrapLabel              	= "Wrap",
        yesLabel               	= "Yes",
        noLabel                	= "No",
        removePrompt           	= "Do you want to remove ",
        antilagLabel           	= "Antilag",
        harnessLabel           	= "Harness",
        nitrousLabel           	= "Nitrous",

        oilPumpLabel            = "Oil Pump",
        driveShaftLabel         = "Drive Shaft",
        cylinderLabel           = "Cylinder Head",
        cableLabel              = "Battery Cables",
        fuelTankLabel           = "Fuel Tank"
    },

    -- Repair / Vehicle Repair 	Actions
    repairActions = {
        --browseStash            	= "Browse Stash",
        --materialsWarning       	= "You don't have enough materials",
        checkingEngineDamage   	= "Checking the engine damage...",
        checkingBodyDamage     	= "Checking the body damage...",

        bodyLabel              	= "Body",
        oilLevelLabel          	= "Oil Level",
        driveshaftLabel        	= "Axle Shaft",
        sparkPlugs             	= "Spark Plugs",
        carBattery             	= "Car Battery",
        fuelTank               	= "Fuel Tank",
        replaceTires           	= "Replace Tires",
        tires                   = "Tires",

        actionRepairing        	= "Repairing",
        actionChanging         	= "Changing: ",
        repairedMsg            	= "fully repaired",     -- eg. "Engine fully repaired"
        repairCancelled        	= "Repair cancelled!",
        noMaterialsInSafe      	= "Not enough materials in the safe",

        costLabel              	= "Cost",
        --statusLabel            	= "Status: ",
        repairPrompt           	= "Do you want to repair the ",

        applyingDuctTape       	= "Applying duct tape...",
        ductTapeLimit          	= "You can't use any more duct tape on this car",
        noVehicleNearby        	= "There is no vehicle nearby",

        matSource               = "Material Source: ",
        sourceJob               = "Job Stash",
        sourcePlayer            = "Player Inventory"
    },

    -- Police / Emergency Vehicle Menu
    policeMenu = {
        header                 	= "Modification Station",
        useRepairStation       	= "Use Modification Station",
        repairOption           	= "Repair",
        extrasOption           	= "Extras",
        extraOption            	= "Extra",
        cleaningVehicle        	= "Cleaning vehicle...",
        repairingEngine        	= "Repairing engine...",
        repairingBody          	= "Repairing body...",
        repairComplete         	= "Repair complete",
        emergencyOnly          	= "Only for emergency vehicles",
    },

    -- Manual Repair Actions
    manualRepairs = {
        replaceTyres           	= "Replacing damaged tyres",
        removeWindows          	= "Removing damaged windows",
        repairDoors            	= "Repairing doors",
    },

    -- Car Wax Options
    carWaxOptions = {
        cleanVehicle           	= "Clean Vehicle",
        cleanAndWax            	= "Clean and Wax",
        cleanAndPremiumWax     	= "Clean and Premium Wax",
        cleanAndUltimateWax    	= "Clean and Ultimate Wax",
    },

    -- Extra / Miscellaneous Ac	tions
    extraOptions = {
        vehicleClean           	= "Vehicle Clean",
        doorError              	= "Door Error",
        doorsLocked            	= "Vehicle doors locked",
        flippingVehicle        	= "Flipping vehicle",
        vehicleFlipped         	= "Success! Vehicle flipped",
        flipFailed             	= "Vehicle flip failed!",
        --noSeatEntered          	= "No seat number entered",
        moveSeat               	= "You move to seat ",
        seatFastWarning        	= "This vehicle is going too fast...",
        seatUnavailable        	= "This seat isn't available...",
        raceHarnessActive      	= "You have a racing harness on; cannot switch seats.",
        exitRestriction        	= "You cannot exit the vehicle while your harness/seatbelt is engaged.",
        seatbeltOnMsg          	= "Seatbelt on",
        seatbeltOffMsg         	= "Seatbelt off",
        toggleSeatbelt         	= "Toggle seatbelt",
    },

    -- General / Utility Functi	ons
    generalFunctions = {
        distanceLabel          	= "Distance: ",
        actionInsideVehicle    	= "This action cannot be performed while inside the vehicle",
        actionOutsideVehicle   	= "This action cannot be performed while outside the vehicle",
        vehicleLocked          	= "Vehicle is locked",
        shopRestriction        	= "Can't work outside of a shop",
        mechanicOnly           	= "Only a mechanic can perform this action",
        notThisShop             = "You can't work at this shop"
        --checkingStash          	= "Checking stash...",
    },

    -- Server-Side Functions
    serverFunctions = {
        checkVehicleDamage     	= "Check vehicle for damage",
        checkVehicleMods       	= "Check mods available on a vehicle",
        flipNearestVehicle     	= "Flip nearest vehicle",
        cleanVehicle           	= "Clean the car",
        toggleHood             	= "Open/Close hood",
        toggleTrunk            	= "Open/Close trunk",
        toggleDoor             	= "Open/Close door [0-3]",
        changeSeat             	= "Move to another seat [-1 to 10]",
    },

    -- Preview Settings
    previewSettings = {
        changesLabel           	= "Changes",
        previewNotAllowed      	= "Can't do this while previewing",
        cameraEnabledMsg       	= "Camera enabled",
        classLabel             	= "Class",
        rgbPreviewToolHeader   	= "RGB Paint Preview Tool",
        finishOption           	= "Finish",
        redOption              	= "R",
        greenOption            	= "G",
        blueOption             	= "B",
    },

    plateChange = {
        alreadyExists = "Vehicle Plate already exists!",
        illegalChar = "Plate contained illegal characters!",
        tooShort = "Name Too Short",
        tooLong = "Name Too Long",
        plateUpdated = "Vehicle Plates updated to:",
        specificJob = "This can only be used by specified jobs",
        specificItem = "This command can only be used by specified jobs",
        cannotChange = "Cannot change this plate",
        blacklisted = "Found blacklisted phrase",
        notOnline = "Owner isn't online"
    },

    -- Vehicle Window Options (Array of options)
    vehicleWindowOptions = {
        { name = "Limo", id = 4 },
        { name = "Green", id = 5 },
        { name = "Light Smoke", id = 3 },
        { name = "Dark Smoke", id = 2 },
        { name = "Pure Black", id = 1 }
    },

    -- Vehicle Plate Options
    vehiclePlateOptions = {
        { name = "Blue on White #1", id = 0 },
        { name = "Blue on White #2", id = 3 },
        { name = "Blue on White #3", id = 4 },
        { name = "Yellow on Blue", id = 2 },
        { name = "Yellow on Black", id = 1 },
        { name = "North Yankton", id = 5 },

        (GetGameBuildNumber() >= 3095) and { name = "Las Venturas", id = 7 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "Liberty City", id = 8 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "LS Car Meet", id = 9 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "Panic", id = 10 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "Pounders", id = 11 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "Sprunk", id = 12 } or nil,

    },

    -- Vehicle Neon Options (Also used for smoke)
    vehicleNeonOptions = {
        { name = "White", R = 255, G = 255, B = 255 },
        { name = "Blue", R = 2, G = 21, B = 255 },
        { name = "Electric Blue", R = 3, G = 83, B = 255 },
        { name = "Mint Green", R = 0, G = 255, B = 140 },
        { name = "Lime Green", R = 94, G = 255, B = 1 },
        { name = "Yellow", R = 255, G = 255, B = 0 },
        { name = "Golden Shower", R = 255, G = 150, B = 0 },
        { name = "Orange", R = 255, G = 62, B = 0 },
        { name = "Red", R = 255, G = 1, B = 1 },
        { name = "Pony Pink", R = 255, G = 50, B = 100 },
        { name = "Hot Pink", R = 255, G = 5, B = 190 },
        { name = "Purple", R = 35, G = 1, B = 255 },
        { name = "Blacklight", R = 15, G = 3, B = 255 }
    },

    -- Vehicle Horns (Array of options)
    vehicleHorns = {
        { name = "Truck Horn", id = 0 },
        { name = "Cop Horn", id = 1 },
        { name = "Clown Horn", id = 2 },
        { name = "Musical Horn 1", id = 3 },
        { name = "Musical Horn 2", id = 4 },
        { name = "Musical Horn 3", id = 5 },
        { name = "Musical Horn 4", id = 6 },
        { name = "Musical Horn 5", id = 7 },
        { name = "Sad Trombone", id = 8 },
        { name = "Classical Horn 1", id = 9 },
        { name = "Classical Horn 2", id = 10 },
        { name = "Classical Horn 3", id = 11 },
        { name = "Classical Horn 4", id = 12 },
        { name = "Classical Horn 5", id = 13 },
        { name = "Classical Horn 6", id = 14 },
        { name = "Classical Horn 7", id = 15 },
        { name = "Scale - Do", id = 16 },
        { name = "Scale - Re", id = 17 },
        { name = "Scale - Mi", id = 18 },
        { name = "Scale - Fa", id = 19 },
        { name = "Scale - Sol", id = 20 },
        { name = "Scale - La", id = 21 },
        { name = "Scale - Ti", id = 22 },
        { name = "Scale - Do", id = 23 },
        { name = "Jazz Horn 1", id = 24 },
        { name = "Jazz Horn 2", id = 25 },
        { name = "Jazz Horn 3", id = 26 },
        { name = "Jazz Horn Loop", id = 27 },
        { name = "Star Spangled Banner 1", id = 28 },
        { name = "Star Spangled Banner 2", id = 29 },
        { name = "Star Spangled Banner 3", id = 30 },
        { name = "Star Spangled Banner 4", id = 31 },
        { name = "Classical Horn 8 Loop", id = 32 },
        { name = "Classical Horn 9 Loop", id = 33 },
        { name = "Classical Horn 10 Loop", id = 34 },
        { name = "Classical Horn 8", id = 35 },
        { name = "Classical Horn 9", id = 36 },
        { name = "Classical Horn 10", id = 37 },
        { name = "Funeral Loop", id = 38 },
        { name = "Funeral", id = 39 },
        { name = "Spooky Loop", id = 40 },
        { name = "Spooky", id = 41 },
        { name = "San Andreas Loop", id = 42 },
        { name = "San Andreas", id = 43 },
        { name = "Liberty City Loop", id = 44 },
        { name = "Liberty City", id = 45 },
        { name = "Festive 1 Loop", id = 46 },
        { name = "Festive 1", id = 47 },
        { name = "Festive 2 Loop", id = 48 },
        { name = "Festive 2", id = 49 },
        { name = "Festive 3 Loop", id = 50 },
        { name = "Festive 3", id = 51 },
        { name = "Air Horn 1 Loop", id = 52 },
        { name = "Air Horn 1", id = 53 },
        { name = "Air Horn 2 Loop", id = 54 },
        { name = "Air Horn 2", id = 55 },
        { name = "Air Horn 3 Loop", id = 56 },
        { name = "Air Horn 3", id = 57 },
    },

    -- Vehicle Respray Options: Classic Finishes
    vehicleResprayOptionsClassic = {
        { name = "Black", id = 0 },
        { name = "Carbon Black", id = 147 },
        { name = "Graphite", id = 1 },
        { name = "Anthracite Black", id = 11 },
        { name = "Black Steel", id = 2 },
        { name = "Dark Steel", id = 3 },
        { name = "Silver", id = 4 },
        { name = "Bluish Silver", id = 5 },
        { name = "Rolled Steel", id = 6 },
        { name = "Shadow Silver", id = 7 },
        { name = "Stone Silver", id = 8 },
        { name = "Midnight Silver", id = 9 },
        { name = "Cast Iron Silver", id = 10 },
        { name = "Red", id = 27 },
        { name = "Torino Red", id = 28 },
        { name = "Formula Red", id = 29 },
        { name = "Lava Red", id = 150 },
        { name = "Blaze Red", id = 30 },
        { name = "Grace Red", id = 31 },
        { name = "Garnet Red", id = 32 },
        { name = "Sunset Red", id = 33 },
        { name = "Cabernet Red", id = 34 },
        { name = "Wine Red", id = 143 },
        { name = "Candy Red", id = 35 },
        { name = "Hot Pink", id = 135 },
        { name = "Pfister Pink", id = 137 },
        { name = "Salmon Pink", id = 136 },
        { name = "Sunrise Orange", id = 36 },
        { name = "Orange", id = 38 },
        { name = "Bright Orange", id = 138 },
        { name = "Gold", id = 99 },
        { name = "Bronze", id = 90 },
        { name = "Yellow", id = 88 },
        { name = "Race Yellow", id = 89 },
        { name = "Dew Yellow", id = 91 },
        { name = "Dark Green", id = 49 },
        { name = "Racing Green", id = 50 },
        { name = "Sea Green", id = 51 },
        { name = "Olive Green", id = 52 },
        { name = "Bright Green", id = 53 },
        { name = "Gasoline Green", id = 54 },
        { name = "Lime Green", id = 92 },
        { name = "Midnight Blue", id = 141 },
        { name = "Galaxy Blue", id = 61 },
        { name = "Dark Blue", id = 62 },
        { name = "Saxon Blue", id = 63 },
        { name = "Blue", id = 64 },
        { name = "Mariner Blue", id = 65 },
        { name = "Harbor Blue", id = 66 },
        { name = "Diamond Blue", id = 67 },
        { name = "Surf Blue", id = 68 },
        { name = "Nautical Blue", id = 69 },
        { name = "Racing Blue", id = 73 },
        { name = "Ultra Blue", id = 70 },
        { name = "Light Blue", id = 74 },
        { name = "Chocolate Brown", id = 96 },
        { name = "Bison Brown", id = 101 },
        { name = "Creeen Brown", id = 95 },
        { name = "Feltzer Brown", id = 94 },
        { name = "Maple Brown", id = 97 },
        { name = "Beechwood Brown", id = 103 },
        { name = "Sienna Brown", id = 104 },
        { name = "Saddle Brown", id = 98 },
        { name = "Moss Brown", id = 100 },
        { name = "Woodbeech Brown", id = 102 },
        { name = "Straw Brown", id = 99 },
        { name = "Sandy Brown", id = 105 },
        { name = "Bleached Brown", id = 106 },
        { name = "Schafter Purple", id = 71 },
        { name = "Spinnaker Purple", id = 72 },
        { name = "Midnight Purple", id = 142 },
        { name = "Bright Purple", id = 145 },
        { name = "Cream", id = 107 },
        { name = "Ice White", id = 111 },
        { name = "Frost White", id = 112 },
    },

    -- Vehicle Respray Options: Matte Finishes
    vehicleResprayOptionsMatte = {
        { name = "Black", id = 12 },
        { name = "Gray", id = 13 },
        { name = "Light Gray", id = 14 },
        { name = "Ice White", id = 131 },
        { name = "Blue", id = 83 },
        { name = "Dark Blue", id = 82 },
        { name = "Midnight Blue", id = 84 },
        { name = "Midnight Purple", id = 149 },
        { name = "Schafter Purple", id = 148 },
        { name = "Red", id = 39 },
        { name = "Dark Red", id = 40 },
        { name = "Orange", id = 41 },
        { name = "Yellow", id = 42 },
        { name = "Lime Green", id = 55 },
        { name = "Green", id = 128 },
        { name = "Forest Green", id = 151 },
        { name = "Foliage Green", id = 155 },
        { name = "Olive Darb", id = 152 },
        { name = "Dark Earth", id = 153 },
        { name = "Desert Tan", id = 154 },
    },

    -- Vehicle Respray Options: Metallic Finishes
    vehicleResprayOptionsMetals = {
        { name = "Brushed Steel", id = 117 },
        { name = "Brushed Black Steel", id = 118 },
        { name = "Brushed Aluminium", id = 119 },
        { name = "Pure Gold", id = 158 },
        { name = "Brushed Gold", id = 159 },
        { name = "Chrome", id = 120 },
    },

    -- Vehicle Respray Options: Chameleon Finishes
    vehicleResprayOptionsChameleon = {
        { name = "Anodized Red", id = 161 },
        { name = "Anodized Wine", id = 162 },
        { name = "Anodized Purple", id = 163 },
        { name = "Anodized Blue", id = 164 },
        { name = "Anodized Green", id = 165 },
        { name = "Anodized Lime", id = 166 },
        { name = "Anodized Copper", id = 167 },
        { name = "Anodized Bronze", id = 168 },
        { name = "Anodized Champagne", id = 169 },
        { name = "Anodized Gold", id = 170 },
        { name = "Green/Blue Flip", id = 171 },
        { name = "Green/Red Flip", id = 172 },
        { name = "Green/Brown Flip", id = 173 },
        { name = "Green/Turquoise Flip", id = 174 },
        { name = "Green/Purple Flip", id = 175 },
        { name = "Teal/Purple Flip", id = 176 },
        { name = "Turquoise/Red Flip", id = 177 },
        { name = "Turquoise/Purple Flip", id = 178 },
        { name = "Cyan/Purple Flip", id = 179 },
        { name = "Blue/Pink Flip", id = 180 },
        { name = "Blue/Green Flip", id = 181 },
        { name = "Purple/Red Flip", id = 182 },
        { name = "Purple/Green Flip", id = 183 },
        { name = "Magenta/Green Flip", id = 184 },
        { name = "Magenta/Yellow Flip", id = 185 },
        { name = "Burgundy/Green Flip", id = 186 },
        { name = "Magenta/Cyan Flip", id = 187 },
        { name = "Copper/Purple Flip", id = 188 },
        { name = "Magenta/Orange Flip", id = 189 },
        { name = "Red/Orange Flip", id = 190 },
        { name = "Orange/Purple Flip", id = 191 },
        { name = "Orange/Blue Flip", id = 192 },
        { name = "White/Purple Flip", id = 193 },
        { name = "Red/Rainbow Flip", id = 194 },
        { name = "Blue/Rainbow Flip", id = 195 },
        { name = "Dark Green Pearl", id = 196 },
        { name = "Dark Teal Pearl", id = 197 },
        { name = "Dark Blue Pearl", id = 198 },
        { name = "Dark Purple Pearl", id = 199 },
        { name = "Oil Slick Pearl", id = 200 },
        { name = "Light Green Pearl", id = 201 },
        { name = "Light Blue Pearl", id = 202 },
        { name = "Light Purple Pearl", id = 203 },
        { name = "Light Pink Pearl", id = 204 },
        { name = "Off White Pearl", id = 205 },
        { name = "Pink Pearl", id = 206 },
        { name = "Yellow Pearl", id = 207 },
        { name = "Green Pearl", id = 208 },
        { name = "Blue Pearl", id = 209 },
        { name = "Cream Pearl", id = 210 },
        { name = "White Prismatic", id = 211 },
        { name = "Graphite Prismatic", id = 212 },
        { name = "Dark Blue Prismatic", id = 213 },
        { name = "Dark Purple Prismatic", id = 214 },
        { name = "Hot Pink Prismatic", id = 215 },
        { name = "Dark Red Prismatic", id = 216 },
        { name = "Dark Green Prismatic", id = 217 },
        { name = "Black Prismatic", id = 218 },
        { name = "Black Oil Spill", id = 219 },
        { name = "Black Rainbow", id = 220 },
        { name = "Black Holographic", id = 221 },
        { name = "White Holographic", id = 222 },
        { name = "Monochrome", id = 223 },
        { name = "Night / Day", id = 224 },
        { name = "Verlierer 2", id = 225 },
        { name = "Sprunk Extreme", id = 226 },
        { name = "Vice City", id = 227 },
        { name = "Synthwave", id = 228 },
        { name = "Four Seasons", id = 229 },
        { name = "Maisonette 9 Throwback", id = 230 },
        { name = "Bubblegum", id = 231 },
        { name = "Full Rainbow", id = 232 },
        { name = "Sunsets", id = 233 },
        { name = "The Seven", id = 234 },
        { name = "Kamen Rider", id = 235 },
        { name = "Chrome Aberration", id = 236 },
        { name = "It's Christmas", id = 237 },
        { name = "Temperature", id = 238 },
        { name = "Haos Special Works", id = 239 },
        { name = "Electro", id = 240 },
        { name = "Monika", id = 241 },
        { name = "Fubuki", id = 242 },
    },
}