local activeCooldown = false


CreateThread(function()
	if Config.Cloth == Cloth.WASABI then
		ApplyOutfit = function(data)
			local outfitData = GetOutfitByGender(data)
			local plyPed = PlayerPedId()

			if not outfitData then
				return
			end

			ClothingService.ApplyClothing(plyPed, outfitData)
		end

		RestoreCivilOutfit = function()
			if not Framework.object then
				return
			end

			if activeCooldown then
				return dbg.debug('Please wait few seconds, before restoring outfit again!')
			end

			activeCooldown = true

			SetTimeout(5 * 1000, function()
				activeCooldown = false
			end)

			dbg.debugClothing('Restoring outfit!')

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
end)
