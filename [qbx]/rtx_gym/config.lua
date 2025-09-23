Config = {}

Config.Framework = "standalone"  -- types (standalone, qbcore, esx)

Config.ESXFramework = {
	newversion = true, -- use this if you using new esx version (if you get error with old esxsharedobjectmethod in console)
	getsharedobject = "esx:getSharedObject",
	resourcename = "es_extended"
}

Config.PlayerLoadedEvent = { -- load methods of gym
	esx = "esx:playerLoaded", 
	qbcore = "QBCore:Client:OnPlayerLoaded",
	standalone = "playerLoaded",
	customevent = true, -- enable this if you dont want load gym after player loaded to server. (enable this for example for servers with multicharacter)
	standaloneevent = false, -- enable this if you dont want load gym after player loaded to server. (for standalone version)
}

Config.DifferentStatsSystem = false -- enable this if you want disable our stat system, you can add your triggers in our other.lua file

Config.QBCoreFrameworkResourceName = "qb-core" -- qb-core resource name, change this if you have different name of main resource of qbcore

Config.InterfaceColor = "#ff66ff" -- change interface color, color must be in hex

Config.Language = "English" -- text language from code (English, German)

Config.DisablePlayerKeyboardWhenExercise = false -- enable this if you want disable player keyboard when he exercise

Config.ReducingStatsWhenNotExercising = false -- enable this if you want decrease stats when player doesnt exercise.

Config.ReduceStatsTime = {condition = {decreasevalue = 1.0, decreasetime = 1}, strenght = {decreasevalue = 1.0, decreasetime = 1}, water = {decreasevalue = 1.0, decreasetime = 1}} -- decrease time in minutes

Config.GymReactionMinigame = true -- Turn this feature on if you want the player to have a reaction minigame while exercising, so it won't be so easy for the player to get stats.

Config.GymReactionMinigameKey = "SPACE" -- key the player must press to react

Config.Showers = true -- enable shower system

Config.ShowerTime = 25 -- shower time in seconds

Config.OwneableGyms = true -- enable this if you want to have owneable gyms

Config.GymSellMultipler = 0.75 -- money which player will get when he sell gym 

Config.GymPassMultipler = 2.50 -- price for gym pass (its calculated from onetime price to gym)

Config.GymMaxPrice = 1000 -- maximum of gym price for all gyms 

Config.DisableIncreaseStatsNotify = false -- disable notify when some stats increase

Config.DisableDecreaseStatsNotify = false -- disable notify when some stats decrease

Config.GymDistancePay = 1.5 -- distance for gym menu

Config.GymDistanceManagment = 1.5 -- distance for gym managment menu

Config.GymTransferMaxDistance = 3.5 -- maximum distance for transfer gym to player

Config.GymExerciseDistance = 1.5 -- distance for exercise

Config.GymShowerDistance = 1.5 -- distance for shower

Config.Target = true -- enable this if you want use target

Config.Targettype = "oxtarget" -- types - qtarget, qbtarget, oxtarget

Config.TargetSystemsNames = {qtarget = "qtarget", qbtarget = "qb-target", oxtarget = "ox_target"}

Config.GymEntryManagmentMarker = false -- enable this if you want to have marker for entry and managment menu

Config.MarkerStyle = {entry = {markertype = 1, markercolor = {r = 255, g = 102, b = 255}, markersize = {x = 1.5, y = 1.5, z = 1.0}}, managment = {markertype = 1, markercolor = {r = 255, g = 102, b = 255}, markersize = {x = 1.5, y = 1.5, z = 1.0}}} 

Config.TargetIcons = {exerciseicon = "fa-solid fa-dumbbell", payicon = "fa-solid fa-cart-shopping", managmenticon = "fa-solid fa-bars-progress", showericon = "fa-solid fa-shower"} 

Config.GymOpenEntryMenuKey = "E" -- gym entry menu key

Config.GymOpenManagmentMenuKey = "E" -- gym entry menu key

Config.GymExerciseKey = "E" -- gym exercise key

Config.GymExerciseStopKey = "F" -- gym exercise stop key

Config.GymExerciseShowerKey = "E" -- gym shower key

Config.PushUpsCommand = "pushups" -- pushups command

Config.SitUpsCommand = "situps" -- situps command

Config.YogaCommand = "yoga" -- yoga command

Config.OpenMyStatsViaCommand = true -- this will enable mystats show via commad 

Config.MyStatsCommand = "mystats" -- mystats command, only work if you enable Config.OpenMyStatsViaCommand

Config.DisablePedInMyStats = false -- enable this if you dont want a ped inside a my stats menu

