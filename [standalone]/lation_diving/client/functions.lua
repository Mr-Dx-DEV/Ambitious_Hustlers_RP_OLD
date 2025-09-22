-- Initialize global variable to store phone, keys & disaptch
Phone, Keys, Fuel = nil, nil, nil

-- Initialize config(s)
local shared = require 'config.shared'
local client = require 'config.client'

-- Localize export
local diving = exports.lation_diving

-- You can change the textUI script here
-- Options: 'lation_ui', 'ox_lib', 'jg-textui', 'okokTextUI', 'qbcore' & 'custom'
local textui = 'ox_lib'

-- Get phone
local function InitializePhone()
    if GetResourceState('lb-phone') == 'started' then
        Phone = 'lb-phone'
    elseif GetResourceState('qb-phone') == 'started' then
        Phone = 'qb-phone'
    elseif GetResourceState('qs-smartphone-pro') == 'started' then
        Phone = 'qs-smartphone-pro'
    elseif GetResourceState('qs-smartphone') == 'started' then
        Phone = 'qs-smartphone'
    elseif GetResourceState('gksphone') == 'started' then
        Phone = 'gksphone'
    elseif GetResourceState('roadphone') == 'started' then
        Phone = 'roadphone'
    elseif GetResourceState('npwd') == 'started' then
        Phone = 'npwd'
    elseif GetResourceState('yseries') == 'started' then
        Phone = 'yseries'
    elseif GetResourceState('okokPhone') == 'started' then
        Phone = 'okokPhone'
    else
        -- Add custom phone here
    end
end

-- Get keys
local function InitializeKeys()
    if GetResourceState('qb-vehiclekeys') == 'started' then
        Keys = 'qb-vehiclekeys'
    elseif GetResourceState('cd_garage') == 'started' then
        Keys = 'cd_garage'
    elseif GetResourceState('wasabi_carlock') == 'started' then
        Keys = 'wasabi_carlock'
    elseif GetResourceState('qbx_vehiclekeys') == 'started' then
        Keys = 'qbx_vehiclekeys'
    elseif GetResourceState('vehicles_keys') == 'started' then
        Keys = 'vehicles_keys'
    elseif GetResourceState('okokGarage') == 'started' then
        Keys = 'okokGarage'
    elseif GetResourceState('qs-vehiclekeys') == 'started' then
        Keys = 'qs-vehiclekeys'
    elseif GetResourceState('Renewed-Vehiclekeys') == 'started' then
        Keys = 'Renewed-Vehiclekeys'
    elseif GetResourceState('t1ger_keys') == 'started' then
        Keys = 't1ger_keys'
    else
        -- Add custom keys here
    end
end

-- Get fuel
local function InitializeFuel()
    if GetResourceState('LegacyFuel') == 'started' then
        Fuel = 'LegacyFuel'
    elseif GetResourceState('ox_fuel') == 'started' then
        Fuel = 'ox_fuel'
    elseif GetResourceState('cdn-fuel') == 'started' then
        Fuel = 'cdn-fuel'
    elseif GetResourceState('x-fuel') == 'started' then
        Fuel = 'x-fuel'
    elseif GetResourceState('okokGasStation') == 'started' then
        Fuel = 'okokGasStation'
    elseif GetResourceState('rcore_fuel') == 'started' then
        Fuel = 'rcore_fuel'
    elseif GetResourceState('qs-fuelstations') == 'started' then
        Fuel = 'qs-fuelstations'
    elseif GetResourceState('ps-fuel') == 'started' then
        Fuel = 'ps-fuel'
    else
        -- Add custom fuel system here
    end
end

-- Display a notification
--- @param message string
--- @param type any
function ShowNotification(message, type)
    if shared.setup.notify == 'lation_ui' then
        exports.lation_ui:notify({ title = 'Scuba Diving', message = message, type = type or 'info', icon = 'fas fa-anchor' })
    elseif shared.setup.notify == 'ox_lib' then
        lib.notify({ description = message, type = type or 'inform', position = 'top', icon = 'fas fa-anchor' })
    elseif shared.setup.notify == 'esx' then
        ESX.ShowNotification(message)
    elseif shared.setup.notify == 'qb' then
        QBCore.Functions.Notify(message, type or 'primary')
    elseif shared.setup.notify == 'okok' then
        exports['okokNotify']:Alert('Scuba Diving', message, 5000, type or 'info', false)
    elseif shared.setup.notify == 'sd-notify' then
        exports['sd-notify']:Notify('Scuba Diving', message, type or 'primary')
    elseif shared.setup.notify == 'wasabi_notify' then
        exports.wasabi_notify:notify('Scuba Diving', message, 5000, type or 'info', false, 'fas fa-anchor')
    elseif shared.setup.notify == 'custom' then
        -- Add custom notification export/event here
    end
