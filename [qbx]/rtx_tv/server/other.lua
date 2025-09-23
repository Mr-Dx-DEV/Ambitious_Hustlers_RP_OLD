if Config.TelevisionWebhook then
	local webhookurl = "" --write webhookurl here
	local iconurl = "https://i.imgur.com/3snGmGq.png" -- put your icon for webhok here
	local titletext = "Television Log"
	
	function TelevisionWebhook(playersource, videourl)
		-- playesource is source of player, and videourl is url of song which player trying to play	
		local identifier = "no info" 
		local license   = "no info"
		local liveid    = "no info"
		local xblid     = "no info"
		local discord   = "no info"
		local playerip = "no info"         
		local sourceplayername = GetPlayerName(playersource)
		for k,v in ipairs(GetPlayerIdentifiers(playersource))do
			if string.sub(v, 1, string.len("steam:")) == "steam:" then
				identifier = v
			elseif string.sub(v, 1, string.len("license:")) == "license:" then
				license = v
			elseif string.sub(v, 1, string.len("live:")) == "live:" then
				liveid = v
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
				xblid  = v
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v
			elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
				playerip = v
			end
		end		
		local logtextdata = "**Player:** " ..tostring(sourceplayername).. "\n**Identifier:** " ..tostring(identifier).. "\n**License:** " ..tostring(license).. "\n**LiveID:** " ..tostring(liveid).. "\n**XboxID:** " ..tostring(xblid).. "\n**Discord:** " ..tostring(discord).. "\n**IP:** " ..tostring(playerip).. "\n\n**Player played this song:** \n" ..tostring(videourl).. ""
		local embed = {
			{
				["title"] = titletext,
				["type"] = "rich",
				["description"] = logtextdata,
				["color"] = 16738047,
				["footer"] = {["text"] = "Made by Kanikuly#7253 Provided by RTX Development discord.gg/P6KdaDpgAk | " ..os.date("%x (%X %p)"), ["icon_url"] = iconurl},
			}
		}
		PerformHttpRequest(webhookurl, function(err, text, headers) end, "POST", json.encode({username = name, embeds = embed}), { ["Content-Type"] = "application/json" })		
	end
end

if Config.Framework == "custom" then
	--TriggerClientEvent("rtx_tv:TVRemote", playersource) remote control trigger you can implement this event to your usable item for example
	
	--TriggerClientEvent("rtx_tv:InstallVehicleTVClient", playersource) Trigger for install vehicle to tv

	RTXTV.RegisterServerCallback("rtx_tv:CheckVehicleTV", function(source, cb, tvplatedata)
		local playersource = source
		MySQL.Async.fetchScalar('SELECT 1 FROM playervehiclestable WHERE plate = @plate AND vehicletv = @vehicletv ', {
			['@plate'] = tostring(tvplatedata),
			['@vehicletv'] = true,
		}, function(found)
			if found then
				cb(true)
			else								
				cb(false)
			end
		end)
	end)

	RegisterServerEvent("rtx_tv:InstallVehicleTV")
	AddEventHandler("rtx_tv:InstallVehicleTV", function(tvplatedata, vehiclenetworkdata)
		local playersource = source
		if tvplatedata ~= nil then	
			MySQL.Async.fetchScalar('SELECT 1 FROM playervehiclestable WHERE plate = @plate', {
				['@plate'] = tostring(tvplatedata),
			}, function(found)
				if found then
					MySQL.Sync.execute('UPDATE playervehiclestable SET vehicletv = @vehicletv WHERE plate = @plate', {
						['@plate'] = tostring(tvplatedata),
						['@vehicletv'] = true
					})	
					TriggerClientEvent("rtx_tv:Notify", playersource, Language[Config.Language]["tvinstalled"])
					TriggerClientEvent("rtx_tv:TVInstalledVehicleClient", playersource, vehiclenetworkdata)
				else								
					TriggerClientEvent("rtx_tv:Notify", playersource, Language[Config.Language]["vehiclenotowned"])
				end
			end)			
		end
	end)

	RegisterServerEvent("rtx_tv:InstallVehicleTVCustom")
	AddEventHandler("rtx_tv:InstallVehicleTVCustom", function(tvplatedata, vehiclenetworkdata)
		local playersource = source
		if tvplatedata ~= nil then	
			MySQL.Async.fetchScalar('SELECT 1 FROM playervehiclestable WHERE plate = @plate', {
				['@plate'] = tostring(tvplatedata),
			}, function(found)
				if found then
					MySQL.Sync.execute('UPDATE playervehiclestable SET vehicletv = @vehicletv WHERE plate = @plate', {
						['@plate'] = tostring(tvplatedata),
						['@vehicletv'] = true
					})	
					TriggerClientEvent("rtx_tv:Notify", playersource, Language[Config.Language]["tvinstalled"])
					TriggerClientEvent("rtx_tv:TVInstalledVehicleClient", playersource, vehiclenetworkdata)
				else								
					TriggerClientEvent("rtx_tv:Notify", playersource, Language[Config.Language]["vehiclenotowned"])
				end
			end)			
		end
	end)	