Config.OpenMyStatsViaEvent = false -- this will enable mystats show via event, for show TriggerEvent("rtx_gym:ShowStats", true), for hide TriggerEvent("rtx_gym:ShowStats", false)

Config.MyStatsEvent = "rtx_gym:ShowStats" -- mystats show event, only work if you enable Config.OpenMyStatsViaEvent

Config.GymInteractionSystem = 1 -- 1 == Our custom interact system, 2 == 3D Text Interact, 3 == Gta V Online Interaction Style

Config.LungCapacityIncrease = {mintime = 5000, maxtime = 10000} -- minimum and maximum time for increase lung capacity when player is under water.

Config.ConditionIncreaseByNormalRunning = true -- increase condition when player run withount treadmill

Config.ConditionIncrease = {mintime = 5000, maxtime = 10000} -- minimum and maximum time for increase lung capacity when player is under water.

Config.EnergyRegenerate = {mintime = 2500, maxtime = 5000} -- minimum and maximum time for increase lung capacity when player is under water.

Config.SaveWhenStatsAreUpdated = false -- turn this on if you want stats to be saved whenever a player's stats change

Config.StatsMaxData = {
	["strenght"] = {
		maxdata = 100.0
	},
	["condition"] = {
		maxdata = 100.0
	},
	["swimming"] = {
		maxdata = 100.0
	},	
	["hygiene"] = {
		maxdata = 100.0
	},	
	["energy"] = {
		maxdata = 100.0
	},		
}

Config.Supplements = {
	["protein"] = {
		duration = 10, -- in minutes
		increase = 1.10, -- increase of stats (bigger number is better)
		decrease = 0.8, -- increase of stats (lower number is better)
	},
	["creatine"] = {
		duration = 10, -- in minutes 
		increase = 1.50, -- increase of stats (bigger number is better)
		decrease = 0.8, -- increase of stats (lower number is better)
	},
	["preworkout"] = {
		duration = 10, -- in minutes
		increase = 1.25, -- increase of stats (bigger number is better)
		decrease = 0.5, -- increase of stats (lower number is better)
	},	
	["testosterone"] = {
		duration = 10, -- in minutes 
		increase = 2.50, -- increase of stats (bigger number is better)
		decrease = 0.7, -- increase of stats (lower number is better)
	},			
}