end

-- Display notifications from server
--- @param message string
--- @param type string
RegisterNetEvent('lation_diving:notify', function(message, type)
    ShowNotification(message, type)
end)

-- Set fuel
--- @param vehicle number Entity ID
function SetFuel(vehicle)
    if not Fuel then print('^1[ERROR]: No fuel system detected - cannot set fuel^0') return end
    if not vehicle or not DoesEntityExist(vehicle) then return end
    if Fuel == 'LegacyFuel' then
        exports[Fuel]:SetFuel(vehicle, 100.0)
    elseif Fuel == 'ox_fuel' then
        Entity(vehicle).state.fuel = 100.0
    elseif Fuel == 'cdn-fuel' then
        exports[Fuel]:SetFuel(vehicle, 100.0)
    elseif Fuel == 'x-fuel' then
        exports[Fuel]:SetFuel(vehicle, 100.0)
    elseif Fuel == 'okokGasStation' then
        exports[Fuel]:SetFuel(vehicle, 100.0)
    elseif Fuel == 'rcore_fuel' then
        exports[Fuel]:SetVehicleFuel(vehicle, 100.0)
    elseif Fuel == 'qs-fuelstations' then
        exports[Fuel]:SetFuel(vehicle, 100.0)
    elseif Fuel == 'ps-fuel' then
        exports[Fuel]:SetFuel(vehicle, 100.0)
    else
        -- Add custom fuel system here
    end
end

-- Give keys
--- @param vehicle number Entity ID
function GiveKeys(vehicle)
    if not Keys then print('^1[ERROR]: No vehicle keys detected - cannot give keys^0') return end
    if not vehicle or not DoesEntityExist(vehicle) then return end
    local plate = GetVehicleNumberPlateText(vehicle)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    if not plate or not model then return end
    if Keys == 'qb-vehiclekeys' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    elseif Keys == 'cd_garage' then
        TriggerEvent('cd_garage:AddKeys', plate)
    elseif Keys == 'wasabi_carlock' then
        exports[Keys]:GiveKey(plate)
    elseif Keys == 'qbx_vehiclekeys' then
        -- @qbox: doesn't have a native client-side export, #sad
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    elseif Keys == 'vehicles_keys' then
        TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", plate)
    elseif Keys == 'okokGarage' then
        TriggerServerEvent("okokGarage:GiveKeys", plate)
    elseif Keys == 'qs-vehiclekeys' then
        exports[Keys]:GiveKeys(plate, model, true)
    elseif Keys == 'Renewed-Vehiclekeys' then
        exports[Keys]:addKey(plate)
    elseif Keys == 't1ger_keys' then
        TriggerServerEvent('t1ger_keys:updateOwnedKeys', plate, true)
    else
        -- Add custom vehicle keys
    end
end

-- Remove keys
--- @param vehicle number Entity ID
function RemoveKeys(vehicle)
    if not Keys then print('^1[ERROR]: No vehicle keys detected - cannot remove keys^0') return end
    if not vehicle or not DoesEntityExist(vehicle) then return end
    local plate = GetVehicleNumberPlateText(vehicle)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    if not plate or not model then return end
    if Keys == 'qb-vehiclekeys' then
        TriggerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
    elseif Keys == 'cd_garage' then
        -- @cd_garage: no known way to remove keys
    elseif Keys == 'wasabi_carlock' then
        exports[Keys]:RemoveKey(plate)
    elseif Keys == 'qbx_vehiclekeys' then
        -- @qbox: doesn't have a native client-side export, #dumb
        TriggerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
    elseif Keys == 'vehicles_keys' then
        TriggerServerEvent("vehicles_keys:selfRemoveKeys", plate)
    elseif Keys == 'okokGarage' then
        -- @okokGarage: source as a second param? weird, but it's from the docs
        TriggerServerEvent("okokGarage:RemoveKeys", plate, cache.serverId)
    elseif Keys == 'qs-vehiclekeys' then
        exports[Keys]:RemoveKeys(plate, model)
    elseif Keys == 'Renewed-Vehiclekeys' then
        exports[Keys]:removeKey(plate)
    elseif Keys == 't1ger_keys' then
        TriggerServerEvent('t1ger_keys:updateOwnedKeys', plate, false)
    else
        -- Add custom vehicle keys
    end
end

