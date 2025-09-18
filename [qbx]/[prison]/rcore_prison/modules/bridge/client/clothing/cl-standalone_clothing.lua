local activeCooldown = false
local ClothingSetter = {}

CreateThread(function()
	if Config.Cloth == Cloth.NONE then
		ApplyOutfit = function(data)
			local outfitData = GetOutfitByGender(data)
			local plyPed = PlayerPedId()

			if not outfitData then
				return
			end

			ClothingService.ApplyClothing(plyPed, outfitData)

			-- This function get outfit by player ped model
			-- These 2 functions from ClothingService.ConvertClothingComponents are converting our custom clothing structure to qb-clothing/skinchanger.
			-- You can use these to convert our outfit to the qb-clothing/skinchanger and hook with your clothing resource.

			-- ClothingService.ConvertClothingComponents(Clothing.QB, outfitData)
			-- ClothingService.ConvertClothingComponents(Clothing.SKINCHANGER, outfitData)
		end

		RestoreCivilOutfit = function()
			if activeCooldown then
				return dbg.debug('Please wait few seconds, before restoring outfit again!')
			end

			activeCooldown = true

			SetTimeout(5 * 1000, function()
				activeCooldown = false
			end)

			dbg.debugClothing('Restoring outfit as fallback!')

			local plyPed = PlayerPedId()

			if isResourceLoaded('qs-appearance') then
				ExecuteCommand('reloadskin')
				return
			end

			if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
				TriggerServerEvent("qb-clothes:loadPlayerSkin")
				TriggerServerEvent("qb-clothing:loadPlayerSkin")
			elseif Config.Framework == Framework.ESX then
				if not Framework.object then
					return
				end

				if Framework.object.IsPlayerLoaded then
					if not Framework.object.IsPlayerLoaded() then
						return
					end
				end

				if Framework.object.PlayerLoaded then
					if not Framework.object.PlayerLoaded then
						return
					end
				end

				Framework.object.TriggerServerCallback(Config.FrameworkEvents['esx_skin:getPlayerSkin'], function(skin)
					repeat
						Wait(1000)
					until skin ~= nil

					TriggerEvent(Config.FrameworkEvents['skinchanger:loadSkin'], skin)
				end)
			elseif Config.Framework == Framework.NONE then
				ClothingService.ResetClothing(plyPed)
			end
		end
	end
end)


if not Config.ClothingStandaloneTesting then
	RegisterCommand('prison_ped', function()
		local ped = PlayerPedId()
		local outfitData = GetOutfitByGender(Outfits)

		if outfitData then
			ClothingService.ApplyClothing(ped, outfitData)
		end
	end)

	RegisterCommand('default_ped', function()
		local ped = PlayerPedId()
		ClothingService.ResetClothing(ped)
	end)
end
