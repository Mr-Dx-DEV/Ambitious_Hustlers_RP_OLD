local restoreOutfit = false

CreateThread(function()
    if Config.Cloth == Cloth.QB then
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

            restoreOutfit = true

            SetTimeout(5 * 1000, function()
				restoreOutfit = false
			end)

            if doesExportExistInResource(Cloth.QB, "reloadSkin") then
                exports[Cloth.QB]:reloadSkin()
            else
                TriggerServerEvent("qb-clothes:loadPlayerSkin")
                TriggerServerEvent("qb-clothing:loadPlayerSkin")
            end

            dbg.debugClothing('Restoring outfit!')
		end
    end
end)

