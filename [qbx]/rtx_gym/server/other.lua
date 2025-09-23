local statslist = {
	["strength"] = "strenght",
	["condition"] = "condition",	
	["swimming"] = "swimming",	
	["hygiene"] = "hygiene",	
	["energy"] = "energy",		
}

function UpdateStats(playersource, needdataname, needdatanumber)
	if Config.DifferentStatsSystem == false then
		playerneeds[playersource][tostring(needdataname)] = needdatanumber
		TriggerClientEvent("rtx_gym:UpdateStats", playersource, tostring(needdataname), needdatanumber)
		if Config.SaveWhenStatsAreUpdated == true then
			SavePlayer(playersource)
		end
	else
		-- add here your set function for stats (needdataname = name of skill, needdatanumber = new data)
	end
end		

function AddStats(playersource, statnamedata, needdatanumber)
	if Config.DifferentStatsSystem == false then
		local statnamedatacalculate = playerneeds[playersource][tostring(statnamedata)]+needdatanumber
		if statnamedatacalculate > 100 then
			playerneeds[playersource][tostring(statnamedata)] = 100
			TriggerClientEvent("rtx_gym:UpdateStats", playersource, tostring(statnamedata), 100)
			if Config.SaveWhenStatsAreUpdated == true then
				SavePlayer(playersource)
			end		
		else
			playerneeds[playersource][tostring(statnamedata)] = playerneeds[playersource][tostring(statnamedata)]+needdatanumber
			TriggerClientEvent("rtx_gym:UpdateStats", playersource, tostring(statnamedata), playerneeds[playersource][tostring(statnamedata)])
			if Config.SaveWhenStatsAreUpdated == true then
				SavePlayer(playersource)
			end		
		end
		if Config.ReducingStatsWhenNotExercising == true then
			TriggerClientEvent("rtx_gym:ResetTimer", playersource, tostring(statnamedata))
		end		
	else
		-- add here your add function for stats (needdataname = name of skill, needdatanumber = new data)
	end
end		

function RemoveStats(playersource, statnamedata, needdatanumber)
	if Config.DifferentStatsSystem == false then	
		local statnamedatacalculate = playerneeds[playersource][tostring(statnamedata)]-needdatanumber
		if statnamedatacalculate < 0 then
			playerneeds[playersource][tostring(statnamedata)] = 0
			TriggerClientEvent("rtx_gym:UpdateStats", playersource, tostring(statnamedata), 0)
			if Config.SaveWhenStatsAreUpdated == true then
				SavePlayer(playersource)
			end		
		else
			playerneeds[playersource][tostring(statnamedata)] = playerneeds[playersource][tostring(statnamedata)]-needdatanumber
			TriggerClientEvent("rtx_gym:UpdateStats", playersource, tostring(statnamedata), playerneeds[playersource][tostring(statnamedata)])
			if Config.SaveWhenStatsAreUpdated == true then
				SavePlayer(playersource)
			end		
		end
	else
		-- add here your remove function for stats (needdataname = name of skill, needdatanumber = new data)
	end	
end		

function GetStats(playersource, statnamedata)
	if Config.DifferentStatsSystem == false then	
		return playerneeds[playersource][tostring(statnamedata)]
	else
		return 0
	end	
end	

function GetAllStats(playersource)
	if Config.DifferentStatsSystem == false then	
		return playerneeds[playersource]
	else
		return {}
	end	
end	

function RemoveStress(playersource, stressdata)
	-- add here your stress function for yoga
end	

RegisterServerEvent("rtx_gym:UpdateEnergy")
AddEventHandler("rtx_gym:UpdateEnergy", function()
	local playersource = source															
	if playerneeds[playersource] == nil or gymonetimedata[playersource] == nil or gympassdata[playersource] == nil or playersupplements[playersource] == nil then
		PlayerDataReformated(playersource)
	end		
	AddStats(playersource, "energy", 2.5)																
end)

function AddMoneyRTX(playersource, moneydata)
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			xPlayer.addMoney(moneydata)
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			xPlayer.Functions.AddMoney('cash', moneydata)
		end
	elseif Config.Framework == "standalone" then
		-- add here money add funciton	
	end
end	

function RemoveMoneyRTX(playersource, moneydata)
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			xPlayer.removeMoney(moneydata)
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			xPlayer.Functions.RemoveMoney('cash', moneydata)	
		end
	elseif Config.Framework == "standalone" then
		-- add here money remove funciton	
	end
end	

