RegisterCommand("removeallhottubs", function(source, args, raw)
	local playersource = source
	if playersource == 0 then
		for i, hottubhandler in ipairs(Config.HotTubs) do
			for i, hottubseat in ipairs(hottubhandler.seats) do
				if hottubseat.taken == true then
					TriggerClientEvent("rtx_hottub:SitEnd", hottubseat.takenplayerid)
				end
			end					
			MySQL.Async.execute('DELETE FROM hottubs WHERE id = @id', {
				['@id'] = hottubhandler.hottubid
			}, function(changed)
				TriggerClientEvent("rtx_hottub:HotTubDelete", -1, hottubhandler.hottubid)
				table.remove(Config.HotTubs, i)
				print("[RTX HOTTUB] "..Language[Config.Language]["removeallhottubs"].."")
			end)			
		end	
	else
		if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
			for i, hottubhandler in ipairs(Config.HotTubs) do
				for i, hottubseat in ipairs(hottubhandler.seats) do
					if hottubseat.taken == true then
						TriggerClientEvent("rtx_hottub:SitEnd", hottubseat.takenplayerid)
					end
				end							
				MySQL.Async.execute('DELETE FROM hottubs WHERE id = @id', {
					['@id'] = hottubhandler.hottubid
				}, function(changed)
					TriggerClientEvent("rtx_hottub:HotTubDelete", -1, hottubhandler.hottubid)
					table.remove(Config.HotTubs, i)
					TriggerClientEvent("rtx_hottub:Notify", playersource, Language[Config.Language]["removeallhottubs"])
				end)			
			end		
		end
	end
end)

RegisterCommand("removenearbyhottubs", function(source, args, raw)
	local playersource = source
	if playersource == 0 then
	else
		if args[1] ~= nil then
			if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
				local playerhandler = GetPlayerPed(playersource)
				local playercoords = GetEntityCoords(playerhandler)			
				for i, hottubhandler in ipairs(Config.HotTubs) do
					local distancehottub = #(playercoords - hottubhandler.coords)
					if distancehottub < tonumber(args[1]) then						
						for i, hottubseat in ipairs(hottubhandler.seats) do
							if hottubseat.taken == true then
								TriggerClientEvent("rtx_hottub:SitEnd", hottubseat.takenplayerid)
							end
						end							
						MySQL.Async.execute('DELETE FROM hottubs WHERE id = @id', {
							['@id'] = hottubhandler.hottubid
						}, function(changed)
							TriggerClientEvent("rtx_hottub:HotTubDelete", -1, hottubhandler.hottubid)
							table.remove(Config.HotTubs, i)
						end)		
					end
				end	
				TriggerClientEvent("rtx_hottub:Notify", playersource, Language[Config.Language]["removeallhottubsnearby"])
			end
		end
	end
end)