-- Send an email
--- @param message string
RegisterNetEvent('lation_diving:sendEmail', function(message)
    if not message then return end
    if Phone == 'qs-smartphone' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = 'Diving Expert',
            subject = 'Scuba Diving',
            message = message
        })
    elseif Phone == 'roadphone' then
        exports[Phone]:sendMail({
            sender = 'Diving Expert',
            subject = 'Scuba Diving',
            message = message
        })
    else
        ShowAlert({
            header = 'Scuba Diving',
            content = message,
            centered = true,
            cancel = true
        })
    end
end)

-- Change player clothes
--- @param isDiving boolean 
function ChangeClothes(isDiving)
    if isDiving then
        local isMale = IsPedModel(cache.ped, `mp_m_freemode_01`)
        for _, clothes in pairs(shared.gear.clothes) do
            local drawableId = isMale and clothes.male.drawableId or clothes.female.drawableId
            local textureId = isMale and clothes.male.textureId or clothes.female.textureId
            SetPedComponentVariation(cache.ped, clothes.componentId, drawableId, textureId, 0)
        end
    else
        if Framework == 'esx' then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        elseif Framework == 'qb' then
            TriggerServerEvent('qb-clothes:loadPlayerSkin')
        end
        TriggerEvent('illenium-appearance:client:reloadSkin')
        TriggerEvent('fivem-appearance:client:reloadSkin')
    end
end

-- Return an inventory's "durability/quality" types
function GetDurabilityType()
    if Inventory == 'ox_inventory' then
        return 'durability'
    else
        return 'quality'
    end
end

-- Returns an items metadata
--- @param item string Item name
function GetMetadata(item)
    return lib.callback.await('lation_diving:getMetadata', false, item)
end

-- Display a progress bar
--- @param data table
function ProgressBar(data)
    if shared.setup.progress == 'lation_ui' then
        if exports.lation_ui:progressBar({
            label = data.label,
            description = data.description or nil,
            icon = data.icon or nil,
            duration = data.duration,
            useWhileDead = data.useWhileDead,
            allowSwimming = data.allowSwimming or false,
            canCancel = data.canCancel,
            steps = data.steps or nil,
            disable = data.disable,
            anim = {
                dict = data.anim.dict or nil,
                clip = data.anim.clip or nil,
                flag = data.anim.flag or nil
            },
            prop = {
                model = data.prop.model or nil,
                bone = data.prop.bone or nil,
                pos = data.prop.pos or nil,
                rot = data.prop.rot or nil
            }
        }) then
            return true
        end
        return false
    elseif shared.setup.progress == 'ox_lib' then
        -- Want to use ox_lib's progress circle instead of bar?
        -- Change "progressBar" to "progressCircle" below & done!
        if lib.progressBar({
            label = data.label,
            duration = data.duration,
            position = data.position or 'bottom',
            useWhileDead = data.useWhileDead,
            allowSwimming = data.allowSwimming or false,
            canCancel = data.canCancel,
            disable = data.disable,
            anim = {
                dict = data.anim.dict or nil,
                clip = data.anim.clip or nil,
                flag = data.anim.flag or nil
            },
            prop = {
                model = data.prop.model or nil,
                bone = data.prop.bone or nil,
                pos = data.prop.pos or nil,
                rot = data.prop.rot or nil
            }
        }) then
            return true
        end
        return false
    elseif shared.setup.progress == 'qbcore' then
        local p = promise.new()
        QBCore.Functions.Progressbar(data.label, data.label, data.duration, data.useWhileDead, data.canCancel, {
            disableMovement = data.disable.move,
            disableCarMovement = data.disable.car,
            disableMouse = false,
            disableCombat = data.disable.combat
        }, {
            animDict = data.anim.dict or nil,
            anim = data.anim.clip or nil,
            flags = data.anim.flag or nil
        }, {
            model = data.prop.model or nil,
            bone = data.prop.bone or nil,
            coords = data.prop.pos or nil,
            rotation = data.prop.rot or nil
        }, {},
        function()
            ClearPedTasks(cache.ped)
            p:resolve(true)
        end,
        function()
            ClearPedTasks(cache.ped)
            p:resolve(false)
        end)
        return Citizen.Await(p)
    else
        -- Add 'custom' progress bar here
    end
end

-- Register menu
--- @param data table
function RegisterMenu(data)
    if shared.setup.menu == 'lation_ui' then
        exports.lation_ui:registerMenu(data)
    elseif shared.setup.menu == 'ox_lib' then
        lib.registerContext(data)
    elseif shared.setup.menu == 'custom' then
        -- Add 'custom' menu system here
    end