function GetMoneyRTX(playersource)
	local moneydata = 0
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			moneydata = xPlayer.getMoney()
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			moneydata = xPlayer.Functions.GetMoney('cash')
		end
	elseif Config.Framework == "standalone" then
		moneydata = 99999999999
		-- add here money get funciton	
	end
	return moneydata
end	

function GetPlayerIdentifierData(playersource)
	local licensedata = "unknown"
	for i, licensehandler in ipairs(GetPlayerIdentifiers(playersource)) do
		if string.sub(licensehandler, 1,string.len("license:")) == "license:" then
			licensedata = tostring(licensehandler)
		end
	end	
	return licensedata
end

function GetPlayerIdentifierRTX(playersource)
	local playeridentifierdata = ""
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			playeridentifierdata = xPlayer.identifier
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			playeridentifierdata = xPlayer.PlayerData.citizenid
		end
	elseif Config.Framework == "standalone" then
		playeridentifierdata = GetPlayerIdentifierData(playersource)	
	end
	return playeridentifierdata
end

if Config.Framework == "esx" then
	ESX.RegisterUsableItem("protein", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["protein"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].protein = supplementimereformatedcalculate
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "protein")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookprotein"])
			xPlayer.removeInventoryItem("protein", 1)	
		end
	end)

	ESX.RegisterUsableItem("creatine", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["creatine"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].creatine = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "creatine")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookcreatine"])	
			xPlayer.removeInventoryItem("creatine", 1)	
		end
	end)

	ESX.RegisterUsableItem("preworkout", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["preworkout"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].preworkout = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "preworkout")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookpreworkout"])	
			xPlayer.removeInventoryItem("preworkout", 1)	
		end
	end)

	ESX.RegisterUsableItem("testosterone", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["testosterone"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].testosterone = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "testosterone")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtooktestosterone"])	
			xPlayer.removeInventoryItem("testosterone", 1)	
		end
	end)
	
	RegisterCommand("addgymstats", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					if args[2] ~= nil and statslist[tostring(args[2])] then
						local statsreformated = statslist[tostring(args[2])]
						if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
							AddStats(reformatedplayerid, statsreformated, tonumber(args[3]))
							print(LanguageFile("statsaddplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
						else
							print(Language[Config.Language]["statsnumberdata"])
						end
					else
						print(Language[Config.Language]["statsdefine"])
					end
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then
				if args[1] ~= nil then
					local reformatedplayerid = tonumber(args[1])
					if playerneeds[reformatedplayerid] ~= nil then
						print(args[2])
						if args[2] ~= nil and statslist[tostring(args[2])] then
							local statsreformated = statslist[tostring(args[2])]
							if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
								AddStats(reformatedplayerid, statsreformated, tonumber(args[3]))
								TriggerClientEvent("rtx_gym:Notify", playersource, LanguageFile("statsaddplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
							else
								TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["statsnumberdata"])
							end
						else
							TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["statsdefine"])
						end
					else
						TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["playeroffline"])
					end
				else
					TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["idplayer"])
				end
			end
		end
	end)	
	
	RegisterCommand("removegymstats", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					if args[2] ~= nil and statslist[tostring(args[2])] then
						local statsreformated = statslist[tostring(args[2])]
						if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
							RemoveStats(reformatedplayerid, statsreformated, tonumber(args[3]))
							print(LanguageFile("statsremoveplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
						else
							print(Language[Config.Language]["statsnumberdata"])
						end
					else
						print(Language[Config.Language]["statsdefine"])
					end
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then
				if args[1] ~= nil then
					local reformatedplayerid = tonumber(args[1])
					if playerneeds[reformatedplayerid] ~= nil then
						if args[2] ~= nil and statslist[tostring(args[2])] then
							local statsreformated = statslist[tostring(args[2])]
							if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
								RemoveStats(reformatedplayerid, statsreformated, tonumber(args[3]))
								TriggerClientEvent("rtx_gym:Notify", playersource, LanguageFile("statsremoveplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
							else
								TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["statsnumberdata"])
							end
						else
							TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["statsdefine"])
						end
					else
						TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["playeroffline"])
					end
				else
					TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["idplayer"])
				end
			end
		end
	end)	
	
	RegisterCommand("statsgymclear", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					playerneeds[reformatedplayerid] = {	
						["strenght"] = 0.0,	
						["condition"] = 0.0,	
						["swimming"] = 0.0,	
						["hygiene"] = 100.0,	
						["energy"] = 100.0,	
					}			
					TriggerClientEvent("rtx_gym:SynchronizeStats", reformatedplayerid, playerneeds[reformatedplayerid])
					print(LanguageFile("statsreset", reformatedplayerid))
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then
				if args[1] ~= nil then
					local reformatedplayerid = tonumber(args[1])
					if playerneeds[reformatedplayerid] ~= nil then
						playerneeds[reformatedplayerid] = {	
							["strenght"] = 0.0,	
							["condition"] = 0.0,	
							["swimming"] = 0.0,	
							["hygiene"] = 100.0,	
							["energy"] = 100.0,	
						}			
						TriggerClientEvent("rtx_gym:SynchronizeStats", reformatedplayerid, playerneeds[reformatedplayerid])
						TriggerClientEvent("rtx_gym:Notify", playersource, LanguageFile("statsreset", reformatedplayerid))
					else
						TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["playeroffline"])
					end
				else
					TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["idplayer"])
				end
			end
		end
	end)		
	
