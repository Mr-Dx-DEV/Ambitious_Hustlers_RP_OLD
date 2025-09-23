--[[

	you can add here functions/bonuses for stats

	Stats: 

	strenght
	condition		
	swimming
	hygiene
	energy

	you can get data from stats via this function playerneeds[statname] for example playerneeds["strenght"]


]]--

local minimumstamina = 100.0

local minimumtimeunderwater = 25.0

local minimumwaterdata = 25.0

latestexercises = {condition = GetGameTimer()+(Config.ReduceStatsTime.condition.decreasetime*60000), strenght = GetGameTimer()+(Config.ReduceStatsTime.strenght.decreasetime*60000), water = GetGameTimer()+(Config.ReduceStatsTime.water.decreasetime*60000)}

if Config.DifferentStatsSystem == false then
	Citizen.CreateThread(function()
		while true do 
			Citizen.Wait(2000)
			if playerloaded == true then
				local playerhandler = PlayerPedId()
				local maxstaminadata = minimumstamina+playerneeds["condition"]
				local maxtimeunderwaterdata = minimumtimeunderwater+playerneeds["swimming"]
				if not minimumwaterdata == maxtimeunderwaterdata then
					minimumwaterdata = minimumtimeunderwater+playerneeds["swimming"]
					SetPedMaxTimeUnderwater(playerhandler, minimumtimeunderwater+playerneeds["swimming"])
				end
				if not GetPlayerMaxStamina(PlayerId()) == maxstaminadata then
					SetPlayerMaxStamina(PlayerId(), maxstaminadata)
				end
				if IsPedSprinting(playerhandler) then
					if playerneeds["condition"] > 95.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)	
					elseif playerneeds["condition"] > 90.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.45)	
					elseif playerneeds["condition"] > 80.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.40)
					elseif playerneeds["condition"] > 70.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.35)		
					elseif playerneeds["condition"] > 60.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.30)	
					elseif playerneeds["condition"] > 50.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.25)	
					elseif playerneeds["condition"] > 40.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.20)			
					elseif playerneeds["condition"] > 30.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.15)
					elseif playerneeds["condition"] > 15.0 then
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.10)
					end
				else
					SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
				end
				if playerneeds["strenght"] > 95.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 1.50) 	
				elseif playerneeds["strenght"] > 90.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 1.25) 
				elseif playerneeds["strenght"] > 80.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 1.0) 
				elseif playerneeds["strenght"] > 70.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 0.75) 	
				elseif playerneeds["strenght"] > 60.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 0.50) 
				elseif playerneeds["strenght"] > 50.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 0.4) 	
				elseif playerneeds["strenght"] > 40.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 0.3) 		
				elseif playerneeds["strenght"] > 30.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 0.2) 
				elseif playerneeds["strenght"] > 15.0 then
					SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 0.1) 
				end	
			end
		end
	end)
	
	if Config.ReducingStatsWhenNotExercising == true then
		Citizen.CreateThread(function()
			while true do 
				Citizen.Wait(5000)
				if playerloaded == true then
					if Config.ReducingStatsWhenNotExercising == true then
						local timerightnow = GetGameTimer()
						if playerneeds["strenght"] > 0.0 then
							if latestexercises.strenght > timerightnow then
							else
								latestexercises.strenght = GetGameTimer()+(Config.ReduceStatsTime.strenght.decreasetime*60000)
								TriggerServerEvent("rtx_gym:GymNoExercise", "strenght")
							end
						end
						if playerneeds["condition"] > 0.0 then
							if latestexercises.condition > timerightnow then
							else
								latestexercises.condition = GetGameTimer()+(Config.ReduceStatsTime.condition.decreasetime*60000)
								TriggerServerEvent("rtx_gym:GymNoExercise", "condition")
							end
						end
						if playerneeds["swimming"] > 95.0 then
							if latestexercises.water > timerightnow then
							else
								latestexercises.water = GetGameTimer()+(Config.ReduceStatsTime.water.decreasetime*60000)
								TriggerServerEvent("rtx_gym:GymNoExercise", "water")
							end	
						end
					end
				end
			end
		end)
	end
end

function CheckPlayerStatus()
	local status = false
	local playerhandler = PlayerPedId()
    if IsEntityDead(playerhandler) then
        status = true
    end	
	return status
end