CreateThread(function()
    if Config.Cloth == Cloth.TGIANN then
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
            TriggerEvent("tgiann-clothing:changeScriptClothe", false)
		end
    end
end)

