Config = {}

Config.Language = "English" -- text language from code (English, German)

Config.QBCoreFrameworkResourceName = "qb-core" -- qb-core resource name, change this if you have different name of main resource of qbcore

Config.InterfaceColor = "#ff66ff" -- change interface color, color must be in hex

Config.HotTubSitDistance = 1.0

Config.HotTubCoverManagmentDistance = 1.0

Config.HotTubManagmentDistance = 1.0

Config.CoverManagmentCooldown = 60000

Config.TvCooldown = 5000

Config.ClothesWetting = true

Config.DefaultKeyBindCoverManagment = "E"

Config.DefaultKeyBindHotTubManagment = "G"

Config.DefaultKeyBindSit = "E"

Config.RemoveHottubCommand = "removehottub" -- command for remove hottub

Config.SitNotify = true

Config.HotTubSpawnDuration = 10 -- in seconds

Config.HotTubRemoveDuration = 10 -- in seconds

Config.DisableNozzlesSound = false -- it will disable sound but also particle!

Config.Target = true -- enable this if you want use target and 3d texts

Config.Targettype = "oxtarget" -- types - qtarget, qbtarget, oxtarget

Config.TargetSystemsNames = {qtarget = "qtarget", qbtarget = "qb-target", oxtarget = "ox_target"}

Config.TargetIcons = { -- icons must be from fontawesome.com/icons
	["covermanagmenticon"] = "fa-solid fa-bars-progress", -- Cover Managment Icon 
	["hottubmanagmenticon"] = "fa-solid fa-bars-progress", -- Hottub Managment Icon
	["siticon"] = "fa-solid fa-chair", -- Sit Icon
}

Config.LightSpeed = { --in miliseconds
    {lightspeed = 500},
	{lightspeed = 1500},
	{lightspeed = 4500},
}

Config.CustomPedsOffsets = { -- offsets for custom ped models
    {
        pedmodel = "player_one", -- ped model name
		offset = vector3(0.0, 0.0, 0.05),  -- z offset
	},
}

Config.HotTubs = {
    {
        coords = vector3(-1826.69, -754.6, 8.2),
		rotation = vector3(0.0, 0.0, 50.0),
		objecthandler = nil,
		hottubstairs = true,
		hottubtype = 1,
		closed = true,
		manipulating = false,
		manipulatingplayerid = nil,
		covermanipulating = false,
		covermanipulatingplayerid = nil,	
		covercooldown = false,
		coverhandlers = {
			{handler = nil},
			{handler = nil},
		},
		spawnedbyplayer = false,
		light = false,
		lightrgb = false,
		lightrgbspeed = 1,
		lightselected = 1,
		lighthandlers = {
			{handler = nil}, 
			{handler = nil}, 
			{handler = nil}, 
			{handler = nil}, 
			{handler = nil}, 
			{handler = nil}, 
			{handler = nil}, 
			{handler = nil}, 
			{handler = nil}, 
			{handler = nil}, 
		},
		tvopened = false,
		tvhandler = nil,
		tvcooldown = false,
		nozzlesactivated = false,
		waterhandler = nil,
		waternozzlehandler = nil,		
		nozzles = {
			{handler = nil, offsetxcategory = "minus", offsetx = -0.54, offsetycategory = "minus", offsety = -1.58, rotation = vector3(0.0, 0.0, 0.0)},
			{handler = nil, offsetxcategory = "plus", offsetx = 0.51, offsetycategory = "minus", offsety = -1.58, rotation = vector3(0.0, 0.0, 0.0)},
			{handler = nil, offsetxcategory = "minus", offsetx = -0.54, offsetycategory = "plus", offsety = 1.58, rotation = vector3(0.0, 0.0, 180.0)},
			{handler = nil, offsetxcategory = "plus", offsetx = 0.51, offsetycategory = "plus", offsety = 1.58, rotation = vector3(0.0, 0.0, 180.0)},		
			{handler = nil, offsetxcategory = "minus", offsetx = -1.58, offsetycategory = "minus", offsety = -0.52, rotation = vector3(0.0, 0.0, 270.0)},
			{handler = nil, offsetxcategory = "plus", offsetx = 1.58, offsetycategory = "minus", offsety = -0.52, rotation = vector3(0.0, 0.0, 90.0)},
			{handler = nil, offsetxcategory = "minus", offsetx = -1.58, offsetycategory = "plus", offsety = 0.52, rotation = vector3(0.0, 0.0, 270.0)},
			{handler = nil, offsetxcategory = "plus", offsetx = 1.58, offsetycategory = "plus", offsety = 0.52, rotation = vector3(0.0, 0.0, 90.0)},		
		},				
		seats = {
			{taken = false, takenplayerid = nil, offsetx = 1.3, offsety = 0.5, heading = 100.0},
			{taken = false, takenplayerid = nil, offsetx = 1.3, offsety = -0.5, heading = 100.0},
			{taken = false, takenplayerid = nil, offsetx = -1.3, offsety = -0.5, heading = -80.0},
			{taken = false, takenplayerid = nil, offsetx = -1.3, offsety = 0.5, heading = -80.0},
			{taken = false, takenplayerid = nil, offsetx = -0.5, offsety = 1.3, heading = 180.0},	
			{taken = false, takenplayerid = nil, offsetx = 0.5, offsety = 1.3, heading = 180.0},
			{taken = false, takenplayerid = nil, offsetx = 0.5, offsety = -1.3, heading = 0.0},	
			{taken = false, takenplayerid = nil, offsetx = -0.5, offsety = -1.3, heading = 0.0},
		},		
    },		
}

