-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
local ESX = nil
if wsb.framework == 'esx' then ESX = exports['es_extended']:getSharedObject() end
----------------------------------------------------------------
-- Customize text ui, notifications, target and more with the --
-- "wasabi_bridge" dependency in the "customize" directory    --
-- "wasabi_bridge/customize/cl_customize.lua"                 --
----------------------------------------------------------------

--Send to jail
RegisterNetEvent('wasabi_police:sendToJail', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    if deathCheck() or isCuffed then return end
    local target, time

    if Config.Jail.input or Config.Jail.BuiltInPrison.enabled then
        local coords = GetEntityCoords(wsb.cache.ped)
        local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
        if not player then
            TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
            return
        else
            local input = wsb.inputDialog(Strings.minutes_dialog, { Strings.minutes_dialog_field }, Config.UIColor)
            if not input then return end
            local input1 = tonumber(input[1])
            if type(input1) ~= 'number' then return end
            local quantity = math.floor(input1)
            if quantity < 1 then
                TriggerEvent('wasabi_bridge:notify', Strings.invalid_amount, Strings.invalid_amount_desc, 'error')
                return
            else
                target, time = GetPlayerServerId(player), quantity
            end
        end
    end
    if Config.Jail.BuiltInPrison.enabled and target and time then
        TriggerServerEvent('wasabi_police:server:sendToJail', target, time)
    else 
        if Config.Jail.jail == 'qb' then
            TriggerServerEvent('wasabi_police:qbPrisonJail', target, time)
        elseif Config.Jail.jail == 'rcore' then
            exports['rcore_prison']:Jail(target, time)
        elseif Config.Jail.jail == 'tk_jail' then
            if wsb.framework == 'esx' then
                exports.esx_tk_jail:jail(target, time)
            elseif wsb.framework == 'qb' then
                exports.qb_tk_jail:jail(target, time)
            end
        elseif Config.Jail.jail == 'hd_jail' then
            TriggerServerEvent('HD_Jail:sendToJail', target, 'Prison', time, 'Sentenced', 'Police')
        elseif Config.Jail.jail == 'myPrison' then
            ExecuteCommand('jail')
        elseif Config.Jail.jail == 'qalle-jail' then
            TriggerServerEvent('esx-qalle-jail:jailPlayer', target, time, 'Sentenced')
        elseif Config.Jail.jail == 'plouffe' then
            exports.plouffe_jail:Set(target, time)
        elseif Config.Jail.jail == 'mx' then
            TriggerServerEvent('mx_jail:jailPlayer', target, time, target)
            TriggerServerEvent('mx_jail:setTime', target, time)
        elseif Config.Jail.jail == 'r_prison' then
            exports.r_prison:JailPlayer(target, time)
        elseif Config.Jail.jail == 'custom' then
            -- Custom logic here?
        end
    end
end)

--Impound Vehicle
impoundSuccessful = function(vehicle)
    if not DoesEntityExist(vehicle) then return end
    SetEntityAsMissionEntity(vehicle, false, false)
    if Config.AdvancedParking then
        exports['AdvancedParking']:DeleteVehicleOnServer(vehicle, nil, nil)
    else
        DeleteVehicle(vehicle)
    end
    if not DoesEntityExist(vehicle) then
        TriggerEvent('wasabi_bridge:notify', Strings.success, Strings.car_impounded_desc, 'success')
    end
end

--Death check
deathCheck = function(serverId)
    serverId = serverId or GetPlayerServerId(PlayerId())
    local ped = GetPlayerPed(GetPlayerFromServerId(serverId)) or PlayerPedId()
    return Player(serverId).state.dead
        or IsPedFatallyInjured(ped)
        or IsEntityPlayingAnim(ped, 'dead', 'dead_a', 3)
        or IsEntityPlayingAnim(ped, 'mini@cpr@char_b@cpr_def', 'cpr_pumpchest_idle', 3)
end

