QBCore = exports["qb-core"]:GetCoreObject()

Webhook = ''

function MySQLexecute(query, values, func)
	return MySQL.query(query, values, func)
end

function removeMoney(xPlayer, account, value)
	xPlayer.Functions.RemoveMoney(account, value)
end

function addMoney(xPlayer, account, value)
	xPlayer.Functions.AddMoney(account, value)
end

function giveKeys(source, plate, model)
	TriggerClientEvent("vehiclekeys:client:SetOwner", source, plate)
end

function removeKeys(source, plate, model)
	-- Your event to remove keys
end

function onPlayerBuyVehicle(source, plate, price)
	-- Executed when someone buys a vehicle from a store
end

function canVehicleBeSold(source, plate)
	local canBeSold = true
	-- Executed when someone tries to sell a vehicle

	if not canBeSold then
		-- Add notification here
	end

	return canBeSold
end

function otherBankTransaction(source_name, source_identifier, target_name, target_identifier, vehicle_price, reason)
	-- Add your code for another banking script here
end

-------------------------- SELL VEHICLE WEBHOOK

function sellVehicleWebhook(data)
	local information = {
		{
			["color"] = Config.sellVehicleWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'VEHICLE SALE',
			["description"] = '**Vehicle: **'..data.model..'**\nPlate: **'..data.plate..'**\nBuyer name: **'..data.target_name..'**\nSeller name: **'..data.source_name..'**\nPrice: **'..data.vehicle_price..'€',

			["footer"] = {
				["text"] = os.date(Config.WebhookDateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end