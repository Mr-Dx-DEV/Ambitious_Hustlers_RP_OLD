local restoreOutfit = false

CreateThread(function()
	if Config.Cloth == Cloth.MOV then
		RegisterNetEvent("qb-clothes:loadSkin", function(state, model, skin)
			if not restoreOutfit then
				return
			end

			if type(state) == "boolean" and state or restoreOutfit then
				dbg.debugClothing("Outfit restored success!")
			else
				dbg.critical("Failed to restore player skin via qb-clothing, not saved outfit in database!")
			end
		end)

		ApplyOutfit = function(data)
			local outfitData = GetOutfitByGender(data)
			local plyPed = PlayerPedId()

			if not outfitData then
				return
			end

			ClothingService.ApplyClothing(plyPed, outfitData)
		end

		RestoreCivilOutfit = function()
			if restoreOutfit then
				return
			end

			dbg.debugClothing('Restoring outfit!')

			restoreOutfit = true

			SetTimeout(5 * 1000, function()
				restoreOutfit = false
			end)

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
			end
		end
	end
end)