end

if Config.Framework == "qbcore" then
	QBCore.Functions.CreateUseableItem("protein", function(source, item)
		local playersource = source
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["protein"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].protein = supplementimereformatedcalculate
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "protein")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookprotein"])
			xPlayer.Functions.RemoveItem("protein", 1)	
		end
	end)

	QBCore.Functions.CreateUseableItem("creatine", function(source, item)
		local playersource = source
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["creatine"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].creatine = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "creatine")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookcreatine"])	
			xPlayer.Functions.RemoveItem("creatine", 1)	
		end
	end)

	QBCore.Functions.CreateUseableItem("preworkout", function(source, item)
		local playersource = source
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["preworkout"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].preworkout = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "preworkout")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookpreworkout"])	
			xPlayer.Functions.RemoveItem("preworkout", 1)	
		end
	end)

	QBCore.Functions.CreateUseableItem("testosterone", function(source, item)
		local playersource = source
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["testosterone"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].testosterone = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "testosterone")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtooktestosterone"])	
			xPlayer.Functions.RemoveItem("testosterone", 1)
		end
	end)
	
	RegisterCommand("addgymstats", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					if args[2] ~= nil and statslist[tostring(args[2])] then
						local statsreformated = statslist[tostring(args[2])]
						if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
							AddStats(reformatedplayerid, statsreformated, tonumber(args[3]))
							print(LanguageFile("statsaddplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
						else
							print(Language[Config.Language]["statsnumberdata"])
						end
					else
						print(Language[Config.Language]["statsdefine"])
					end
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
			if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
				if args[1] ~= nil then
					local reformatedplayerid = tonumber(args[1])
					if playerneeds[reformatedplayerid] ~= nil then
						if args[2] ~= nil and statslist[tostring(args[2])] then
							local statsreformated = statslist[tostring(args[2])]
							if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
								AddStats(reformatedplayerid, statsreformated, tonumber(args[3]))
								TriggerClientEvent("rtx_gym:Notify", playersource, LanguageFile("statsaddplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
							else
								TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["statsnumberdata"])
							end
						else
							TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["statsdefine"])
						end
					else
						TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["playeroffline"])
					end
				else
					TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["idplayer"])
				end
			end
		end
	end)	
	
	RegisterCommand("removegymstats", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					if args[2] ~= nil and statslist[tostring(args[2])] then
						local statsreformated = statslist[tostring(args[2])]
						if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
							RemoveStats(reformatedplayerid, statsreformated, tonumber(args[3]))
							print(LanguageFile("statsremoveplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
						else
							print(Language[Config.Language]["statsnumberdata"])
						end
					else
						print(Language[Config.Language]["statsdefine"])
					end
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
			if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
				if args[1] ~= nil then
					local reformatedplayerid = tonumber(args[1])
					if playerneeds[reformatedplayerid] ~= nil then
						if args[2] ~= nil and statslist[tostring(args[2])] then
							local statsreformated = statslist[tostring(args[2])]
							if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
								RemoveStats(reformatedplayerid, statsreformated, tonumber(args[3]))
								TriggerClientEvent("rtx_gym:Notify", playersource, LanguageFile("statsremoveplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
							else
								TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["statsnumberdata"])
							end
						else
							TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["statsdefine"])
						end
					else
						TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["playeroffline"])
					end
				else
					TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["idplayer"])
				end
			end
		end
	end)	
	
	RegisterCommand("statsgymclear", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					playerneeds[reformatedplayerid] = {	
						["strenght"] = 0.0,	
						["condition"] = 0.0,	
						["swimming"] = 0.0,	
						["hygiene"] = 100.0,	
						["energy"] = 100.0,	
					}			
					TriggerClientEvent("rtx_gym:SynchronizeStats", reformatedplayerid, playerneeds[reformatedplayerid])
					print(LanguageFile("statsreset", reformatedplayerid))
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
			if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
				if args[1] ~= nil then
					local reformatedplayerid = tonumber(args[1])
					if playerneeds[reformatedplayerid] ~= nil then
						playerneeds[reformatedplayerid] = {	
							["strenght"] = 0.0,	
							["condition"] = 0.0,	
							["swimming"] = 0.0,	
							["hygiene"] = 100.0,	
							["energy"] = 100.0,	
						}			
						TriggerClientEvent("rtx_gym:SynchronizeStats", reformatedplayerid, playerneeds[reformatedplayerid])
						TriggerClientEvent("rtx_gym:Notify", playersource, LanguageFile("statsreset", reformatedplayerid))
					else
						TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["playeroffline"])
					end
				else
					TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["idplayer"])
				end
			end
		end
	end)		