Config.Exercises = {
	["bench"] = {
		statsadd = {
			["strenght"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 5.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},	
	["squat"] = {
		statsadd = {
			["strenght"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 1.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},	
	["chinups"] = {
		statsadd = {
			["strenght"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 1.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},	
	["barbell1"] = {
		statsadd = {
			["strenght"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 1.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},		
	["barbell2"] = {
		statsadd = {
			["strenght"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 1.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},	
	["box"] = {
		statsadd = {
			["strenght"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 1.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},	
	["run"] = {
		statsadd = {
			["condition"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 1.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},	
	["pushups"] = {
		statsadd = {
			["strenght"] = {
				adddata = 1.0
			},
		},
		statsneed = {
			["energy"] = 0.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},
	["situps"] = {
		statsadd = {
			["strenght"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 1.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},	
	["yoga"] = {
		statsadd = {
			["stress"] = { -- this is custom stats, you need configure add stress in other.lua file!
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 1.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
			["hygiene"] = 2.5,
		},		
	},		
	["swimming"] = {
		statsadd = {
			["swimming"] = {
				adddata = 1.0,
			},
		},
		statsneed = {
			["energy"] = 0.0,
		},
		statsneedremove = {
			["energy"] = 1.0,
		},		
	},		
}

Config.Gyms = {
	{
		gymcoords = vector3(-1207.25, -1571.51, 4.59), -- coords for blip and also coords for gym menu (if gympayed is disables menu will not show)
		gymname = "Muscle Sands",
		gymblip = {blip = true, blipiconid = 311, blipdisplay = 4, blipcolor = 3, blipshortrange = true, blipscale = 1.0},
		gympayed = true, -- enable this if you want payed gym for player, so players need always pay for use machines in gym)
		gymprice = 1000, -- the price of entry to the gym
		gymtime = 10, -- time a player can be in the gym after payment (in minutes)
		gympassdays = 10, -- after how many days does it take away a person's gym pass
		gymowneable = true, -- enable this if you want to have buyable gyms (you need enable also Config.OwneableGyms)
		gymmanagmentcoords = vector3(-1195.65, -1577.49, 4.6), -- coords for gym buy and managment menu
		gymowneableprice = 1000, -- price of gym for sale
		exercises = {
			{
				exercisetype = "chinups", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1199.98, -1571.18, 4.6), 
				heading = 217.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "chinups", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1204.78, -1564.31, 4.6), 
				heading = 35.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1199.03, -1574.55, 3.6), 
				heading = 35.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1196.9, -1573.07, 3.6), 
				heading = 35.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1202.86, -1565.34, 3.6), 
				heading = 207.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1210.4, -1561.34, 3.6), 
				heading = 255.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},				
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1197.71, -1568.04, 4.01), 
				heading = 305.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1201.08, -1575.29, 4.01), 
				heading = 215.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1200.85, -1562.31, 4.01), 
				heading = 124.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},				
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1206.96, -1561.01, 4.01), 
				heading = 213.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell2", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1202.54, -1572.97, 4.6), 
				heading = 306.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell2", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1209.44, -1559.08, 4.6), 
				heading = 234.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "barbell2", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1198.14, -1565.5, 4.6), 
				heading = 153.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell1", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1204.17, -1557.18, 4.6), 
				heading = 150.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell1", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1207.88, -1566.28, 4.6), 
				heading = 305.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},					
		},
	},	
	{
		gymcoords = vector3(259.01, -269.51, 52.96), -- coords for blip and also coords for gym menu (if gympayed is disables menu will not show)
		gymname = "LA Fitness", -- https://www.youtube.com/watch?v=LXm9ix0fF4Y (Map)
		gymblip = {blip = true, blipiconid = 311, blipdisplay = 4, blipcolor = 3, blipshortrange = true, blipscale = 1.0},
		gympayed = true, -- enable this if you want payed gym for player, so players need always pay for use machines in gym)
		gymprice = 2000, -- the price of entry to the gym
		gymtime = 60, -- time a player can be in the gym after payment (in minutes)
		gympassdays = 30, -- after how many days does it take away a person's gym pass
		gymowneable = true, -- enable this if you want to have buyable gyms (you need enable also Config.OwneableGyms)
		gymmanagmentcoords = vector3(258.03, -272.43, 52.96), -- coords for gym buy and managment menu
		gymowneableprice = 1000, -- price of gym for sale
		exercises = {
			{
				exercisetype = "chinups", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(251.24, -266.91, 59.91), 
				heading = 70.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "chinups", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(248.77, -268.32, 59.91), 
				heading = 250.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(253.23, -256.67, 58.95), 
				heading = 161.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(255.9, -257.94, 58.95), 
				heading = 161.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(256.31, -259.71, 58.95), 
				heading = 70.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(255.23, -262.45, 58.95), 
				heading = 70.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},				
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(246.72, -263.37, 59.4), 
				heading = 248.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(243.86, -262.43, 59.4), 
				heading = 70.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1200.85, -1562.31, 4.01), 
				heading = 124.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},				
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1206.96, -1561.01, 4.01), 
				heading = 213.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell2", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(253.16, -269.25, 59.91), 
				heading = 250.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell2", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(237.87, -268.52, 59.91), 
				heading = 341.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "barbell1", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(254.28, -266.17, 59.91), 
				heading = 245.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell1", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(252.46, -271.27, 59.91), 
				heading = 245.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(236.57, -261.74, 60.06), 
				heading = 64.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(237.37, -259.2, 60.06), 
				heading = 52.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(239.21, -257.59, 60.06), 
				heading = 46.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(240.6, -256.33, 60.06), 
				heading = 34.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(242.17, -255.63, 60.06), 
				heading = 13.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(244.29, -255.18, 60.06), 
				heading = 5.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(246.36, -255.45, 60.06), 
				heading = 353.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(248.91, -255.86, 60.06), 
				heading = 341.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},					
		},
	},		
	{
		gymcoords = vector3(-1253.9, -354.39, 35.95), -- coords for blip and also coords for gym menu (if gympayed is disables menu will not show)
		gymname = "Pump & Run", -- https://www.gta5-mods.com/maps/mlo-pump-run-gym-add-on-sp-fivem-ragemp (Map)
		gymblip = {blip = true, blipiconid = 311, blipdisplay = 4, blipcolor = 3, blipshortrange = true, blipscale = 1.0},
		gympayed = true, -- enable this if you want payed gym for player, so players need always pay for use machines in gym)
		gymprice = 2000, -- the price of entry to the gym
		gymtime = 60, -- time a player can be in the gym after payment (in minutes)
		gympassdays = 30, -- after how many days does it take away a person's gym pass
		gymowneable = true, -- enable this if you want to have buyable gyms (you need enable also Config.OwneableGyms)
		gymmanagmentcoords = vector3(-1255.89, -355.71, 35.95), -- coords for gym buy and managment menu
		gymowneableprice = 1000, -- price of gym for sale
		exercises = {
			{
				exercisetype = "chinups", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1257.11, -358.51, 36.95), 
				heading = 123.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "chinups", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1258.75, -355.34, 36.95), 
				heading = 158.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "chinups", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1271.75, -360.14, 37.04), 
				heading = 120.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},			
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1269.78, -362.58, 35.98), 
				heading = 300.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1268.16, -366.04, 35.98), 
				heading = 300.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},			
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1267.23, -355.15, 36.40), 
				heading = 193.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1261.87, -354.24, 36.40), 
				heading = 210.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell2", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1268.55, -357.59, 36.95), 
				heading = 119.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell1", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1264.13, -356.85, 36.95), 
				heading = 205.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1257.65, -366.58, 37.11), 
				heading = 209.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1259.12, -367.33, 37.11), 
				heading = 209.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1260.61, -368.18, 37.11), 
				heading = 209.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1262.05, -369.01, 37.11), 
				heading = 209.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1263.44, -369.74, 37.11), 
				heading = 209.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "run", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-1264.76, -370.57, 37.11), 
				heading = 209.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},				
		},
	},
	{
		gymcoords = vector3(-53.35, -1289.33, 29.9), -- coords for blip and also coords for gym menu (if gympayed is disables menu will not show)
		gymname = "Los Santos GYM", -- https://forum.cfx.re/t/release-mlo-los-santos-gym/1051705 (Map)
		gymblip = {blip = true, blipiconid = 311, blipdisplay = 4, blipcolor = 3, blipshortrange = true, blipscale = 1.0},
		gympayed = true, -- enable this if you want payed gym for player, so players need always pay for use machines in gym)
		gymprice = 2000, -- the price of entry to the gym
		gymtime = 60, -- time a player can be in the gym after payment (in minutes)
		gympassdays = 30, -- after how many days does it take away a person's gym pass
		gymowneable = true, -- enable this if you want to have buyable gyms (you need enable also Config.OwneableGyms)
		gymmanagmentcoords = vector3(-52.53, -1291.92, 29.9), -- coords for gym buy and managment menu
		gymowneableprice = 1000, -- price of gym for sale
		exercises = {
			{
				exercisetype = "chinups", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-59.12, -1285.0, 30.9), 
				heading = 179.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},		
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-63.02, -1289.04, 29.9), 
				heading = 270.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "squat", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-62.82, -1285.75, 29.9), 
				heading = 270.0,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},			
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-62.74, -1278.79, 30.35), 
				heading = 179.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},
			{
				exercisetype = "bench", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-59.16, -1278.99, 30.35), 
				heading = 179.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell2", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-59.32, -1282.51, 30.9), 
				heading = 269.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "barbell1", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-62.64, -1282.38, 30.9), 
				heading = 269.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "box", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-59.85, -1290.81, 30.9), 
				heading = 178.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},	
			{
				exercisetype = "box", -- types - bench, squat, chinups, barbell1, barbell2, box, run
				coords = vector3(-62.05, -1290.79, 30.9), 
				heading = 178.5,
				status = {taken = false, takenplayerid = nil}, -- dont edit this
			},					
		},
	},			
} 

