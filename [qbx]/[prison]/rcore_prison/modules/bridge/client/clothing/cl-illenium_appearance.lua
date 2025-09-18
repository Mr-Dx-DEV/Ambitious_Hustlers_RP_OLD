local activeCooldown = false

CreateThread(function()
    if Config.Cloth == Cloth.IAPPEARANCE or isResourceLoaded('qs-appearance') then
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

            if Config.Framework == Framework.ESX then
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

                Framework.object.TriggerServerCallback(Config.FrameworkEvents['esx_skin:getPlayerSkin'], function(apperance, skin)
                    repeat
                        Wait(1000)
                    until apperance ~= nil

                    TriggerEvent(Config.FrameworkEvents['skinchanger:loadSkin'], apperance)
                end)
            elseif Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
				TriggerServerEvent("qb-clothes:loadPlayerSkin")
				TriggerServerEvent("qb-clothing:loadPlayerSkin")
				ExecuteCommand('reloadskin')
            end
		end
    end
end)
