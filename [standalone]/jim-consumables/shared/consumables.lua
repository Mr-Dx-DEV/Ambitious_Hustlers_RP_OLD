Config = Config or {}

Config.Consumables = {



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
    --[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Items that effect status changes, like bleeding can cause problems as they are all handled in their own scripts
    -- Testing these but they may be best left handled by default scripts
    ["ifaks"] = { 			emote = "oxy", 		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 10, armor = 0, type = "drug", stats = { effect = "heal", amount = 6, widepupils = false, canOD = false } },
    ["bandage"] = { 		emote = "oxy", 		time = math.random(5000, 6000), stress = 0, heal = 10, armor = 0, type = "drug", stats = { effect = "heal", amount = 3, widepupils = false, canOD = false } }, },
    ]]

    --Testing effects & armor with small functionality to drugs - This may be another one left to default scripts
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --[[ --Testing effects & armor with small functionality to drugs - This may be another one left to default scripts
    joint = { 			emote = "smoke3",	time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { screen = "weed", effect = "armor", widepupils = false, canOD = false } },

    cokebaggy = { 		emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { screen = "focus", effect = "stamina", widepupils = false, canOD = true } },
    --crackbaggy = { 		emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { effect = "heal", widepupils = false, canOD = true } },
    xtcbaggy = { 		emote = "oxy",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { effect = "strength", widepupils = true, canOD = true } },
    oxy = { 			emote = "oxy",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { effect = "heal", widepupils = false, canOD = false } },
    meth = { 			emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { effect = "stamina", widepupils = false, canOD = true } },
    ]]		----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --Example item
--    heartstopper = {
--        emote = "burger", 							-- Select an emote from below, it has to be in here
--        time = math.random(5000, 6000),				-- Amount of time it takes to consume the item
--        stress = math.random(1,2),					-- Amount of stress relief, can be 0
--        heal = 0, 									-- Set amount to heal by after consuming
--        armor = 5,									-- Amount of armor to add
--        type = "food",								-- Type: "alcohol" / "drink" / "food"
--        canRun = true,                                -- If true player can run while using the item, if not it will cancel the event
--
--        stats = {
--            screen = "thermal",						-- The screen effect to be played when after consuming the item "rampage" "turbo" "focus" "weed" "trevor" "nightvision" "thermal"
--            effect = "heal", 						    -- The status effect given by the item, "heal" / "stamina"
--                                                      -- This supports ps-buffs effects "armor" "stress" "swimming" "hacking" "intelligence" "luck" "strength"
--            time = 10000,							    -- How long the effect should last (if not added it will default to 10000)
--            amount = 6,								-- How much the value is changed by per second
--            hunger = math.random(10, 20),			    -- The hunger/thirst stats of the item, if not found in the items.lua
--            thirst = math.random(10, 20),			    -- The hunger/thirst stats of the item, if not found in the items.lua
--            canOD = true,                             -- This creates an OD Effect, killing the user if they have too much
--        },
--        --Reward Items Variables
--                                                      -- These can be the only thing in a consumable table and the item will still work
--        amounttogive = 3,							    -- Used for "RewardItems", tells the script how many to give
--        rewards = {
--            [1] = {
--                item = "plastic", 					-- prize item name
--                max = 10,							    -- max amount to give (this is put into math.random(1, max) )
--                rarity = 1,							-- the rarity system, 1 being rarest, 4 being most common
--            },
--        },
--    },

    -- Example Box Item
--    ["9_box"] = {                                     -- Name of the box item in the shared
--        emote = "uncuff",                             -- The emote than should run when "unboxing"
--        canRun = true,                                -- If true player can run while using the item, if not it will cancel the event
--        time = 3500,                                  -- How long it takes to use the item
--        type = "pack",                                -- Designate it as a "pack" to the script knows what to do
--        pack = {
--            item = "9_ammo",                          -- The item to give from the box when complete
--            amount = 20                               -- How many of the item to give
--        },
--    },

    -- Example Cigar Item wiht requirements
--    ["cigar"] = {                                     -- Name of the item in your shared items
--        emote = "smokecigar",                         -- The emote than should run when "smoking"
--        canRun = true,                                -- If true player can run while using the item, if not it will cancel the event
--        time = math.random(5000, 6000),               -- How long it takes to use the item
--        type = "smoke",                               -- Designate it as a "smoke" to the script knows what to do
--        requiredItem = "lighter",                     -- Set a required item making it unsable if they don't have it
--        stats = {
--            effect = "stress",
--            time = 5000,
--            amount = math.random(10, 15),
--            canOD = false
--        }
--    },
}