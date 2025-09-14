					-- Example : Delete me --

			-- Support for multiple items in recipes --
			-- Support for multiple resulting items --
			-- Support to limit items to certain job roles --
			-- ["mechanic"] = 2 -- This means Job Mechanic and Grade 2+ can ,make this item

			-- { ["cleaningkit"] = { ["rubber"] = 5, ["engine2"] = 1, ["plastic"] = 2 }, ["amount"] = 2, ["job"] = { ["mechanic"] = 2, ["tuner"] = 4, } },

					-- Example : Delete me --

Crafting = {
	Nos = {
		Header = locale("craftingMenu", "toolsHeader"),
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["nos"] 			= { ["noscan"] = 1, 		}, ["amount"] = 1, },
			{ ["noscan"] 		= { ["steel"] = 1, 			}, ["amount"] = 1, },
			{ ["noscolour"] 	= { ["plastic"] = 1, 		}, ["amount"] = 1, },
		}
	},
	Repairs = {
		Header = locale("craftingMenu", "repairHeader"),
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		progressBar = { label = locale("progressbar", "progress_make"), time = math.random(6000,8000), },
		Recipes = {
			{ ["mechanic_tools"] 	= { ["iron"] = 1, 		},	["amount"] = 1, },
			{ ["ducttape"] 			= { ["plastic"] = 1 	},	["amount"] = 1, },
			{ ["newoil"] 			= { ["rubber"] = 1 		}, 	["amount"] = 1, },
			{ ["sparkplugs"] 		= { ["copper"] = 1, 	}, 	["amount"] = 1, },
			{ ["carbattery"] 		= { ["copper"] = 1, 	}, 	["amount"] = 1, },
			{ ["axleparts"] 		= { ["steel"] = 1, 		}, 	["amount"] = 1, },
			{ ["sparetire"] 		= { ["rubber"] = 1, 	},	["amount"] = 1, },
		},
	},
	Tools = {
		Header = locale("craftingMenu", "toolsHeader"),
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["toolbox"]			= { ["iron"] = 1,		}, 	["amount"] = 1, },
			{ ["paintcan"]			= { ["aluminum"] = 1, 	}, 	["amount"] = 1, },
			{ ["tint_supplies"]		= { ["glass"] = 1, 		}, 	["amount"] = 1, },
			{ ["cleaningkit"]		= { ["rubber"] = 1, 	}, 	["amount"] = 1, },
			{ ["repairkit"]			= { ["plastic"] = 1, 	}, 	["amount"] = 1, },
			{ ["newplate"] 			= { ['plastic'] = 1,    }, ["amount"] = 1, },
		},
	},
	-- List of vanilla cars with Engine lvel 5, Suspension level 5 and/or Transmission level 4
	-- https://discord.com/channels/838364232969093140/930397127929135104/1016261453168255036
	Perform = {
		Header = locale("craftingMenu", "performanceHeader"),
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		progressBar = { label = locale("progressbar", "progress_make"), time = math.random(18000,22000), },
		Recipes = {
			{ ["turbo"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["antilag"] 			= { ["steel"] = 1,		}, ["amount"] = 1,	},
			{ ["harness"] 			= { ["steel"] = 1,		}, ["amount"] = 1,	},
			-- { ["manual"] 			= { ["steel"] = 1,		}, ["amount"] = 1, }, -- Requires https://vlad-laboratory.tebex.io/package/6113070 | Game build 3095 & above
			{ ["car_armor"] 		= { ["plastic"] = 1, 	}, ["amount"] = 1, },
			{ ["bprooftires"] 		= { ["rubber"] = 1, 	}, ["amount"] = 1, },
			{ ["drifttires"] 		= { ["rubber"] = 1, 	}, ["amount"] = 1, },


			{ ["engine1"]			= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Basic
			{ ["engine2"]			= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Standard
			{ ["engine3"]			= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Enhanced
			{ ["engine4"]			= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Performance
			{ ["engine5"]			= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Elite -- Won't install on all vehicles

			{ ["transmission1"] 	= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Basic
			{ ["transmission2"] 	= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Standard
			{ ["transmission3"] 	= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Enhanced
			{ ["transmission4"] 	= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Performance -- Won't install on all vehicles

			{ ["brakes1"] 			= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Basic
			{ ["brakes2"] 			= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Standard
			{ ["brakes3"] 			= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Enhanced

			{ ["suspension1"] 		= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Basic
			{ ["suspension2"] 		= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Standard
			{ ["suspension3"] 		= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Enhanced
			{ ["suspension4"] 		= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Performance
			{ ["suspension5"] 		= { ["iron"] = 1,		}, ["amount"] = 1, }, -- Elite -- Won't install on all vehicles

		},
	},
	Extras = {
		Header = "Extras",
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		progressBar = { label = locale("progressbar", "progress_make"), time = math.random(18000, 22000), },
		Recipes = {
			{ ["oilp1"] 			= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["oilp2"] 			= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["oilp3"] 			= { ['aluminum'] = 1,	}, ["amount"] = 1, },

			{ ["drives1"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["drives2"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["drives3"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },

			{ ["cylind1"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["cylind2"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["cylind3"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },

			{ ["cables1"] 			= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["cables2"] 			= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["cables3"] 			= { ['aluminum'] = 1,	}, ["amount"] = 1, },

			{ ["fueltank1"]			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["fueltank2"] 		= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["fueltank3"] 		= { ["iron"] = 1,		}, ["amount"] = 1, },
		}
	},
	Cosmetic = {
		Header = locale("craftingMenu", "cosmeticHeader"),
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		progressBar = { label = locale("progressbar", "progress_make"), time = math.random(12000,18000), },
		Recipes = {
			{ ["hood"] 				= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["roof"] 				= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["spoiler"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["bumper"]	 		= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["skirts"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["exhaust"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["seat"] 				= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["livery"] 			= { ['glass'] = 1,  	}, ["amount"] = 1, },
			{ ["horn"] 				= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["internals"] 		= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["externals"] 		= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["customplate"] 		= { ['aluminum'] = 1,	}, ["amount"] = 1, },
			{ ["rims"] 				= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["rollcage"] 			= { ["iron"] = 1,		}, ["amount"] = 1, },
			{ ["tires"] 			= { ["iron"] = 1, 		}, ["amount"] = 1, }, -- Drift Smoke
			{ ["headlights"] 		= { ['aluminum'] = 1,  	}, ["amount"] = 1, },
			{ ["stancerkit"] 		= { ['steel'] = 1, 		}, ["amount"] = 1, },
			{ ["newplate"] 			= { ['plastic'] = 1,    }, ["amount"] = 1, },
		},
	},
}

Stores = {
	NosItems = {
		label = locale("storeMenu", "nosItems"),
		items = {
			{ name = "nos", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "noscolour", 		price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	RepairItems = {
		label = locale("storeMenu", "repairItems"),
		items = {
			{ name = "mechanic_tools", 	price = 0, amount = 10, info = {}, type = "item", },
			{ name = "sparetire", 		price = 0, amount = 100, info = {}, type = "item", },
			{ name = "axleparts", 		price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "carbattery", 		price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "sparkplugs", 		price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "newoil", 			price = 0, amount = 1000, info = {}, type = "item", },
		},
	},
	ToolItems = {
		label = locale("storeMenu", "mechanicTools"),
		items = {
			{ name = "toolbox", 		price = 0, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "paintcan", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", 	price = 0, amount = 50, info = {}, type = "item", },
			{ name = "underglow_controller", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cleaningkit", 	price = 0, amount = 50, info = {}, type = "item", },
			{ name = "newplate", 		price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	PerformItems = {
		label = locale("storeMenu", "performanceItems"),
		items = {
			{ name = "turbo", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "car_armor", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "bprooftires", 	price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drifttires", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "harness", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "antilag", 		price = 0, amount = 50, info = {}, type = "item", },

			{ name = "engine1", 		price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "engine2", 		price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "engine3", 		price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced
			{ name = "engine4", 		price = 0, amount = 50, info = {}, type = "item", }, -- Performance
			{ name = "engine5", 		price = 0, amount = 50, info = {}, type = "item", }, -- Elite

			{ name = "transmission1", 	price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "transmission2", 	price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "transmission3", 	price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced
			{ name = "transmission4", 	price = 0, amount = 50, info = {}, type = "item", }, -- Performance

			{ name = "brakes1", 		price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "brakes2", 		price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "brakes3", 		price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced

			{ name = "suspension1", 	price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "suspension2", 	price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "suspension3", 	price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced
			{ name = "suspension4", 	price = 0, amount = 50, info = {}, type = "item", }, -- Performance
			{ name = "suspension5", 	price = 0, amount = 50, info = {}, type = "item", }, -- Elite

			{ name = "oilp1", 			price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "oilp2", 			price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "oilp3", 			price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced

			{ name = "drives1", 		price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "drives2", 		price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "drives3", 		price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced

			{ name = "cylind1", 		price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "cylind2", 		price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "cylind3", 		price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced

			{ name = "cables1", 		price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "cables2", 		price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "cables3", 		price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced

			{ name = "fueltank1", 		price = 0, amount = 50, info = {}, type = "item", }, -- Basic
			{ name = "fueltank2", 		price = 0, amount = 50, info = {}, type = "item", }, -- Standard
			{ name = "fueltank3", 		price = 0, amount = 50, info = {}, type = "item", }, -- Enhanced
		},
	},
	CosmeticItems = {
		label = locale("storeMenu", "cosmeticItems"),
		items = {
			{ name = "hood", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "roof", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "bumper", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "skirts", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "seat", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "livery", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "tires", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "horn", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "internals", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "externals", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "customplate", 	price = 0, amount = 50, info = {}, type = "item", },
			{ name = "headlights", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "rims", 			price = 0, amount = 50, info = {}, type = "item", },
			{ name = "rollcage", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "underglow", 		price = 0, amount = 50, info = {}, type = "item", },
			{ name = "stancerkit", 		price = 0, amount = 50, info = {}, type = "item", },
		},
	},
}

MaterialRecieve = {
	car_armor 		= { plastic = 1,	},
	bprooftires 	= { rubber = 1,		},
	drifttires 		= { rubber = 1,		},

	turbo 			= { iron = 1,		},
	harness 		= { steel = 1,		},
	antilag 		= { steel = 1,		},
	manual 			= { steel = 1,		},

	engine1 		= { iron = 1,		}, -- Basic
	engine2 		= { iron = 1,		}, -- Standard
	engine3 		= { iron = 1,		}, -- Enhanced
	engine4 		= { iron = 1, 		}, -- Performance
	engine5 		= { iron = 1, 		}, -- Elite

	transmission1 	= { iron = 1, 		}, -- Basic
	transmission2 	= { iron = 1, 		}, -- Standard
	transmission3 	= { iron = 1, 		}, -- Enhanced
	transmission4 	= { iron = 1, 		}, -- Performance

	brakes1 		= { iron = 1, 		}, -- Basic
	brakes2 		= { iron = 1, 		}, -- Standard
	brakes3 		= { iron = 1, 		}, -- Enhanced

	suspension1 	= { iron = 1, 		}, -- Basic
	suspension2 	= { iron = 1, 		}, -- Standard
	suspension3 	= { iron = 1, 		}, -- Enhanced
	suspension4 	= { iron = 1, 		}, -- Performance
	suspension5 	= { iron = 1, 		}, -- Elite

	oilp1 			= { aluminum = 1,  	}, -- Basic
	oilp2 			= { aluminum = 1,	}, -- Standard
	oilp3 			= { aluminum = 1, 	}, -- Enhanced

	drives1 		= { iron = 1, 		}, -- Basic
	drives2 		= { iron = 1, 		}, -- Standard
	drives3 		= { iron = 1, 		}, -- Enhanced

	cylind1 		= { iron = 1, 		}, -- Basic
	cylind2 		= { iron = 1, 		}, -- Standard
	cylind3 		= { iron = 1, 		}, -- Enhanced

	cables1 		= { aluminum = 1, 	}, -- Basic
	cables2 		= { aluminum = 1, 	}, -- Standard
	cables3 		= { aluminum = 1, 	}, -- Enhanced

	fueltank1 		= { iron = 1, 		}, -- Basic
	fueltank2 		= { iron = 1, 		}, -- Standard
	fueltank3 		= { iron = 1, 		}, -- Enhanced
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn"t use it but come other inventories do
	-- Most people don"t even edit the slots, these lines generate the slot info autoamtically
Stores.CosmeticItems.slots = #Stores.CosmeticItems.items
for k in pairs(Stores.CosmeticItems.items) do Stores.CosmeticItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end
Stores.RepairItems.slots = #Stores.RepairItems.items
for k in pairs(Stores.RepairItems.items) do Stores.RepairItems.items[k].slot = k end
Stores.NosItems.slots = #Stores.NosItems.items
for k in pairs(Stores.NosItems.items) do Stores.NosItems.items[k].slot = k end