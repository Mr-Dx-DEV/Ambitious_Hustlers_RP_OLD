local activeCooldown = false

CreateThread(function()
	if Config.Cloth == Cloth.BL_APPEARANCE then
		ApplyOutfit = function(data)
			local outfitData = GetOutfitByGender(data)
			local plyPed = PlayerPedId()

			if not outfitData then
				return
			end

			ClothingService.ApplyClothing(plyPed, outfitData)
		end

		RestoreCivilOutfit = function()
			if activeCooldown then
				return dbg.debug('Please wait few seconds, before restoring outfit again!')
			end

			activeCooldown = true
 
			SetTimeout(5 * 1000, function()
				activeCooldown = false
			end)

			local outfit = exports.bl_appearance:GetPlayerPedAppearance()

			if outfit and next(outfit) then
				exports.bl_appearance:SetPlayerPedAppearance(outfit)
			end
		end
	end
end)