Config.Showers = {
	{
		coords = vector3(-1252.51, -1543.24, 4.29),
		coordsparticle = vector3(-1252.51, -1543.24, 8.29),
		heading = 350.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},
	{
		coords = vector3(272.43, -272.44, 53.97),
		coordsparticle = vector3(272.63, -272.52, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(272.01, -274.03, 53.97),
		coordsparticle = vector3(272.09, -274.06, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(271.41, -275.43, 53.97),
		coordsparticle = vector3(271.58, -275.52, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(270.91, -277.04, 53.97),
		coordsparticle = vector3(271.02, -277.07, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(270.19, -278.74, 53.97),
		coordsparticle = vector3(270.38, -278.76, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(282.11, -275.97, 53.97),
		coordsparticle = vector3(282.19, -276.0, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(281.59, -277.49, 53.97),
		coordsparticle = vector3(281.65, -277.48, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(281.07, -278.83, 53.97),
		coordsparticle = vector3(281.13, -278.88, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(280.39, -280.38, 53.97),
		coordsparticle = vector3(280.58, -280.45, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},	
	{
		coords = vector3(279.88, -281.97, 53.97),
		coordsparticle = vector3(280.0, -281.99, 54.85),
		heading = 250.0,
		taken = false,
		takenplayerid = nil,
		particlehandler = nil,
	},		
}


function Notify(text)
	exports["rtx_notify"]:Notify("Gym", text, 5000, "info") -- if you get error in this line its because you dont use our notify system buy it here https://rtx.tebex.io/package/5402098 or you can use some other notify system just replace this notify line with your notify system
	--exports["mythic_notify"]:SendAlert("inform", text, 5000)
end

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 240
		DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 255, 102, 255, 150)
	end
end