-- Personal locker access
function OpenPersonalStash(station)
    if not Config.Locations[station] or not Config.Locations[station].personalLocker then return end
    if #(GetEntityCoords(PlayerPedId()) - Config.Locations[station].personalLocker.coords) > Config.Locations[station].personalLocker.range then return end
    if not wsb.inventorySystem then return end
    if not wsb.hasGroup(Config.policeJobs) then return end

    local id = station .. '_' .. wsb.getIdentifier()
    if wsb.awaitServerCallback('wasabi_police:registerStash', {
        name = id,
        slots = 30,
        maxWeight = 50000,
        station = station,
        location = 'personalLocker'
        
    }) then 
    wsb.inventory.openStash({
        name = id,
        maxWeight = 50000,
        slots = 30
    })
    end
end

-- Evidence locker access
function OpenEvidenceLocker(station)
    if not Config.Locations[station] or not Config.Locations[station].evidenceLocker then return end
    if #(GetEntityCoords(PlayerPedId()) - Config.Locations[station].evidenceLocker.coords) > Config.Locations[station].evidenceLocker.range then return end
    if not wsb.inventorySystem then return end
    if not wsb.hasGroup(Config.policeJobs) then return end

    local input = wsb.inputDialog(Strings.evidence_storage, { Strings.locker_number }, Config.UIColor)
    if not input or not input[1] then
        TriggerEvent('wasabi_bridge:notify', Strings.invalid_entry, Strings.invalid_entry_desc, 'error')
        return
    end
    input = tonumber(input[1])
    if type(input) ~= 'number' then
        TriggerEvent('wasabi_bridge:notify', Strings.invalid_entry, Strings.invalid_entry_desc, 'error')
        return
    end
    if input < 1 then
        TriggerEvent('wasabi_bridge:notify', Strings.invalid_entry, Strings.invalid_entry_desc, 'error')
        return
    end

    input = math.floor(input)

    local id = station .. '_evidence_' .. input
    if wsb.awaitServerCallback('wasabi_police:registerStash', {
        name = id,
        slots = 100,
        maxWeight = 500000,
        station = station,
        location = 'evidenceLocker'
    }) then
        wsb.inventory.openStash({
            name = id,
            maxWeight = 500000,
            slots = 100
    })
    end
end

--Search player
searchPlayer = function(player)
    if deathCheck() or isCuffed then return end
    if not wsb.inventorySystem then
        if GetResourceState('mf-inventory') == 'started' then
            local identifier = wsb.awaitServerCallback('wasabi_police:getIdentifier', GetPlayerServerId(player))
            exports['mf-inventory']:openOtherInventory(identifier)
        elseif GetResourceState('inventory') == 'started' then --Chezza using inventory as their folder name
            TriggerEvent('inventory:openPlayerInventory', GetPlayerServerId(player), true)
        else
            print('NO INVENTORY FOUND CONFIG YOUR INV IN CL_CUSTOMIZE.LUA')
        end
    else
        wsb.inventory.openPlayerInventory(GetPlayerServerId(player))
    end
end

exports('searchPlayer', searchPlayer)

DisableInventory = function(bool) -- Disable inventory when cuffed, enable when released
    if wsb.inventorySystem ~= 'qs-inventory' then return end
    exports['qs-inventory']:setInventoryDisabled(bool)
end

--Change clothes(Cloakroom)
AddEventHandler('wasabi_police:changeClothes', function(data)
    local gender = wsb.getGender()
    if not gender or gender == 0 or gender == 'm' then gender = 'male' end
    if gender == 'f' or gender == 1 then gender = 'female' end
    if data == 'civ_wear' then
        RemoveClothingProps()
        RequestCivilianOutfit()
        return
    end
    if type(data) ~= 'table' then return end
    SaveCivilianOutfit()
    RemoveClothingProps()
    if data[gender] and data[gender].clothing and next(data[gender].clothing) then
        for _, clothing in pairs(data[gender].clothing) do
            SetPedComponentVariation(wsb.cache.ped, clothing.component, clothing.drawable, clothing.texture, 0)
        end
    end
    if data[gender] and data[gender].props and next(data[gender].props) then
        for _, prop in pairs(data[gender].props) do
            SetPedPropIndex(wsb.cache.ped, prop.component, prop.drawable, prop.texture, true)
        end
    end
end)

