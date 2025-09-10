-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
if not Config.UseRadialMenu then return end

function AddRadialItems()
	Wait(100) -- Don't remove this, for some reason it's needed during job changes
	if wsb.hasGroup(Config.policeJobs) then
		if wsb.isOnDuty() then
			exports.ox_lib:addRadialItem({
				{
					id = 'pd_general',
					label = 'Police',
					icon = 'shield-halved',
					menu = 'police_menu'
				},
			})
		end
	end
end

function RemoveRadialItems()
    exports.ox_lib:removeRadialItem('pd_general')
end

function DisableRadial(state)
	exports.ox_lib:disableRadial(state)
end

exports.ox_lib:registerRadial({ -- Police menu
	id = 'police_menu',
	items = {
		{
			label = 'Handcuff',
			icon = 'handcuffs',
			onSelect = function()
				TriggerEvent('wasabi_police:handcuffPlayer')
			end
		},
		{
			label = 'Escort',
			icon = 'people-pulling',
			onSelect = function()
				TriggerEvent('wasabi_police:escortPlayer')
			end
		},
		{
			label = 'Search',
			icon = 'search',
			onSelect = function()
				TriggerEvent('wasabi_police:searchPlayer')
			end
		},
		{
			label = 'Check ID',
			icon = 'id-card',
			onSelect = function()
				TriggerEvent('wasabi_police:checkId')
			end
		},
		{
			label = 'Vehicle',
			icon = 'car',
			menu = 'police_menu_vehicle'
		},
	}
})

exports.ox_lib:registerRadial({ -- Police vehicle menu
	id = 'police_menu_vehicle',
	items = {
		{
			label = 'Info',
			icon = 'circle-info',
			onSelect = function()
				TriggerEvent('wasabi_police:vehicleInfo')
			end
		},
		{
			label = 'Lockpick',
			icon = 'key',
			onSelect = function()
				TriggerEvent('wasabi_police:lockpickVehicle')
			end
		},
		{
			label = 'Impound',
			icon = 'trailer',
			onSelect = function()
				TriggerEvent('wasabi_police:impoundVehicle')
			end
		},
		{
			label = 'Seat',
			icon = 'door-closed',
			onSelect = function()
				TriggerEvent('wasabi_police:inVehiclePlayer')
			end
		},
		{
			label = 'Unseat',
			icon = 'door-open',
			onSelect = function()
				TriggerEvent('wasabi_police:outVehiclePlayer')
			end
		},
	}
})