function Notify(text)
	exports["rtx_notify"]:Notify("HotTub", text, 5000, "info") -- if you get error in this line its because you dont use our notify system buy it here https://rtx.tebex.io/package/5402098 or you can use some other notify system just replace this notify line with your notify system
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

function AddTargetZone(targettype, targetnamedata, targettypedata, targetheading, targetdistance, targetlabel, targeticon, targetevent)
	if Config.Targettype == "qtarget" then
		if targettype == "coords" then
			local targetcoordsdata = vector3(targettypedata.x, targettypedata.y, targettypedata.z+0.5)
			exports[Config.TargetSystemsNames.qtarget]:AddBoxZone(targetnamedata, targetcoordsdata, 2.5, 2.5, {
				name = targetnamedata,
				heading = targetheading,
				debugPoly = false,
				minZ = targetcoordsdata.z-1.5,
				maxZ = targetcoordsdata.z+1.5,
				}, {
					options = {
						{
							event = targetevent,
							icon = targeticon,
							label = targetlabel
						},
					},
					distance = targetdistance
			})	
		else
			exports[Config.TargetSystemsNames.qtarget]:AddTargetModel({GetHashKey(targettypedata)}, {
				options = {
					{
						name = targetnamedata,
						event = targetevent,
						icon = targeticon,
						label = targetlabel,
					},
				},
				distance = targetdistance
			})		
		end
	elseif Config.Targettype == "qbtarget" then
		if targettype == "coords" then
			local targetcoordsdata = vector3(targettypedata.x, targettypedata.y, targettypedata.z+0.5)
			exports[Config.TargetSystemsNames.qbtarget]:AddBoxZone(targetnamedata, targetcoordsdata, 2.5, 2.5, {
				name = targetnamedata,
				heading = targetheading,
				debugPoly = false,
				minZ = targetcoordsdata.z-1.5,
				maxZ = targetcoordsdata.z+1.5,
			}, {
				options = {
					{
					  type = "client",
					  action = function(entity) 
						TriggerEvent(targetevent)
					  end,
					  icon = targeticon,
						  label = targetlabel,
						},
					},
				distance = targetdistance
			})	
		else
			exports[Config.TargetSystemsNames.qbtarget]:AddTargetModel({GetHashKey(targettypedata)}, {
				options = {
					{
						name = targetnamedata,
						event = targetevent,
						icon = targeticon,
						label = targetlabel,
					},
				},
				distance = targetdistance
			})				
		end
	elseif Config.Targettype == "oxtarget" then								
		if targettype == "coords" then
			local targetcoordsdata = vector3(targettypedata.x, targettypedata.y, targettypedata.z+0.5)
			exports[Config.TargetSystemsNames.oxtarget]:addBoxZone({
				coords = targetcoordsdata,
				size = vec3(2, 2, 2),
				rotation = targetheading,
				options = {
					{
						name = targetnamedata,
						event = targetevent,
						icon = targeticon,
						distance = targetdistance,
						label = targetlabel,
						canInteract = function(entity, distance, coords, name)
							return true
						end
					}
				}
			})	
		else
			exports[Config.TargetSystemsNames.oxtarget]:addModel(GetHashKey(targettypedata), {
				{
					name = targetnamedata,
					event = targetevent,
					icon = targeticon,
					label = targetlabel,
				}						
			})				
		end
	end
end