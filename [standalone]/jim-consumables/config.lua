-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = false,
	Core = "qb-core",

	Inv = "ox", -- set to "ox" if using ox_inventory
	Notify = "ox",  -- set to "ox" if using ox_lib

	UseProgbar = true,
	ProgressBar = "ox", -- set to "ox" if using ox_lib

	Consumables = {
		-- Default QB food and drink item override

		--Effects can be applied here, like stamina on coffee for example
		["vodka"] = { 			emote = "vodkab", 		canRun = false, 	time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "alcohol", stats = { effect = "heal", time = 5000, amount = 2, thirst = math.random(10,20), canOD = true }},
		["beer"] = { 			emote = "beer", 		canRun = false, 	time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "alcohol", stats = { effect = "heal", time = 5000, amount = 2, thirst = math.random(10,20), canOD = true }},
		["whiskey"] = { 			emote = "whiskey", 		canRun = false, 	time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "alcohol", stats = { effect = "heal", time = 5000, amount = 2, thirst = math.random(10,20), canOD = true }},
	

	--	["vodka"] = { 			emote = "vodkab", 		canRun = false,  disableWalk = false, 	time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "alcohol", stats = { effect = "stress", time = 5000, amount = 2, thirst = math.random(20,30), canOD = true }},
	--	["beer"] = { 			emote = "beer", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10,20), canOD = true }},
	--	["whiskey"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10,20), canOD = true }},
		["grapejuice"] = { 		emote = "drink",  		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10,20), canOD = true }},
		["sandwich"] = { 		emote = "sandwich", 	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},

		["twerks_candy"] = { 	emote = "egobar", 		canRun = true, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		["snikkel_candy"] = { 	emote = "egobar", 		canRun = true, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		["tosti"] = { 			emote = "sandwich", 	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		["casino_burger"] = { 	emote = "burger", 	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		["casino_psqs"] = { 	emote = "candybox", 	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		["casino_ego_chaser"] = { 	emote = "sandwich", 	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		["casino_sandwitch"] = { 	emote = "sandwich", 	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		["casino_donut"] = { 		emote = "donut", 	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},


		["coffee"] = { 			emote = "coffee", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},
		["water_bottle"] = { 	emote = "drink", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},
		["kurkakola"] = { 		emote = "ecola", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},
		["casino_beer"] = { 		emote = "beer", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},
		["casino_coke"] = { 		emote = "ecola", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},
		["casino_sprite"] = { 		emote = "ecola", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},
		["casino_luckypotion"] = { 		emote = "ecola", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},
		["casino_coffee"] = { 		emote = "coffee", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},

		["ifaks"] = { emote = "coffee", canRun = true, disableWalk = false, time = math.random(5000, 6000), stress = math.random(24, 50), heal = 30, armor = 0, type = "food", stats = { hunger = math.random(2, 4)}},
		
		--["joint"] = { 			emote = "smoke3",	time = math.random(5000, 6000), stress = math.random(5, 8), heal = 0, armor = 0, type = "drug", stats = { screen = "weed",  widepupils = false, canOD = false } },
		--[[ --Testing effects & armor with small functionality to drugs - This may be another one left to default scripts
		

		["cokebaggy"] = { 		emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { screen = "focus", effect = "stamina", widepupils = false, canOD = true } },
		--["crackbaggy"] = { 		emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { effect = "heal", widepupils = false, canOD = true } },
		["xtcbaggy"] = { 		emote = "oxy",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { effect = "strength", widepupils = true, canOD = true } },
		["oxy"] = { 			emote = "oxy",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { effect = "heal", widepupils = false, canOD = false } },
		["meth"] = { 			emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { effect = "stamina", widepupils = false, canOD = true } }, ]]
		----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		--Jim-BurgerShot-Drinks
		["bscoffee"] = { emote = "bscoffee", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["milkshake"] = { emote = "drink", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["bscoke"] = { emote = "bscoke", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["unicornpiss"] = { emote = "drink", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65)}},

		--Jim-BurgerShot-Food
		["heartstopper"] = { emote = "burger", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["torpedo"] = {	emote = "torpedo", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["shotfries"] = { emote = "bsfries", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["meatfree"] = { emote = "burger", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20,30), }},
		["shotnuggets"] = {	emote = "bsfries", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["shotrings"] = { emote = "bsfries", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["moneyshot"] = { emote = "burger", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["bleeder"] = {	emote = "burger", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rimjob"] = { emote = "donut", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65)}},
		["creampie"] = { emote = "donut", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65),}},
		["cheesewrap"] = { emote = "sandwich", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["chickenwrap"] = {	emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		
		--- Rex Diner
		["rexheartstopper"] = { emote = "burger", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rextorpedo"] = {	emote = "torpedo", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rexshotfries"] = { emote = "bsfries", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rexmeatfree"] = { emote = "burger", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20,30), }},
		["rexshotnuggets"] = {	emote = "bsfries", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rexshotrings"] = { emote = "bsfries", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rexmoneyshot"] = { emote = "burger", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rexbleeder"] = {	emote = "burger", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rexrimjob"] = { emote = "donut", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65)}},
		["rexcreampie"] = { emote = "donut", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65)}},
		["rexcheesewrap"] = { emote = "sandwich", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rexchickenwrap"] = {	emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["rexbscoffee"] = { emote = "bscoffee", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["rexmilkshake"] = { emote = "drink", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["rexbscoke"] = { emote = "bscoke", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		
		["caesar_salad"] = { emote = "sandwich", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["chicken_fettucine_alfredo"] = { emote = "sandwich", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["chicken_kebab"] = { emote = "meat2", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["cooked_shrimp"] = { emote = "meat2", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["grill_chicken"] = { emote = "meat2", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["grilled_salmon"] = { emote = "meat2", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["spicy_lobster"] = { emote = "meat2", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["steak"] = { emote = "meat2", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["tomato_soup"] = { emote = "sandwich", canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		
		["kiwi_smoothie"] = { emote = "sipshakeh", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["strawberry_smoothie"] = { emote = "sipshakei", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["shrimp_cocktail"] = { emote = "bscoke", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		

		-- Kawaii Cafe
		["arabiccoffee"] = { 			emote = "coffee", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50,65), }},
		["turkishcoffee"] = { 			emote = "coffee", 		canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50,65), }},
		["efesbeer"] = { emote = "beer", canRun = false, disableWalk = false,  time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), canOD = true }},
		["baklava"] = { 	emote = "wrap", 		canRun = false, disableWalk = false, 		time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["faffel"] = { 	emote = "panini", 		canRun = false, disableWalk = false, 		time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["grilledhalloumi"] = { 	emote = "icecreamcup", 		canRun = false, disableWalk = false, 		time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["hummous"] = { 	emote = "cheesecake", 		canRun = false, disableWalk = false, 		time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["sharwama"] = { 	emote = "meat2", 		canRun = false, disableWalk = false,		time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["kebab"] = { 	emote = "meat2", 		canRun = false, disableWalk = false, 		time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["tagine"] = { 	emote = "ramen", 		canRun = false, disableWalk = false, 		time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["avocadosmoothie"] = { emote = "smoothie4", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50,65), }},
		["mangolassi"] = { emote = "smoothie6", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50,65), }},
		["minttea"] = { emote = "coffee", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50,65), }},
		["chaitea"] = { emote = "coffee", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50,65), }},

		-- Bahamamas

		["alabama_slammer"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["witches_brew"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40),  widepupils = true, canOD = true }},
		["margarita"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["boilermaker"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["tequila_shot"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40),  widepupils = true, canOD = true }},
		["gin_shot"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["vodka_shot"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["beer_pint"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		
		["bahamama"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["planterlunch"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["mudslide"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["darkstormy"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["blueislandcocktail"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["mojito"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["barracuda"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["coconutwater"] = { 		emote = "whiskey",  	canRun = false, disableWalk = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["cononutshrimp"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(15, 20) }},
		["chickenkabobs"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(15, 20) }},
		["fishfritters"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(15, 20) }},
		
		--UWU
		--test
		["sake"] = { emote = "flute", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10,20), canOD = true }},
		["bobatea"] = { emote = "uwu12", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 65), }},
		["bbobatea"] = { emote = "uwu12", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 65), }},
		["gbobatea"] = { emote = "uwu12", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 65), }},
		["obobatea"] = { emote = "uwu12", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 65), }},
		["pbobatea"] = { emote = "uwu12", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 65), }},
		["nekolatte"] = { emote = "uwu2", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = {thirst = math.random(50, 60), }},
		["mocha"] = { emote = "uwu1", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["catcoffee"] = { emote = "uwu4", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["bento"] = { emote = "uwu7", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4),  heal = 0, armor = 0, type = "food", stats = {hunger = math.random(50, 65), }},
		["blueberry"] = { emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
		["cake"] = { emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["nekocookie"] = { emote = "uwu6", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["nekodonut"] = { emote = "uwu5", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["riceball"] = { emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["miso"] = { emote = "uwu9", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["bmochi"] = { emote = "uwu13", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4),  heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["pmochi"] = { emote = "uwu13", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["gmochi"] = { emote = "uwu13", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["omochi"] = { emote = "uwu13", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["strawberry"] = { emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
		["rice"] = { emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
		["cakepop"] = { emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["pizza"] = { emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["pancake"] = { emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["purrito"] = { emote = "uwu8", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = {hunger = math.random(50, 65), }},
		["noodlebowl"] = { emote = "uwu9", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["ramen"] = { emote = "uwu9", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},

		-- Galaxy Nightclub
		["b52"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["brussian"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["bkamikaze"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["cappucc"] = { emote = "browncup", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true}},
		["ccookie"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["iflag"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["kamikaze"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["sbullet"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["voodoo"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["woowoo"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["schnapps"] = { emote = "whiskey", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["gin"] = { emote = "ginb", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["scotch"] = { emote = "whiskeyb", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["rum"] = { emote = "rumb", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["icream"] = { emote = "icream", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["amaretto"] = { emote = "vodkab", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["curaco"] = { emote = "vodkab", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,40), screen = "focus", widepupils = true, canOD = true }},
		["ambeer"] = { emote = "beer3", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["dusche"] = { emote = "beer1", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["logger"] = { emote = "beer2", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["pisswasser"] = { emote = "beer4", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true}},
		["pisswasser2"] = { emote = "beer5", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["pisswasser3"] = { emote = "beer6", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["cranberry"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 65), }},
		["ecola"] = { emote = "ecola", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40,45), }},
		["ecolalight"] = { emote = "ecola", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40,45), }},
		["sprunk"] = { emote = "sprunk", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40,45), }},
		["sprunklight"] = { emote = "sprunk", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40,45), }},
		["crisps"] = { emote = "crisps", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},

		["chocolate_lover_cake"] = { emote = "xmascc", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 60), }},
		["rolled_strawberry_icecream"] = { emote = "xmasic", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 60), }},
		["bread_sticks"] = { emote = "croissant", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 60), }},

		-- Pizzeria
		-- Wine
		["amarone"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["barbera"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["dolceto"] = { emote = "whitewine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["housered"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["housewhite"] = { emote = "whitewine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		["rosso"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20,30), screen = "focus", widepupils = true, canOD = true }},
		-- Desserts
		["tiramisu"] = { emote = "xmasic", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 45)}},
		["gelato"] = { emote = "xmasic", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 45), }},
		["medfruits"] = { emote = "pineapple", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 45), }},
		-- Food
		["bolognese"] = { emote = "foodbowl", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65)}},
		["calamari"] = { emote = "foodbowl", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["meatball"] = { emote = "foodbowl", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["alla"] = { emote = "foodbowl", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["pescatore"] = { emote = "foodbowl", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["capricciosa"] = { emote = "pizzas", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["diavola"] = { emote = "pizzas", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65)}},
		["marinara"] = { emote = "pizzas", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["margherita"] = { emote = "pizzas", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["prosciuttio"] = { emote = "pizzas", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["vegetariana"] = { emote = "pizzas", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65), }},
		["espresso"] = { emote = "coffee", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 65), }},
	
		-- Bahama Mamas
		["pepsi"] = { 		emote = "ecola", 		canRun = true, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,40), }},
		["cheesefries"] = { emote = "sandwich", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["cherrypie"] = { emote = "donut", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["chickenwings"] = {	emote = "sandwich", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50,65), }},
		["spicysteaktacos"] = {	emote = "taco", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 65)}},

		-- puff puff pass & Blazeit
		["afghankush_joint"] = {	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["bluedream_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["granddaddypurple_joint"] = { emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["greencrack_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["jackherrer_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["sourdiesel_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["weddingcake_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["ppp_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["blazeit_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },

		["gummy_rasberry"] = {		emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_blueberry"] = {		emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_grape"] = {			emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_applering"] = {		emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["edible_ricecrispy"] = {	emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_belt"] = {			emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["edible_snickerdoodle"] = {	emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["edible_peanutcookie"] = {	emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["edible_cchip"] = {	emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },

		-- Whitewidow
		["weed_skunk_cbd_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["weed_og-kush_cbd_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["weed_white-widow_cbd_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["weed_ak47_cbd_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["weed_amnesia_cbd_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["weed_purple-haze_cbd_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["weed_gelato_cbd_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
		["weed_zkittlez_cbd_joint"] = { 	emote = "joint",	canRun = true, disableWalk = false, time = math.random(10000,15000), stress = math.random(5, 10), heal = 0, armor = 50, type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },

		["gummy_skunk_cbd"] = {		emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_og-kush_cbd"] = {		emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_white-widow_cbd"] = {			emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_ak47_cbd"] = {		emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_amnesia_cbd"] = {	emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_purple-haze_cbd"] = {			emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_gelato_cbd"] = {	emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },
		["gummy_zkittlez_cbd"] = {	emote = "oxy",	canRun = true, disableWalk = false, time = math.random(5000,6000), stress = math.random(5, 10), heal = 0, armor = math.random(20, 20), type = "drug", stats = { screen = "focus",  time = 60000, widepupils = false, canOD = false } },

		["bigfruit"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["highnoon"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["speedball"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["gunkaccino"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["bratte"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["flusher"] = { emote = "bmcoffee2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["ecocoffee"] = { emote = "bmcoffee", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["caffeagra"] = { emote = "bmcoffee3", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60), }},
		["cheesecake"] = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60), }},
		["watermelon"] = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30)}},
		["beandonut"] = { emote = "donut2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60), }},
		["chocolate"] = { emote = "egobar", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
		
		["lpbbqburger"] = 			 { emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["lp_nagaburger"] = 		 { emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["lp_chickburger"] = 		 { emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["chicken_sandwich_spicy"] = { emote = "sandwich", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) }},
		["chicken_sandwich"] = { emote = "sandwich", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) }},
		["lpshotfries"] = { emote = "bsfries", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["lpshotnuggets"] = {	emote = "bsfries", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(55,65), }},
		["lpcoffee"] = { emote = "bscoffee", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["lpcoke"] = { emote = "bscoke", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		

		["tripleburger"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["baconcheesemelt"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["chillidog"] = 			{ emote = "atomhotdog", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["atomfries"] = 			{ emote = "atomfries", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["chickenfillet"]= 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["chickenhorn"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["grilledchicken"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["chickensalad"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["hunksohen"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["chickentaco"]= 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["enchiladas"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["gazpacho"] = 				{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["hornbreakfast"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["eggsbenedict"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["hashbrowns"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["sausages"] = 				{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["baconroll"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["baconeggtoast"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["frenchtoast"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["frenchtoastbacon"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["hornburger"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["dblhornburger"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["baconhornburger"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["picklehornburger"] = 		{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["chickenhornburger"] = 	{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["dblchickenhornburger"] = 	{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["breadslice"] =			{ emote = "breadslice", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30) }},

		["icecone"] = 				{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["icenugget"] = 			{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["icecake"] = 				{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},

		["creamyshake"] = 			{ emote = "sipshakec", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		["atomsoda"]  = 			{ emote = "atomdrink", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		["orangotang"] = 			{ emote = "ecola", canRun = false, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		["raine"]  = 				{ emote = "ecola", canRun = false, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		["junkdrink"]  = 			{ emote = "bscoffee", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		["milk"] = 					{ emote = "burger", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		
		-- Noodle
		["pennerosa"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["wisconsinmaccheese"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["padthai"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["bankokcurry"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["spaghettimeatballs"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["pestocavatappi"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["pastafresca"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		["steakstroganoff"] = 			{ emote = "foodbowl", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(50, 60) }},
		
		["passionfruitpunch"] = 			{ emote = "drink", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		["schweppes"] = 					{ emote = "drink", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		["staglager"] = 					{ emote = "drink", canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(50, 60) }},
		
		-- Koi Restaurant
		["japanese_cheesecake_plate"] = {
			emote = "uwu11", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["cocacola"] = { emote = "ecola", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(55,65), }},
		["matcha_swiss_plate"] = {
			emote = "uwu11", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["dorayaki"] = {
			emote = "uwu11", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["dorayaki_plate"] = {
			emote = "uwu11", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["gyokuro"] = {
			emote = "coffee", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["kombucha"] = {
			emote = "coffee", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["greentea"] = {
			emote = "coffee", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["matchatea"] = {
			emote = "coffee", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["mugichatea"] = {
			emote = "coffee", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["sprite"] = {
			emote = "ecola", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["fanta"] = {
			emote = "ecola", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},

		["udon"] = {
			emote = "uwu9", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},

		["yakitori"] = {
			emote = "foodbowl", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		
		["spring_rolls"] = {
			emote = "foodbowl", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["soba"] = {
			emote = "uwu9", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["okonomiyaki"] = {
			emote = "uwu9", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["kungpao"] = {
			emote = "uwu9", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["bunbonambo"] = {
			emote = "uwu9", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["sushi"] = {
			emote = "uwu7", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["banhxeo"] = {
			emote = "uwu9", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["onigiri"] = {
			emote = "uwu7", time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food",
			stats = {
				hunger = math.random(55,65)
			},
		},
		["ramune_lychee"] = {
			emote = "koiramune", time = math.random(5000, 6000), stress = math.random(1, 1), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["ramune_original"] = {
			emote = "koiramune", time = math.random(5000, 6000), stress = math.random(1, 1), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["ramune_strawberry"] = {
			emote = "koiramune", time = math.random(5000, 6000), stress = math.random(1, 1), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["ramune_watermelon"] = {
			emote = "koiramune", time = math.random(5000, 6000), stress = math.random(1, 1), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},
		["cocacola_clear"] = {
			emote = "koiramune", time = math.random(5000, 6000), stress = math.random(1, 1), heal = 0, armor = 0, type = "drink",
			stats = {
				thirst = math.random(55,65)
			},
		},

		-- Tequilala
		["teq_hot_wings"] = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 35), }},
		["teq_loaded_fries"] = { emote = "bsfries", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 35), }},
		["teq_mozz_sticks"] = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 35), }},
		["teq_pizzalogs"] = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 35), }},


		--- HenHouse
		["tillie"] = { emote = "browncup", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
		["friedpick"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50), }},
		["maccheese"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50), }},
		["bplate"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50), }},
		["cplate"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50), }},
		["splate"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50), }},
		["rplate"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50), }},
		["nplate"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50), }},
		["wings"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50), }},
		["bburrito"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30, 40), }},
		["pickle"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
		["nachos"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
	},
	Emotes = {
		["meat"] = {
			"move_crouch_proto",
			"idle",
			"Meat On A Stick",
			AnimationOptions = {
				Prop = 'bzzz_camp_stick_kebab',
				PropBone = 64080,
				PropPlacement = {
				   0.0600,
				   0.0500,
				  -0.1600,
				  17.0651,
				 -30.9089,
				  60.0374
				},
				EmoteLoop = true,
				EmoteMoving = true
			}
		},
		["sipshakec"] = {
			"smo@milkshake_idle",
			"milkshake_idle_clip",
			"Sip Milkshake - Chocolate",
			AnimationOptions = {
				Prop = 'brum_cherryshake_chocolate',
				PropBone = 28422,
				PropPlacement = {
				   0.0850,
				   0.0670,
				  -0.0350,
				-115.0862,
				-165.7841,
				  24.1318
				},
				EmoteLoop = true,
				EmoteMoving = true
			}
	   },
		["sipshakeh"] = {
			"smo@milkshake_idle",
			"milkshake_idle_clip",
			"Sip Milkshake - Mint",
			AnimationOptions = {
				Prop = 'brum_cherryshake_mint',
				PropBone = 28422,
				PropPlacement = {
				   0.0850,
				   0.0670,
				  -0.0350,
				-115.0862,
				-165.7841,
				  24.1318
				},
				EmoteLoop = true,
				EmoteMoving = true
			}
	   },
		["sipshakei"] = {
			"smo@milkshake_idle",
			"milkshake_idle_clip",
			"Sip Milkshake - Strawberry",
			AnimationOptions = {
				Prop = 'brum_cherryshake_strawberry',
				PropBone = 28422,
				PropPlacement = {
				   0.0850,
				   0.0670,
				  -0.0350,
				-115.0862,
				-165.7841,
				  24.1318
				},
				EmoteLoop = true,
				EmoteMoving = true
			}
	   },
		["meat2"] = {
			"mp_player_inteat@burger",
			"mp_player_int_eat_burger",
			"Meat On A Fork",
			AnimationOptions = {
				Prop = 'bzzz_camp_food_kebab',
				PropBone = 18905,
				PropPlacement = {
				   0.14,
				   0.02,
				   0.01,
				 -24.0,
				 -80.0,
				   9.0
				},
				EmoteLoop = true,
				EmoteMoving = true
			}
		},
		["ramen"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Ramen", AnimationOptions = { Prop = "h4_prop_h4_caviar_tin_01a", PropBone = 60309, PropPlacement = {0.0, 0.0300, 0.0100,0.0,0.0,0.0}, SecondProp = 'h4_prop_h4_caviar_spoon_01a', SecondPropBone = 28422, SecondPropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["wrap"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Wrap",            AnimationOptions = { Prop = "prop_wrap_chickpepper",             PropBone = 18905, PropPlacement = {0.14, 0.02, 0.06, 232.0, -45.0, 13.0}, EmoteMoving = true, EmoteLoop = true, }},
		["panini"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Panini",            AnimationOptions = { Prop = "prop_panini",             PropBone = 18905, PropPlacement = {0.15, 0.07, 0.01, 114.0, 393.0, 81.0}, EmoteMoving = true, EmoteLoop = true, }},
		["icecreamcup"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Vanilla Icecream Cup",            AnimationOptions = { Prop = "prop_vanillacup",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
		["cheesecake"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Taiyaki",            AnimationOptions = { Prop = "prop_cheese_cake",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
		["rabbitcookie"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Rabbit Cookie",            AnimationOptions = { Prop = "fractal_food_cookie1",             PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -51.0, -220.0, -6.0}, EmoteMoving = true, EmoteLoop = true, }},
		["rabbitcookie2"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Rabbit Cookie 2",            AnimationOptions = { Prop = "fractal_food_cookie2",             PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -51.0, -220.0, -6.0}, EmoteMoving = true, EmoteLoop = true, }},
		["taiyaki"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Taiyaki",            AnimationOptions = { Prop = "fractal_food_taiyaki",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},


		["icecream1"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Vanilla Ice Cream",            AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream2"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Chocolate Ice Cream",          AnimationOptions = { Prop = "bzzz_icecream_chocolate",          PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream3"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Strawberry Ice Cream",         AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream4"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Mint Ice Cream",               AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream5"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Pistachio Ice Cream",          AnimationOptions = { Prop = "bzzz_icecream_chocolate",          PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream6"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Butterscotch Ice Cream",       AnimationOptions = { Prop = "bzzz_icecream_lemon",              PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream7"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Salted Caramel Ice Cream",     AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream8"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Bubblegum Ice Cream",          AnimationOptions = { Prop = "bzzz_icecream_lemon",              PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream9"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Toffee Ice Cream",             AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream10"] = {"mp_player_inteat@burger",                    "mp_player_int_eat_burger",     "Cookie Dough Ice Cream",       AnimationOptions = { Prop = "bzzz_icecream_chocolate",          PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie1"] = {"mp_player_intdrink",                          "loop_bottle",                  "Vanilla Smoothie",             AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie2"] = {"mp_player_intdrink",                          "loop_bottle",                  "Chocolate Smoothie",           AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie3"] = {"mp_player_intdrink",                          "loop_bottle",                  "Strawberry Smoothie",          AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie4"] = {"mp_player_intdrink",                          "loop_bottle",                  "Mint Smoothie",                AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie5"] = {"mp_player_intdrink",                          "loop_bottle",                  "Pistachio Smoothie",           AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie6"] = {"mp_player_intdrink",                          "loop_bottle",                  "Butterscotch Smoothie",        AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie7"] = {"mp_player_intdrink",                          "loop_bottle",                  "Salted Caramel Smoothie",      AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie8"] = {"mp_player_intdrink",                          "loop_bottle",                  "Bubblegum Smoothie",           AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie9"] = {"mp_player_intdrink",                          "loop_bottle",                  "Toffee Smoothie",              AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie10"] = {"mp_player_intdrink",                         "loop_bottle",                  "Cookie Dough Smoothie",        AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["cupcake1"] = {"mp_player_inteat@burger",                      "mp_player_int_eat_burger",     "Vanilla Cupcake",              AnimationOptions = { Prop = "pata_christmasfood6",              PropBone = 60309, PropPlacement = {0.0100, 0.0200, -0.0100, -170.1788, 87.6716, 30.0540}, EmoteMoving = true, EmoteLoop = true, }},
        ["cupcake2"] = {"mp_player_inteat@burger",                      "mp_player_int_eat_burger",     "Chocolate Cupcake",            AnimationOptions = { Prop = "pata_christmasfood6",              PropBone = 60309, PropPlacement = {0.0100, 0.0200, -0.0100, -170.1788, 87.6716, 30.0540}, EmoteMoving = true, EmoteLoop = true, }},
        ["chocbar"] = {"mp_player_inteat@burger",                       "mp_player_int_eat_burger",     "Chocolate Bar",                AnimationOptions = { Prop = "prop_choc_ego",                    PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["doughnut1"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Jam Dougnut",                  AnimationOptions = { Prop = "prop_amb_donut",                   PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["doughnut2"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Sugar Dougnut",                AnimationOptions = { Prop = "prop_amb_donut",                   PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["doughnut3"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Custard Dougnut",              AnimationOptions = { Prop = "prop_amb_donut",                   PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["doughnut4"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Chocolate Dougnut",            AnimationOptions = { Prop = "bzzz_foodpack_donut002",           PropBone = 60309, PropPlacement = {0.0000, -0.0300, -0.0100, 10.0000, 0.0000, -1.0000}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink1"] = {"amb@world_human_drinking@coffee@male@idle_a",    "idle_c",                       "Tea",                          AnimationOptions = { Prop = "p_amb_coffeecup_01",               PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink2"] = {"amb@world_human_drinking@coffee@male@idle_a",    "idle_c",                       "Coffee",                       AnimationOptions = { Prop = "p_amb_coffeecup_01",               PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink3"] = {"amb@world_human_drinking@coffee@male@idle_a",    "idle_c",                       "Hot Chocolate",                AnimationOptions = { Prop = "p_amb_coffeecup_01",               PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink4"] = {"smo@milkshake_idle",                             "milkshake_idle_clip",          "Cola",                         AnimationOptions = { Prop = "prop_rpemotes_soda04",             PropBone = 28422, PropPlacement = {0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink5"] = {"smo@milkshake_idle",                             "milkshake_idle_clip",          "Lemonade",                     AnimationOptions = { Prop = "prop_rpemotes_soda04",             PropBone = 28422, PropPlacement = {0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink6"] = {"smo@milkshake_idle",                             "milkshake_idle_clip",          "Orange Soda",                  AnimationOptions = { Prop = "prop_rpemotes_soda04",             PropBone = 28422, PropPlacement = {0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898}, EmoteMoving = true, EmoteLoop = true, }},

		["atomdrink"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'ng_proc_sodacup_01c', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atomhotdog"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'prop_food_bs_burger2', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["breadslice"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Bread Slice", AnimationOptions = { Prop = 'v_res_fa_bread03', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, -10.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["bmcoffee1"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee2", AnimationOptions = { Prop = 'prop_fib_coffee', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["bmcoffee2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee3", AnimationOptions = { Prop = 'ng_proc_coffee_01a', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["bmcoffee3"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee3", AnimationOptions = { Prop = 'v_club_vu_coffeecup', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		
		["milk"] = {"mp_player_intdrink", "loop_bottle", "Milk", AnimationOptions = { Prop = "v_res_tt_milk", PropBone = 18905, PropPlacement = {0.10, 0.008, 0.07, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["bscoke"] = {"mp_player_intdrink", "loop_bottle", "BS Coke", AnimationOptions = { Prop = "prop_food_bs_juice01", PropBone = 18905, PropPlacement = {0.04, -0.10, 0.10, 240.0, -60.0},  EmoteMoving = true, EmoteLoop = true, }},
		["bscoffee"] = {"mp_player_intdrink", "loop_bottle", "BS Coffee", AnimationOptions = { Prop = "prop_food_bs_coffee", PropBone = 18905, PropPlacement = {0.08, -0.10, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["glass"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tall Glass", AnimationOptions = { Prop = 'prop_wheat_grass_glass', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.1, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["torpedo"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Torpedo", AnimationOptions = { Prop = "prop_food_bs_burger2", PropBone = 18905, PropPlacement = {0.10, -0.07, 0.091, 15.0, 135.0}, EmoteMoving = true, EmoteLoop = true, }},
		["bsfries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Fries", AnimationOptions = { Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = {0.09, -0.06, 0.05, 300.0, 150.0}, EmoteMoving = true, EmoteLoop = true, }},
		["donut2"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut2", AnimationOptions = { Prop = 'prop_donut_02', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0}, EmoteMoving = true, EmoteLoop = true, }},

		["xmasic"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Xmas Ice Cream", AnimationOptions = { Prop = "pata_christmasfood7", PropBone = 60309, PropPlacement = { -0.0460, 0.0000, -0.0300, 0.0, 0.0, -50.0000 }, SecondProp = 'h4_prop_h4_coke_spoon_01', SecondPropBone = 28422, SecondPropPlacement = {0.0,0.0,0.0,0.0,20.0,0.0},EmoteLoop = true,EmoteMoving = true}},

		["pizzas"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Pizza Slice - Jalapeño And Peperoni",
        	AnimationOptions = {
        	    Prop = 'knjgh_pizzaslice1',
        	    PropBone = 60309,
        	    PropPlacement = {
        	        0.0500,
        	        -0.0200,
        	        -0.0200,
        	        73.6928,
        	        -66.7427,
        	        68.3677
        	    },
        	    EmoteMoving = true,
				EmoteLoop = true
        	}
    	},
		["xmascc"] = { --- Custom Prop by PataMods
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Xmas Cupcake",
        AnimationOptions = {
            Prop = 'pata_christmasfood6',
            PropBone = 60309,
            PropPlacement = {
                0.0100,
                0.0200,
               -0.0100,
               -170.1788,
                87.6716,
                30.0540
            },
            EmoteMoving = true
        }
	},
	["croissant"] = { --- Custom Prop by Bzzzi
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Croissant",
        AnimationOptions = {
            Prop = 'bzzz_foodpack_croissant001',
            PropBone = 60309,
            PropPlacement = {
                0.0000,
                0.0000,
                -0.0100,
                0.0000,
                0.0000,
                90.0000
            },
            EmoteMoving = true
        }
    },
		["taco"] = {
			"mp_player_inteat@burger",
			"mp_player_int_eat_burger",
			"Taco",
			AnimationOptions = {
				Prop = 'prop_taco_01',
				PropBone = 60309,
				PropPlacement = {
					-0.0170,
					0.0070,
					-0.0210,
					107.9846,
					-105.0251,
					55.7779
				},
				EmoteMoving = true,
				EmoteLoop = true
			}
		},

		-- Galaxy
		["browncup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Brown Cup", AnimationOptions = { Prop = 'v_serv_bs_mug', PropBone = 28422, PropPlacement = {0.03, -0.02, 0.0, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["whiskeyb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions = { Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},
		["rumb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions = { Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
		["icream"] = {"mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions = { Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},	EmoteMoving = true, EmoteLoop = true }},
		["ginb"] =  {"mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions = { Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},	EmoteMoving = true, EmoteLoop = true }},

		-- Pizzeria
		["redwine"] = {"mp_player_intdrink", "loop_bottle", "Red Wine Bottle", AnimationOptions = { Prop = "prop_wine_rose", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["whitewine"] = {"mp_player_intdrink", "loop_bottle", "White Wine Bottle", AnimationOptions = { Prop = "prop_wine_white", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions = { Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions = { Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions = { Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions = { Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions = { Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions = { Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["ecola"] = {"mp_player_intdrink", "loop_bottle", "e-cola", AnimationOptions = { Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions = { Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["pizza"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions = { Prop = "v_res_tt_pizzaplate", PropBone = 18905, PropPlacement = {0.20, 0.038, 0.051, 15.0, 155.0}, EmoteMoving = true, EmoteLoop = true, }},
		["bowl"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "bowl", AnimationOptions = { Prop = "h4_prop_h4_coke_plasticbowl_01", PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
		["pineapple"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions = { Prop = "prop_pineapple", PropBone = 18905, PropPlacement = {0.10, 0.038, 0.03, 15.0, 50.0}, EmoteMoving = true, EmoteLoop = true, }},
		["foodbowl"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "bowl", AnimationOptions = { Prop = "prop_cs_bowl_01", PropBone = 28422, PropPlacement = {0.0, 0.0, 0.050, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
		
		["drink"] = {"mp_player_intdrink", "loop_bottle", "Drink", AnimationOptions = { Prop = "prop_ld_flow_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions = { Prop = 'p_amb_coffeecup_01', PropBone = 28422, PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0}, EmoteLoop = true, EmoteMoving = true }},
		["burger"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger",	AnimationOptions = { Prop = 'prop_cs_burger_01', PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
		["beer"] = {"amb@world_human_drinking@beer@male@idle_a", "idle_c", "Beer", AnimationOptions = { Prop = 'prop_amb_beer_bottle', PropBone = 28422, PropPlacement = {0.0,0.0,0.06,0.0,15.0,0.0}, EmoteLoop = true, EmoteMoving = true }},
		["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger","Ego Bar", AnimationOptions = { Prop = 'prop_choc_ego', PropBone = 60309, PropPlacement ={0.0,0.0,0.0,0.0,0.0,0.0}, EmoteMoving = true }},
		["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions = { Prop = 'prop_sandwich_01', PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
		["smoke3"] = { "amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke 3", AnimationOptions = { Prop = 'prop_cs_ciggy_01', PropBone = 28422, PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0}, EmoteLoop = true, EmoteMoving = true }},
		["whiskey"] = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions = { Prop = 'prop_drink_whisky', PropBone = 28422, PropPlacement = {0.01,-0.01,-0.06,0.0,0.0,0.0}, EmoteLoop = true, EmoteMoving = true } },
		["vodkab"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle", AnimationOptions = { Prop = 'prop_vodka_bottle', PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
		["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions = { Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0}, EmoteLoop = true, EmoteMoving = true, }},
		["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions = { Prop = 'prop_amb_donut', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true }},
		["candybox"] = {"mp_player_inteat@pnq", "loop", "Candy", AnimationOptions = { Prop = 'ng_proc_candy01a', PropBone = 60309, PropPlacement = {-0.0300, 0.0180, 0.0, 180.0, 180.0, -88.099}, EmoteMoving = true, }},
		["hotdog"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Hotdog", AnimationOptions = { Prop = 'prop_cs_hotdog_02', PropBone = 60309, PropPlacement = { -0.0300, 0.0100, 0.0100, 95.1071, 94.7001, -66.9179 }, EmoteMoving = true }},
		["uwu1"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_sml_drink', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["uwu2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_lrg_drink', PropBone = 28422, PropPlacement = {0.03, 0.0, -0.08, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["uwu3"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_cup_straw', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["uwu4"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_mug', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["uwu5"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_pastry', PropBone = 18905, PropPlacement = {0.16, 0.06, -0.03, -50.0, 16.0, 60.0}, EmoteMoving = true, }},
		["uwu6"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_cookie', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, 20.0, 60.0}, EmoteMoving = true, }},
		["uwu7"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_sushi', PropBone = 18905, PropPlacement = {0.18, 0.03, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, }},
		["uwu8"] = {"amb@world_human_seat_wall_eating@male@both_hands@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_eggroll', PropBone = 60309, PropPlacement = {0.10, 0.03, 0.08, -95.0, 60.0, 0.0}, EmoteMoving = true, }},
		["uwu9"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "", AnimationOptions = { Prop = "uwu_salad_bowl", PropBone = 60309, PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0}, SecondProp = 'uwu_salad_spoon', SecondPropBone = 28422, SecondPropPlacement = {0.0, 0.0 ,0.0, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["uwu10"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_sandy', PropBone = 18905, PropPlacement = {0.16, 0.08, 0.05, -225.0, 20.0, 60.0}, EmoteMoving = true, }},
		["uwu11"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_cupcake', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.03, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["uwu12"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_btea', PropBone = 28422, PropPlacement = {0.02, 0.0, -0.05, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["uwu13"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_gdasik', PropBone = 18905, PropPlacement = {0.16, 0.08, 0.02, -225.0, 20.0, 60.0}, EmoteMoving = true, }},
		["flute"] = { "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute", AnimationOptions = { Prop = 'prop_champ_flute', PropBone = 18905, PropPlacement = {0.10,-0.03,0.03,-100.0,0.0,-10.0}, EmoteMoving = true, EmoteLoop = true}},

		-- koi emotes
		["koiramune"] = {"mp_player_intdrink", "loop_bottle", "Koi Ramune", AnimationOptions = { Prop = "prop_cs_script_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		
		--Atoms Only new emotes
		["atomstriplecheeseburger"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Atoms Triple Cheese Burger",	AnimationOptions = { Prop = 'gn_upnatom_vw_the_triple_cheesy_bacon_burger', PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
		["atomstripleburger"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Atoms Triple Burger",	AnimationOptions = { Prop = 'gn_upnatom_vw_the_triple_burger', PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
		["atomsbeacontriplecheeseburger"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Atoms Bacon Triple Cheese Burger",	AnimationOptions = { Prop = 'gn_upnatom_vw_the_10_slice_of_bacon_triple_cheese_melt', PropBone = 18905, PropPlacement = {0.13,0.08,0.03,-100.0,0.0,10.0}, EmoteMoving = true }},
		["atomorangotang"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Orangotang",	AnimationOptions = { Prop = 'gn_upnatom_vw_tray_orangotang', PropBone = 18905, PropPlacement = {0.13,0.08,0.03,-100.0,0.0,10.0}, EmoteMoving = true }},
		["atommeteorite"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Meteorite",	AnimationOptions = { Prop = 'gn_upnatom_vw_tray_meteorite', PropBone = 18905, PropPlacement = {0.13,0.08,0.03,-100.0,0.0,10.0}, EmoteMoving = true }},
		["atomsoda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Atom Soda", AnimationOptions = { Prop = 'gn_upnatom_vw_soda_cup', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.1, 0.0, 0.0, -50.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atommilk"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Atom Milk Bottle", AnimationOptions = { Prop = 'gn_upnatom_vw_milk', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.02, 0.0, 0.0, -50.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atommilkshake"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Atom Milkshake", AnimationOptions = { Prop = 'gn_upnatom_vw_jumbo_shake', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.02, 0.0, 0.0, -50.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atomfries"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Atom Fries", AnimationOptions = { Prop = 'gn_upnatom_vw_fries', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.02, 0.0, 0.0, -50.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atomchilidog"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Atom Chili Dog", AnimationOptions = { Prop = 'gn_upnatom_vw_footlong_chili_dog', PropBone = 60309, PropPlacement = { -0.0300, 0.0100, -0.02, 95.1071, 94.7001, -66.9179 }, EmoteMoving = true }},
		["atomcoffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Atom Coffee", AnimationOptions = { Prop = 'gn_upnatom_vw_coffee', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.1, 0.0, 0.0, -50.0}, EmoteLoop = true, EmoteMoving = true, }},

		--Drugs
		["coke"] = { "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", "Coke", AnimationOptions = { EmoteLoop = true, EmoteMoving = true, }},
		["oxy"] = { "mp_suicide", "pill", "Oxy", AnimationOptions = { EmoteLoop = true, EmoteMoving = true, }},
		["cigar"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar", AnimationOptions = { Prop = 'prop_cigar_02', PropBone = 47419, PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0}, EmoteMoving = true, EmoteDuration = 2600 }},
		["cigar2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar 2", AnimationOptions = { Prop = 'prop_cigar_01', PropBone = 47419, PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0}, EmoteMoving = true, EmoteDuration = 2600 }},
		["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions = { Prop = 'p_cs_joint_02', PropBone = 47419, PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0}, EmoteMoving = true, EmoteDuration = 2600 }},
		["cig"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cig", AnimationOptions = { Prop = 'prop_amb_ciggy_01', PropBone = 47419, PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0}, EmoteMoving = true, EmoteDuration = 2600 }},
	},
}
