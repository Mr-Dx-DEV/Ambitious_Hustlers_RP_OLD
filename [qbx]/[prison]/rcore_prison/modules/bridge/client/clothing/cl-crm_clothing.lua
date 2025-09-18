CreateThread(function()
    if Config.Cloth == Cloth.CRM then
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
            TriggerEvent("crm-appearance:load-player-skin")
		end
    end
end)