end

function GetPlayerPermissionsControlTV(playersource, tviddata)
	local playerallowed = false
	local tvhandlerperm = Config.TelevisionPermissionsLocations[tviddata]
	if tvhandlerperm.acepermissions.enable == true then
		if IsPlayerAceAllowed(playersource, tvhandlerperm.acepermissions.permission) then 
			playerallowed = true
		end
	end
	if tvhandlerperm.jobpermissions.enable == true then
		if Config.Framework == "esx" then
			local xPlayer = ESX.GetPlayerFromId(playersource)
			if xPlayer then
				if xPlayer.job.name == tvhandlerperm.jobpermissions.jobname then
					playerallowed = true
				end
			end
		elseif Config.Framework == "qbcore" then
			local xPlayer = QBCore.Functions.GetPlayer(playersource)
			if xPlayer then	
				if xPlayer.PlayerData.job.name == tvhandlerperm.jobpermissions.jobname then
					playerallowed = true
				end
			end
		elseif Config.Framework == "standalone" then
			-- add here your job check function
		end
	end	
	if tvhandlerperm.identifierspermissions == true then
		local licensedata = "unknown"
		local steamdata = "unknown"
		local xboxdata = "unknown"
		local livedata = "unknown"
		local discorddata = "unknown"
		local ipdata = "unknown"
		for i, licensehandler in ipairs(GetPlayerIdentifiers(playersource)) do
			if string.sub(licensehandler, 1,string.len("steam:")) == "steam:" then
				steamdata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("license:")) == "license:" then
				licensedata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("live:")) == "live:" then
				livedata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("xbl:")) == "xbl:" then
				xboxdata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("discord:")) == "discord:" then
				discorddata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("ip:")) == "ip:" then
				ipdata = tostring(licensehandler)
			end
		end			
		for i, permissionhandler in ipairs(tvhandlerperm.permissionsviaidentifiers) do
			if permissionhandler.permissiontype == "license" then
				if permissionhandler.permisisondata == licensedata then
					playerallowed = true
					break
				end
			end
			if permissionhandler.permissiontype == "steam" then
				if permissionhandler.permisisondata == steamdata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "xbox" then
				if permissionhandler.permisisondata == xboxdata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "live" then
				if permissionhandler.permisisondata == livedata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "discord" then
				if permissionhandler.permisisondata == discorddata then
					playerallowed = true
					break
				end
			end		
			if permissionhandler.permissiontype == "ip" then
				if permissionhandler.permisisondata == ipdata then
					playerallowed = true
					break
				end
			end							
		end
	end		
	return playerallowed
end