end

-- Show menu
--- @param menuId string
function ShowMenu(menuId)
    if shared.setup.menu == 'lation_ui' then
        exports.lation_ui:showMenu(menuId)
    elseif shared.setup.menu == 'ox_lib' then
        lib.showContext(menuId)
    elseif shared.setup.menu == 'custom' then
        -- Add 'custom' menu system here
    end
end

-- Display an alert dialog
--- @param data table
function ShowAlert(data)
    if shared.setup.dialogs == 'lation_ui' then
        return exports.lation_ui:alert(data)
    elseif shared.setup.dialogs == 'ox_lib' then
        return lib.alertDialog(data)
    elseif shared.setup.dialogs == 'custom' then
        -- Add your custom alert dialog here
    end
end

-- Display an input dialog
--- @param data table
function ShowInput(data)
    if shared.setup.dialogs == 'lation_ui' then
        return exports.lation_ui:input({ title = data.title, options = data.options })
    elseif shared.setup.dialogs == 'ox_lib' then
        return lib.inputDialog(data.title, data.options)
    elseif shared.setup.dialogss == 'custom' then
        -- Add your custom input dialog here
    end
end

-- Display TextUI
--- @param text string 
--- @param icon string
function ShowTextUI(text, icon)
    if textui == 'lation_ui' then
        exports.lation_ui:showText({
            description = text,
            icon = icon,
            iconAnimation = 'beat'
        })
    elseif textui == 'ox_lib' then
        lib.showTextUI(text, {
            position = 'left-center',
            icon = icon
        })
    elseif textui == 'jg-textui' then
        exports['jg-textui']:DrawText(text)
    elseif textui == 'okokTextUI' then
        exports['okokTextUI']:Open(text, 'lightblue ', 'left', false)
    elseif textui == 'qbcore' then
        exports['qb-core']:DrawText(text, 'left')
    else
        -- Add custom textUI here
    end
end

-- Hide TextUI
--- @param label string
function HideTextUI(label)
    if textui == 'lation_ui' then
        local isOpen, text = exports.lation_ui:isOpen()
        if isOpen and text == label then
            exports.lation_ui:hideText()
        end
    elseif textui == 'ox_lib' then
        local isOpen, text = lib.isTextUIOpen()
        if isOpen and text == label then
            lib.hideTextUI()
        end
    elseif textui == 'jg-textui' then
        exports['jg-textui']:HideText()
    elseif textui == 'okokTextUI' then
        exports['okokTextUI']:Close()
    elseif textui == 'qbcore' then
        exports['qb-core']:HideText()
    else
        -- Add custom textUI here
    end
end

-- Add entity target
--- @param entity number Entity number
--- @param data table Options table
function AddTargetEntity(entity, data)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:AddTargetEntity(entity, {options = data, distance = 5})
    elseif shared.setup.interact == 'interact' then
        exports.interact:AddLocalEntityInteraction({
            entity = entity,
            interactDst = 5.0,
            offset = vec3(0.0, 0.0, 1.0),
            options = data
        })
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system defined in the config/shared.lua file^0')
    end
end

-- Add circle target zones
--- @param data table
function AddCircleZone(data)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:addSphereZone(data)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:AddCircleZone(data.name, data.coords, data.radius, {
            name = data.name,
            debugPoly = shared.setup.debug}, {
            options = data.options,
            distance = 2,
        })
    elseif shared.setup.interact == 'interact' then
        exports.interact:AddInteraction({
            coords = data.coords,
            interactDst = 2.0,
            id = data.name,
            options = data.options
        })
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system defined in the config/shared.lua file^0')
    end
end

-- Remove target from entity
--- @param entity any|number
--- @param data table|string
function RemoveTargetEntity(entity, data)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, data)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:RemoveTargetEntity(entity, data)
    elseif shared.setup.interact == 'interact' then
        exports.interact:RemoveLocalEntityInteraction(entity, data)
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system defined in the config/shared.lua file^0')
    end
end

-- Remove circle zone
--- @param name string
function RemoveCircleZone(name)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:removeZone(name)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:RemoveZone(name)
    elseif shared.setup.interact == 'interact' then
        exports.interact:RemoveInteraction(name)
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system defined in the config/shared.lua file^0')
    end
end

