CreateThread(function()
	if Config.Cloth == Cloth.ONEX then
		ApplyOutfit = function(data)
			local outfitData = GetOutfitByGender(data)
			local plyPed = PlayerPedId()

			if not outfitData then
				return
			end

			ClothingService.ApplyClothing(plyPed, outfitData)
		end

		RestoreCivilOutfit = function()
			dbg.debugClothing('Restoring outfit!')
			TriggerEvent('onex-creation:syncClothes', false)
		end
	end
end)
