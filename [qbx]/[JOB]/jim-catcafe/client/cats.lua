local Cats, Targets = {}, {}

onPlayerLoaded(function()
	Wait(2000)
    -- Constants
    local routeCoords = {
        vec4(-573.59, -1051.73, 22.34, 312.5),
        vec4(-576.5, -1053.52, 22.34, 123.7),
        vec4(-579.85, -1057.09, 22.34, 194.87),
        vec4(-581.38, -1053.72, 22.35, 38.59),
        vec4(-582.61, -1051.24, 22.34, 46.58),
        vec4(-585.93, -1053.67, 22.35, 107.41),
        vec4(-585.93, -1053.67, 22.35, 107.41),
        vec4(-585.93, -1053.67, 22.35, 107.41),
        vec4(-576.48, -1064.01, 22.34, 175.03),
        vec4(-578.47, -1067.17, 22.34, 119.52),
        vec4(-582.69, -1067.03, 22.34, 81.25),
        vec4(-582.69, -1067.03, 22.34, 81.25),
        vec4(-582.4, -1062.29, 22.35, 343.69),
        vec4(-580.1, -1058.88, 22.34, 295.82)
    }

    -- Helper function to set up cat movement
    local function setupCatRoute(cat)
        CreateThread(function()
            local route = math.random(1, #routeCoords)
            while true do
                -- Randomly increment or decrement route index
                route = route + (math.random(1, 2) == 1 and 1 or -1)
                -- Loop around if out of bounds
                if route > #routeCoords then
                    route = 1
                elseif route < 1 then
                    route = #routeCoords
                end
                Wait(math.random(1000, 2000))
                local dest = routeCoords[route].xyz
                TaskGoStraightToCoord(cat, dest, 0.1, -1, 0, 0)
                -- Wait until the cat reaches the destination
                while #(GetEntityCoords(cat) - dest) > 1.0 do
                    Wait(500)
                end
                Wait(math.random(1000, 2000))
            end
        end)
    end

    for k, v in pairs(CatList) do
        local catCoords = vec4(v.coords.x, v.coords.y, v.coords.z + 0.03, v.coords.w)
        local currentCat = makePed("a_c_cat_01", catCoords, 0, nil, nil, false)
        Cats[#Cats + 1] = currentCat

        -- Create interaction target for the cat
        Targets["CatPat"..k] = createEntityTarget(currentCat, {
            {
                action = function()
                    TriggerEvent(getScript()..":CatPat", { cat = currentCat, coords = v.coords })
                end,
                icon = "fas fa-cat",
                label = locale("targetinfo", "pet"),
            }
        }, 2.5)

        SetBlockingOfNonTemporaryEvents(currentCat, true)
        SetEntityInvincible(currentCat, true)
        SetEntityNoCollisionEntity(currentCat, PlayerPedId(), false)

        if v.frozen then
            FreezeEntityPosition(currentCat, true)
        else
            setupCatRoute(currentCat)
        end

        if v.animDict and v.animName then
            loadAnimDict(v.animDict)
            TaskPlayAnim(currentCat, v.animDict, v.animName, 8.0, 0, -1, 1, 0, 0, 0)
        end
    end
end, true)


local petting = false
RegisterNetEvent(getScript()..":CatPat", function(data)
	if not petting then petting = true else return end
	local Cat = data.cat
	local pid = PlayerPedId()
	ppCoords = GetEntityCoords(Cat)
	if IsEntityPlayingAnim(Cat, "creatures@cat@amb@world_cat_sleeping_ground@base", "base", 3) then
		TaskTurnPedToFaceEntity(pid, Cat, 1200)
		Wait(1300)
		if ppCoords.z < GetEntityCoords(pid).z then TaskStartScenarioInPlace(pid, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
		else
			playAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", -1, 16, pid)
		end
		FreezeEntityPosition(pid, true)
		Wait(1000)
		playAnim("creatures@cat@amb@world_cat_sleeping_ground@exit", "exit", -1, 8, Cat)
		Wait(4000)
		RemoveAnimDict("creatures@cat@amb@world_cat_sleeping_ground@exit")
		FreezeEntityPosition(Cat, false)
		TaskTurnPedToFaceEntity(Cat, pid, 1000)
		Wait(1000)
		FreezeEntityPosition(Cat, true)
		Wait(1500)
		if math.random(1,2) == 2 then
			playAnim("creatures@cat@player_action@", "action_a", -1, 8, Cat)
		end
		Wait(4000)
		FreezeEntityPosition(pid, false)
		TriggerServerEvent('hud:server:RelieveStress', Config.Cats.RelieveStress)
		SetEntityHealth(pid, GetEntityHealth(pid) + Config.Cats.PatHeal)
		if ppCoords.z < GetEntityCoords(pid).z then
			TaskStartScenarioInPlace(pid, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
			Wait(2800)
			ClearPedTasksImmediately(pid)
		else
			ClearPedTasks(pid)
		end
		Wait(3000)
		playAnim("creatures@cat@amb@world_cat_sleeping_ground@enter", "enter", -1, 1, Cat)
		Wait(2500)
		playAnim("creatures@cat@amb@world_cat_sleeping_ground@base", "base", -1, 1, Cat)
		SetEntityCoords(Cat, data.coords.x, data.coords.y, data.coords.z - 1.03, 0, 0, 0, true)
	elseif IsEntityPlayingAnim(data.cat, "creatures@cat@amb@world_cat_sleeping_ledge@base", "base", 3) then
		TaskTurnPedToFaceEntity(pid, Cat, 1200)
		Wait(1200)
		playAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", -1, 16, pid)
		FreezeEntityPosition(pid, true)
		Wait(11500)
		FreezeEntityPosition(pid, false)
		TriggerServerEvent('hud:server:RelieveStress', Config.Cats.RelieveStress)
		SetEntityHealth(pid, GetEntityHealth(pid) + Config.Cats.PatHeal)
		StopAnimTask(pid, "machinic_loop_mechandplayer", "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", 0)
		ClearPedTasksImmediately(pid)
		Wait(3000)
	elseif IsEntityPlayingAnim(data.cat, "creatures@cat@move", "gallop", 3) then
		TaskTurnPedToFaceEntity(pid, Cat, 1200)
		Wait(1300)
		TaskStartScenarioInPlace(pid, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
		FreezeEntityPosition(pid, true)
		Wait(10000)
		FreezeEntityPosition(pid, false)
		TriggerServerEvent('hud:server:RelieveStress', Config.Cats.RelieveStress)
		SetEntityHealth(pid, GetEntityHealth(pid) + Config.Cats.PatHeal)
		TaskStartScenarioInPlace(pid, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
		Wait(2800)
		ClearPedTasksImmediately(pid)
	else
		ClearPedTasksImmediately(Cat)
		ClearPedSecondaryTask(Cat)
		TaskTurnPedToFaceEntity(pid, Cat, 1200)
		Wait(1300)
		TaskStartScenarioInPlace(pid, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
		FreezeEntityPosition(pid, true)
		FreezeEntityPosition(Cat, false)
		TaskTurnPedToFaceEntity(Cat, pid, 1000)
		Wait(1000)
		if math.random(1,2) == 2 then
			playAnim("creatures@cat@player_action@", "action_a", -1, 8, Cat)
		end
		Wait(4000)
		FreezeEntityPosition(pid, false)
		TriggerServerEvent('hud:server:RelieveStress', Config.Cats.RelieveStress)
		SetEntityHealth(pid, GetEntityHealth(pid) + Config.Cats.PatHeal)
		TaskStartScenarioInPlace(pid, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
		Wait(2800)
		ClearPedTasksImmediately(pid)
	end
	petting = false
end)

-----------------------------------------------------------------
CatList = {
	--If Clickable = true this will add a third eye location based on their original coords
	--If frozen = true, the cats will be frozen in place

	{ coords = vec4(-577.14, -1069.22, 22.99, 0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vec4(-586.85, -1064.68, 23.35, 0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vec4(-576.49, -1054.94, 22.42, 350.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vec4(-582.07, -1055.92, 22.43, 250.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vec4(-583.32, -1069.32, 22.99, 90.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vec4(-584.33, -1062.76, 23.40, 223.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true, },
	{ coords = vec4(-575.53, -1049.41, 23.53, 90.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true, },
	{ coords = vec4(-584.71, -1054.55, 23.33, 280.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },

	{ coords = vec4(-576.78, -1057.52, 25.15, 0.0), animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", clickable = false, frozen = true },
	{ coords = vec4(-583.55, -1048.88, 25.50, 240.0), animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", clickable = false, frozen = true },
	{ coords = vec4(-595.29, -1055.54, 22.43, 180.0), animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", clickable = false, frozen = true },
	{ coords = vec4(-587.4, -1059.6, 23.3, 0.0), animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", clickable = false, frozen = true },
	{ coords = vec4(-571.65, -1057.26, 22.54, 90.0), animDict = "creatures@cat@move", animName = "gallop", clickable = false, frozen = true },

	{ coords = vec4(-573.78, -1052.5, 22.34, 90.0), frozen = false },
	{ coords = vec4(-582.57, -1059.72, 22.34, 180.0), frozen = false },
	{ coords = vec4(-582.35, -1050.91, 22.34, 180.0), frozen = false },
	{ coords = vec4(-585.55, -1067.99, 22.34, 0.0), frozen = false },
	{ coords = vec4(-578.73, -1051.92, 22.35, 180.0), frozen = false },

}

onResourceStop(function()
	for k, v in pairs(Targets) do removeZoneTarget(Targets[k]) end
	for k, v in pairs(Cats) do unloadModel(GetEntityModel(v)) DeletePed(v) end
end, true)