end

if Config.Framework == "standalone" then
	--[[ 

	-- you need edit this usable for your framework (this is example from esx) (You can create ticket on our discord and we can help you with that)	
	ESX.RegisterUsableItem("protein", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["protein"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].protein = supplementimereformatedcalculate
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "protein")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookprotein"])
			xPlayer.removeInventoryItem("protein", 1)	
		end
	end)

	ESX.RegisterUsableItem("creatine", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["creatine"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].creatine = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "creatine")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookcreatine"])	
			xPlayer.removeInventoryItem("creatine", 1)	
		end
	end)

	ESX.RegisterUsableItem("preworkout", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["preworkout"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].preworkout = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "preworkout")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtookpreworkout"])	
			xPlayer.removeInventoryItem("preworkout", 1)	
		end
	end)

	ESX.RegisterUsableItem("testosterone", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then		
			local supplementtimereformated = 60 * Config.Supplements["testosterone"].duration
			local supplementimereformatedcalculate = os.time() + supplementtimereformated
			playersupplements[playersource].testosterone = supplementimereformatedcalculate	
			TriggerClientEvent("rtx_gym:SupplementAnim", playersource, "testosterone")
			TriggerClientEvent("rtx_gym:Notify", playersource, Language[Config.Language]["youtooktestosterone"])	
			xPlayer.removeInventoryItem("testosterone", 1)	
		end
	end)
	]]--
	
	RegisterCommand("addgymstats", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					if args[2] ~= nil and statslist[tostring(args[2])] then
						local statsreformated = statslist[tostring(args[2])]
						if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
							AddStats(reformatedplayerid, statsreformated, tonumber(args[3]))
							print(LanguageFile("statsaddplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
						else
							print(Language[Config.Language]["statsnumberdata"])
						end
					else
						print(Language[Config.Language]["statsdefine"])
					end
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else

		end
	end)	
	
	RegisterCommand("removegymstats", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					if args[2] ~= nil and statslist[tostring(args[2])] then
						local statsreformated = statslist[tostring(args[2])]
						if args[3] ~= nil and tonumber(args[3]) >= 0 and tonumber(args[3]) <= 100 then
							RemoveStats(reformatedplayerid, statsreformated, tonumber(args[3]))
							print(LanguageFile("statsremoveplayer", statsreformated, Language[Config.Language][tostring(statsreformated)], tonumber(args[3])))
						else
							print(Language[Config.Language]["statsnumberdata"])
						end
					else
						print(Language[Config.Language]["statsdefine"])
					end
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
		end
	end)	
	
	RegisterCommand("statsgymclear", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				local reformatedplayerid = tonumber(args[1])
				if playerneeds[reformatedplayerid] ~= nil then
					playerneeds[reformatedplayerid] = {	
						["strenght"] = 0.0,	
						["condition"] = 0.0,	
						["swimming"] = 0.0,	
						["hygiene"] = 100.0,	
						["energy"] = 100.0,	
					}			
					TriggerClientEvent("rtx_gym:SynchronizeStats", reformatedplayerid, playerneeds[reformatedplayerid])
					print(LanguageFile("statsreset", reformatedplayerid))
				else
					print(Language[Config.Language]["playeroffline"])
				end
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else

		end
	end)		
end