-- Billing event
AddEventHandler('wasabi_police:finePlayer', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    if deathCheck() or isCuffed then return end
    local hasJob, _grade = wsb.getGroup()
    local coords = GetEntityCoords(wsb.cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    local targetId = GetPlayerServerId(player)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    elseif Config.billingSystem == 'default' then
        FineSuspect(targetId)
    else
        local jobLabel = wsb.playerData.job.label
        if Config.billingSystem == 'okok' then
            TriggerEvent('okokBilling:ToggleCreateInvoice')
        else
            local input = wsb.inputDialog(Strings.invoice_amount, { Strings.amount_invoice }, Config.UIColor)
            if not input or not input[1] then return end
            local input1 = tonumber(input[1])
            if type(input1) ~= 'number' then return end
            local amount = math.floor(input1)
            if amount < 1 then
                TriggerEvent('wasabi_bridge:notify', Strings.invalid_entry, Strings.invalid_entry_desc, 'error')
            elseif Config.billingSystem == 'pefcl' then
                TriggerServerEvent('wasabi_police:billPlayer', targetId, wsb.playerData.job, amount)
            elseif Config.billingSystem == 'qb' then
                TriggerServerEvent('wasabi_police:qbBill', targetId, amount, wsb.playerData.job.name)
                local gender = Strings.mr
                if wsb.playerData.charinfo.gender == 1 then
                    gender = Strings.mrs
                end
                local charinfo = wsb.playerData.charinfo
                TriggerServerEvent('wasabi_police:sendQBEmail', targetId, {
                    sender = wsb.playerData.job.label,
                    subject = Strings.debt_collection,
                    message = (Strings.db_email):format(gender, charinfo.lastname, amount),
                    button = {}
                })
            elseif Config.billingSystem == 'esx' then
                TriggerServerEvent('esx_billing:sendBill', targetId, 'society_' .. hasJob, jobLabel, amount)
            else
                -- Replace this print with your billing system logic!
                print('^0[^3WARNING^0] No proper billing system selected in configuration!')
            end
        end
    end
end)

-- Job menu
openJobMenu = function()
    local job, grade = wsb.hasGroup(Config.policeJobs)
    if not job or not grade then return end
    if not wsb.isOnDuty() then return end
    if deathCheck() or isCuffed then return end
    local jobLabel = Strings.police
    local Options = {}
    if Config.searchPlayers then
        Options[#Options + 1] = {
            title = Strings.search_player,
            description = Strings.search_player_desc,
            icon = 'magnifying-glass',
            arrow = false,
            event = 'wasabi_police:searchPlayer',
        }
    end
    if Config.seizeCash.enabled then
        Options[#Options + 1] = {
            title = Strings.seize_cash_title,
            description = Strings.seize_cash_label,
            icon = 'fa-sack-dollar',
            arrow = false,
            event = 'wasabi_police:seizeCash',
        }
    end
    Options[#Options + 1] = {
        title = Strings.check_id,
        description = Strings.check_id_desc,
        icon = 'id-card',
        arrow = true,
        event = 'wasabi_police:checkId',
    }
    if Config?.GrantWeaponLicenses?.enabled and tonumber(grade or 0) >= Config.GrantWeaponLicenses.minGrade then
        Options[#Options + 1] = {
            title = Strings.grant_license,
            description = Strings.grant_license_desc,
            icon = 'id-card',
            arrow = true,
            event = 'wasabi_police:grantLicense',
        }
    end
    if Config.Jail.enabled then
        Options[#Options + 1] = {
            title = Strings.jail_player,
            description = Strings.jail_player_desc,
            icon = 'lock',
            arrow = false,
            event = 'wasabi_police:sendToJail',
        }
    end
    Options[#Options + 1] = {
        title = Strings.handcuff_soft_player,
        description = Strings.handcuff_soft_player_desc,
        icon = 'hands-bound',
        arrow = false,
        args = { type = 'soft' },
        event = 'wasabi_police:handcuffPlayer',
    }
    Options[#Options + 1] = {
        title = Strings.handcuff_hard_player,
        description = Strings.handcuff_hard_player_desc,
        icon = 'hands-bound',
        arrow = false,
        args = { type = 'hard' },
        event = 'wasabi_police:handcuffPlayer',
    }
    Options[#Options + 1] = {
        title = Strings.escort_player,
        description = Strings.escort_player_desc,
        icon = 'hand-holding-hand',
        arrow = false,
        event = 'wasabi_police:escortPlayer',
    }
    if Config.GSR.enabled then
        Options[#Options + 1] = {
            title = Strings.gsr_test,
            description = Strings.gsr_test_desc,
            icon = 'gun',
            arrow = false,
            event = 'wasabi_police:gsrTest',
        }
    end
    Options[#Options + 1] = {
        title = Strings.put_in_vehicle,
        description = Strings.put_in_vehicle_desc,
        icon = 'arrow-right-to-bracket',
        arrow = false,
        event = 'wasabi_police:inVehiclePlayer',
    }
    Options[#Options + 1] = {
        title = Strings.take_out_vehicle,
        description = Strings.take_out_vehicle_desc,
        icon = 'arrow-right-from-bracket',
        arrow = false,
        event = 'wasabi_police:outVehiclePlayer',
    }
    Options[#Options + 1] = {
        title = Strings.vehicle_interactions,
        description = Strings.vehicle_interactions_desc,
        icon = 'car',
        arrow = true,
        event = 'wasabi_police:vehicleInteractions',
    }
    if Config.RadarPosts and Config.RadarPosts.enabled and Config.RadarPosts.jobs[job] and tonumber(grade or 0) >= Config.RadarPosts.jobs[job] then
        Options[#Options + 1] = {
            title = Strings.menu_radar_posts,
            description = Strings.menu_radar_posts_desc,
            icon = 'gauge-high',
            arrow = true,
            event = 'wasabi_police:radarPosts',
        }
    end
    if Config.CCTVCameras and Config.CCTVCameras.enabled  then
        Options[#Options + 1] = {
            title = Strings.menu_cctv_cameras,
            description = Strings.menu_cctv_cameras_desc,
            icon = 'video',
            arrow = true,
            event = 'wasabi_police:cctvCameras',
        }
    end
    if Config.TrackingBracelet.enabled and Config.TrackingBracelet.jobs[job] and tonumber(grade or 0) >= Config.TrackingBracelet.jobs[job] then
        Options[#Options + 1] = {
            title =  Strings.tracking_bracelet,
            description = Strings.tracking_bracelet_desc,
            icon = 'street-view',
            arrow = false,
            event = 'wasabi_police:trackPlayer',
        }
        
        Options[#Options + 1] = {
            title = Strings.menu_tracking_bracelet,
            description = Strings.menu_tracking_bracelet_desc,
            icon = 'map-location-dot',
            arrow = false,
            event = 'wasabi_police:trackingBracelet',
        }
       
    end

    Options[#Options + 1] = {
        title = Strings.place_object,
        description = Strings.place_object_desc,
        icon = 'box',
        arrow = true,
        event = 'wasabi_police:placeObjects',
    }
    if Config.billingSystem then
        Options[#Options + 1] = {
            title = Strings.fines,
            description = Strings.fines_desc,
            icon = 'file-invoice',
            arrow = false,
            event = 'wasabi_police:finePlayer',
        }
    end

    if Config.MobileMenu.enabled then
        wsb.showMenu({
            id = 'pd_job_menu',
            color = Config.UIColor,
            title = jobLabel,
            position = Config.MobileMenu.position,
            options = Options
        })
        return
    end

    wsb.showContextMenu({
        id = 'pd_job_menu',
        color = Config.UIColor,
        title = jobLabel,
        options = Options

    })
end