-- Function to spawn NPCs
--- @param model string
--- @param position vector4
function SpawnPed(model, position)
    lib.requestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = CreatePed(0, model, position.x, position.y, position.z - 1.0, position.w, false, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    return ped
end

-- Play anim on crate open
local function openCrate()
    if ProgressBar(client.anims.openCrate) then
        return true
    end
    return false
end

-- Use oxygen refill item
local function useRefill()
    local tankMetadata, metatype = GetMetadata(shared.gear.refill), GetDurabilityType()

    if not tankMetadata or not metatype or not tankMetadata[metatype] then
        print('^1[ERROR]: Missing or invalid metadata on oxygen tank item^0')
        print('^1[ERROR]: These items cannot be spawned - you must purchase from the shop^0')
        print('^1[ERROR]: Visit https://docs.lationscripts.com/scuba-diving/common for more info^0')
        return
    end

    local tankDurability = tankMetadata[metatype]
    if tankDurability <= 0 then
        ShowNotification(locale('notify.no-durability'), 'error')
        return
    end

    local level = diving:getPlayerData('level')
    if not level then return end

    local hasGear, gearItem, gearMetadata, gearDurability = false, nil, nil, 0

    for requiredLevel, gear in pairs(shared.gear.tanks) do
        if level >= requiredLevel and HasItem(gear.item, 1) then
            gearMetadata = GetMetadata(gear.item)
            if gearMetadata and gearMetadata[metatype] then
                gearDurability = gearMetadata[metatype]
                hasGear = true
                gearItem = gear.item
                break
            end
        end
    end

    if not hasGear then
        ShowNotification(locale('notify.no-scuba-gear'), 'error')
        return
    end

    local maxTransfer = math.min(tankDurability, 100 - gearDurability)
    ---@diagnostic disable-next-line: undefined-field
    maxTransfer = math.round(maxTransfer, 2)
    if maxTransfer <= 0 then
        ShowNotification(locale('notify.scuba-gear-full'), 'error')
        return
    end

    local input = ShowInput({
        title = 'Refill Tank',
        options = {
            { type = 'slider', label = locale('Select how much oxygen to transfer'), required = true, min = 0, max = maxTransfer, step = 0.01 }
        }
    })
    if not input or not input[1] then return end

    local transferAmount = input[1]

    gearDurability = math.min(gearDurability + transferAmount, 100)
    ---@diagnostic disable-next-line: undefined-field
    gearDurability = math.round(gearDurability, 2)

    tankDurability = tankDurability - transferAmount
    ---@diagnostic disable-next-line: undefined-field
    tankDurability = math.round(tankDurability, 2)

    TriggerServerEvent('lation_diving:setMetadata', cache.serverId, gearItem, metatype, gearDurability)
    TriggerServerEvent('lation_diving:setMetadata', cache.serverId, shared.gear.refill, metatype, tankDurability)

    ShowNotification(locale('notify.refill-success'), 'success')
end

if shared.setup.debug then
    RegisterCommand('debugzones', function()
        local crates = {}

        for id, zone in pairs(shared.zones) do
            lib.zones.sphere({
                coords = zone.location,
                radius = zone.radius,
                onEnter = function()
                    print(('You entered zoneId %s'):format(id))

                    for _, coords in pairs(zone.coords) do
                        local model = zone.models and zone.models[math.random(#zone.models)] or `prop_box_wood02a`
                        lib.requestModel(model)

                        local crate = CreateObject(model, coords.x, coords.y, coords.z, false, true, false)
                        PlaceObjectOnGroundProperly(crate)
                        FreezeEntityPosition(crate, true)
                        SetModelAsNoLongerNeeded(model)

                        crates[#crates + 1] = crate

                        AddCircleZone({
                            coords = GetEntityCoords(crate),
                            name = 'debug-crate' ..crate,
                            radius = 1.5,
                            debug = shared.setup.debug,
                            options = {
                                label = 'Debug crate ' .. id,
                                distance = 5.0,
                                icon = 'fas fa-bug',
                                onSelect = function()
                                    print(('Crate coords: %s'):format(coords))
                                end,
                                action = function()
                                    print(('Crate coords: %s'):format(coords))
                                end
                            }
                        })
                    end
                end,
                onExit = function()
                    print(('You exited zoneId %s'):format(id))

                    for _, crate in ipairs(crates) do
                        RemoveCircleZone('debug-crate' ..crate)
                        if DoesEntityExist(crate) then
                            DeleteEntity(crate)
                        end
                    end

                    crates = {}
                end,
                debug = shared.setup.debug
            })
        end

    end, false)
end

-- Register callback(s)
lib.callback.register('lation_diving:openCrate', openCrate)

-- Register net event(s)
RegisterNetEvent('lation_diving:useRefill', useRefill)

-- Initialize default(s)
InitializePhone()
InitializeKeys()
InitializeFuel()