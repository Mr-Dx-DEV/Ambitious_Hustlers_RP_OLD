-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/9pCDHmjYwd

Config = Config or {}

Config = {
	Lan = "en", -- Pick your language file here
	System = {
		Debug = false, -- Set to true to show green debug boxes to help track any issues
		EventDebug = false,

		Menu = "ox",  				-- "qb", "ox", "gta", "lation"
		Notify = "ox",				-- "qb", "ox", "gta", "esx", "lation"
		drawText = "ox",			-- "qb", "ox", "gta", "lation"
		ProgressBar = "ox", 		-- "qb", "ox", "gta", "esx", "lation"
		Billing = "jim",			-- "jim", "okok"

		skillCheck = "ox",			-- "qb", "ox", "lation"

		distkph = false, 			-- Set to false to read distance travelled in Miles.

	}
}

Config.General = {
	JimShops = false,			-- Enable to open shops in jim-shops menu's
	showClockInTill = true,		-- Enable to show toggle duty options at payment tills
	showBossMenuTill = true,	-- Enable to show bossmenu options at payment tills
}

Config.blipController = {
	-- Requires jim-blipcontroller
	enable = false,

	-- Enable only one
	discoverableBlips = false,	-- Makes it so users need to "find" the location to be able to see it on map
								-- Good for getting your players out and about

	onDutyBlips = true,			-- Creates "Duty Blips", if there is a player with the locations job  and is onDuty
								-- then mark the location as "Open" on the map
}

Config.Main = { -- Main variables
	isVehicleOwned = false, 	-- Enable this if you only want changes to be made to owned vehicles
								-- False to allow modifications to unowned vehicles

	ItemRequiresJob = true, 	-- Enable this if items should require a mechanic job
								-- Disable this to allow any player to use mechanic items

	JobLocationRequired = false, -- Enable this to lock most modifications to specified job locations
								-- Disable this to allow vehicle modifications anywhere

	LocationBlips = true, 		-- Enable to show job location blips on the map
								-- Disable to hide blips

	CosmeticsJob = true, 		-- Cosmetic items, like hood and rims requires a mechanic job role
								-- Disable this so everyone can use cosmetic items

	JobRoles = { 				-- These are the job roles who can use items if RequiresJob is enabled.
		"mechanic",
		"kittys",
	},

	-- Add your extra job roles here or just leave as "mechanic"
	-- Example-- --JobRoles = { "mechanic", "tuner" }

	Stash = {
		--CHANGING THIS MAY REQUIRE YOU TO RENAME/MOVE ITEMS FROM OLD STASHES
		sharedStash = false, 		-- Enable if mechanic with same job name share stash
		uniqueStash = true, 		-- Enable if you want each stash to be unique
	}
}

Config.Overrides = {

	CosmeticItemRemoval = true, 	-- If "true" cosmetic items will be removed on successful application of a mod
									-- If "false" cosmetic items will have unlimited uses

	receiveMaterials = false,		-- If true, when removing parts like engines, recieve materials instead of the actual item
									-- This is based on material recipes in recipes.lua

	updateServerDelay = 5, 			-- default 5 second database update delay from the LAST upgrade done to a vehicle
									-- This stops overloading of server databases when many changes are happening, it adds a cooldown

	ChameleonPaints = true, 		-- Enable this if you want to use chameleon paints (ONLY GAME BUILD 2545 AND ABOVE)

	WaxFeatures = true, 			-- Enable this if you want to use Car Wax Features to the cleaningkit, otherwise it will only show "Clean car" option

	DoorAnimations = true,			-- Enable door openning animations when repairing/fixing


	disablePreviewPlate = true,		-- enable this to DISABLE temporary placeholder plate while previewing (some garage scripts didn't like this)

	saveOnExit = true,				-- Enable this to save a vehicle to database when player exits their vehicle
									-- Does not work if they "delete" it, eg. If your garage system doesn't remove the player from the car before parking

	manualTransmisson = true,		-- Enable this if you want to enable manual gearbox compatability
									-- Disable this to now allow the usage of the manual item and its features
									-- This script allows for toggling a vehicle to be classed as manual in the script
									-- But it uses other scripts for the feature
									-- The default compatability is with `vlad_gears`
									-- But you SHOULD be able to modify the functions to toggle it on in other scripts instead

	vehSeatMenu = true,				-- if true, when holding F, entering a vehicle shows a menu to pick which seat
									-- false, disables this menu

	crashFX = true,					-- if true, when crashing theres a chance based on damage done for the camera to have extra screenshake
									-- false disables this feature
}

Config.Discord = {
	-- Discord /preview receipts
	-- You will need to set custom info in each job location in /locations
	-- But for the ones you don't add info to, it will default to these numbers

	DiscordPreview = true, 		-- Set to true if you want to use discord receipts at all
	DiscordDefault = "", 		-- Set this to the default channel API link if one isn't set for a location
	DiscordColour = 16753920, 	-- This is the default "decimal" number colour
}