function GetPlayerPermissionsControl(playersource)
	if Config.EnableControlPermissions == false then
		return true
	else
		local playerallowed = false
		if Config.TelevisionControlSettings.acepermissionsforusecontrolmenu.enable == true then
			if IsPlayerAceAllowed(playersource, Config.TelevisionControlSettings.acepermissionsforusecontrolmenu.permission) then 
				playerallowed = true
			end
		end
		if Config.TelevisionControlSettings.jobpermissionsforusecontrolmenu.enable == true then
			if Config.Framework == "esx" then
				local xPlayer = ESX.GetPlayerFromId(playersource)
				if xPlayer then
					if xPlayer.job.name == Config.TelevisionControlSettings.jobpermissionsforusecontrolmenu.jobname then
						playerallowed = true
					end
				end
			elseif Config.Framework == "qbcore" then
				local xPlayer = QBCore.Functions.GetPlayer(playersource)
				if xPlayer then	
					if xPlayer.PlayerData.job.name == Config.TelevisionControlSettings.jobpermissionsforusecontrolmenu.jobname then
						playerallowed = true
					end
				end
			elseif Config.Framework == "standalone" then
				-- add here your job check function
			end
		end	
		if Config.TelevisionControlSettings.identifierspermissionsforcontrolmenu == true then
			local licensedata = "unknown"
			local steamdata = "unknown"
			local xboxdata = "unknown"
			local livedata = "unknown"
			local discorddata = "unknown"
			local ipdata = "unknown"
			for i, licensehandler in ipairs(GetPlayerIdentifiers(playersource)) do
				if string.sub(licensehandler, 1,string.len("steam:")) == "steam:" then
					steamdata = tostring(licensehandler)
				elseif string.sub(licensehandler, 1,string.len("license:")) == "license:" then
					licensedata = tostring(licensehandler)
				elseif string.sub(licensehandler, 1,string.len("live:")) == "live:" then
					livedata = tostring(licensehandler)
				elseif string.sub(licensehandler, 1,string.len("xbl:")) == "xbl:" then
					xboxdata = tostring(licensehandler)
				elseif string.sub(licensehandler, 1,string.len("discord:")) == "discord:" then
					discorddata = tostring(licensehandler)
				elseif string.sub(licensehandler, 1,string.len("ip:")) == "ip:" then
					ipdata = tostring(licensehandler)
				end
			end			
			for i, permissionhandler in ipairs(Config.TelevisionControlSettings.permissionsviaidentifiers) do
				if permissionhandler.permissiontype == "license" then
					if permissionhandler.permisisondata == licensedata then
						playerallowed = true
						break
					end
				end
				if permissionhandler.permissiontype == "steam" then
					if permissionhandler.permisisondata == steamdata then
						playerallowed = true
						break
					end
				end	
				if permissionhandler.permissiontype == "xbox" then
					if permissionhandler.permisisondata == xboxdata then
						playerallowed = true
						break
					end
				end	
				if permissionhandler.permissiontype == "live" then
					if permissionhandler.permisisondata == livedata then
						playerallowed = true
						break
					end
				end	
				if permissionhandler.permissiontype == "discord" then
					if permissionhandler.permisisondata == discorddata then
						playerallowed = true
						break
					end
				end		
				if permissionhandler.permissiontype == "ip" then
					if permissionhandler.permisisondata == ipdata then
						playerallowed = true
						break
					end
				end							
			end
		end		
		return playerallowed
	end
end

--[[ Examples for our exports, if you want control television via some other script.
RegisterCommand("starttelevision", function(source, args)
	StartTelevision(vector3(-54.25613, -1086.99, 26.95193), 1, 50, 0, true)
end)

RegisterCommand("startvideotelevision", function(source, args)
	local videourldata = tostring(args[1])
	PlayVideoOnTelevision(vector3(-54.25613, -1086.99, 26.95193), 0, videourldata)
end)

RegisterCommand("changevolumetelevision", function(source, args)
	local videovolumedata = tonumber(args[1])
	ChangeVolumeTelevision(vector3(-54.25613, -1086.99, 26.95193), videovolumedata, 0)
end)

RegisterCommand("stoptelevision", function(source, args)
	local videovolumedata = tonumber(args[1])
	StopTelevision(vector3(-54.25613, -1086.99, 26.95193), 0)
end)
]]--