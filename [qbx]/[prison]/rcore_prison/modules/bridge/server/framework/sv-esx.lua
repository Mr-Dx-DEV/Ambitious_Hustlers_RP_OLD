local CharSlotToServerId = {}

CreateThread(function()
    if Config.Framework == Framework.ESX then
        local ESX = nil
    
        local success, result = pcall(function()
            ESX = exports[Framework.ESX]:getSharedObject()
        end)
    
        if not success then
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
    
        Framework.object = ESX

        function Framework.getIdentifier(client)
            local player = Framework.getPlayer(client)
            if player == nil then return nil end

            local identifier = tostring(player.identifier)

            if isResourceLoaded(THIRD_PARTY_RESOURCE.CD) then
                local currentChar = CharSlotToServerId[tostring(client)]

                if not currentChar then
                    return identifier
                end

                if not identifier then
                    identifier = player.GetIdentifier()
                end

                local currentIdentifier = ('Char%s:%s'):format(currentChar, identifier)

                dbg.debug("cd_multicharacter - getIdentifier: Returning real identifier for player named %s with playerId %s: (%s)", GetPlayerName(client), client, currentIdentifier)

                return currentIdentifier
            else
                return identifier
            end
        end
        
        function Framework.canPerformJobCommand(client, commandName)
            local job = Framework.getJob(client)
            
            if job == nil then return false end
    
            local jobName = job.name:lower()
            local grade = job.grade
            local gradeName = job.gradeName:lower()

            if jobName == nil then return false end

            if not Config.RestrictCommands.Enable and Config.Jobs[jobName] then
                return true
            end

            if Config.AllowAdminGroupsUseJailCommands and Framework.isAdmin(client) then
                return true, true
            end

            if Config.RestrictCommands and Config.RestrictCommands.Enable and commandName and Config.RestrictCommands.ListGrades[commandName] and next(Config.RestrictCommands.ListGrades[commandName]) then
                if Config.RestrictCommands.UseGradeNumbers and grade ~= nil then
                    if grade >= Config.RestrictCommands.GradeNumber then
                        return true, true
                    else
                        return false, _U('PERMISSION.NOT_ENOUGH_RANK')
                    end
                else
                    local hasPermission = Config.RestrictCommands.ListGrades[commandName][gradeName]

                    if not hasPermission then
                        return false, _U('PERMISSION.NOT_ENOUGH_RANK')
                    else
                        return true, true
                    end
                end
            end
            
            return false
        end
        
        function Framework.getJob(client)
            local player = Framework.getPlayer(client)
            
            if player == nil then return nil end

            return {
                name = player.job.name,
                gradeName = player.job.grade_name,
                grade = player.job.grade
            }
        end
    
        function Framework.getCharacterShortName(client)
            local player = Framework.getPlayer(client)
    
            if player == nil then return nil end
    
            local firstname = player.get('firstName')
            local lastname = player.get('lastName')
    
            local shortName = firstname or lastname
    
            if shortName == nil then
                shortName = player.firstname or player.lastname
            end
    
            return shortName
        end
    
        function Framework.getCharacterName(client)
            local player = Framework.getPlayer(client)
    
            if player == nil then return nil end
    
            local firstname = player.get('firstName')
            local lastname = player.get('lastName')
    
            if firstname == nil or lastname == nil then
                firstname = player.firstname
                lastname = player.lastname
            end
    
            return string.format('%s %s', firstname, lastname)
        end

            
        function Framework.getPlayer(client)
            local player = ESX.GetPlayerFromId(client)
            if player == nil then return end
    
            return player
        end
    
        function Framework.sendNotification(client, message, type)
            local player = Framework.getPlayer(client)
            if player == nil then return end
    
            player.showNotification(message, type)
        end
    
        function Framework.isAdmin(client)
            local retval = false
            local player = Framework.getPlayer(client)

            if player == nil then return false end
    
            local group = player.getGroup()

            for _, adminGroup in ipairs(Config.FrameworkAdminGroups[Config.Framework]) do
                if group == adminGroup then
                    return true
                end
            end

            if not retval and Ace.Can(client, Permissions.HAS_SERVER_GROUP) then
                retval = true
            end

            if not retval and IsPlayerAceAllowed(client, 'command') then
                retval = true
            end
    
            return retval
        end

        
        function Framework.getOfficers()
            local players = GetPlayers()
            local officers = {}

            if isResourcePresentProvideless(THIRD_PARTY_RESOURCE.WASABI_POLICE) then
                for _, playerId in pairs(players) do
                    playerId = tonumber(playerId)
                    
                    local job = Framework.getJob(playerId)
    
                    if job and job.name and Config.Jobs[job.name] then
                        dbg.debug("GetOfficers: Adding player with ID: %s that has job named: %s", playerId, job.name)
                        officers[#officers + 1] = playerId
                    end
                end
                
                return exports.wasabi_police:getPoliceOnline(), officers
            else
                for _, playerId in pairs(players) do
                    playerId = tonumber(playerId)
                    
                    local job = Framework.getJob(playerId)
    
                    if job and job.name and Config.Jobs[job.name] then
                        dbg.debug("GetOfficers: Adding player with ID: %s that has job named: %s", playerId, job.name)
                        officers[#officers + 1] = playerId
                    end
                end
            end
 

            return officers
        end

        function Framework.setJob(client, jobName)
            local player = Framework.getPlayer(client)

            if not player then
                return nil
            end

            if not jobName then
                jobName = 'unemployed'
            end

            local success, result = pcall(function()
                player.SetJob(jobName)
            end)

            dbg.debug("Framework.setJob: Setting citizen %s (%s) to job named: %s", GetPlayerName(client), client, jobName)
        end


        function Framework.canStartPrisonBreak()
            local retval = false
            local officers = Framework.getOfficers()

            if type(officers) == "table" then
                if Config.Escape.PoliceCheck then
                    if officers and next(officers) then
                        local size = #officers

                        if not size or size == 0 then
                            size = table.size(officers)
                        end

                        if size and size >= Config.Escape.RequiredPolice then
                            retval = true
                            dbg.debug('Can start prison break: %s', officers)
                        else
                            dbg.debug('Cannot start prison break not enough officers: %s', officers)
                        end
                    end
                else
                    retval = true
                end
            elseif type(officers) == "number" then
                if Config.Escape.PoliceCheck then
                    if officers >= Config.Escape.RequiredPolice then
                        retval = true
                        dbg.debug('Can start prison break: %s', officers)
                    else
                        dbg.debug('Cannot start prison break not enough officers: %s', officers)
                    end
                else
                    retval = true
                end
            end

            return retval
        end
        
        local disabledInventories = {
            [Inventories.QS] = true,
            [Inventories.OX] = true,
        }

        function Framework.cacheItems()
            if isResourcePresentProvideless(Inventories.QS) then
                return
            end

            if isResourcePresentProvideless(Inventories.OX) then
                return
            end

            if disabledInventories[Config.Inventories] then
                return
            end

            local serverItems = nil

            if Config.Inventories == Inventories.ESX then
                serverItems = db.GetServerItems()
            end

            if doesExportExistInResource(Inventories.CODEM, 'GetItemList') then
                ServerItems = exports['codem-inventory']:GetItemList()
            end

            if serverItems and next(serverItems) then
                for k, v in pairs(serverItems) do
                    if v then
                        local itemName = v.name and v.name:upper()

                        if itemName and not ServerItems[itemName:upper()] then
                            ServerItems[itemName:upper()] = v
                        end
                    end
                end

                dbg.debug('Server items: Find %s amount of items on your server.', table.size(serverItems))
            end
        end

    
        --- @return boolean
        function Framework.clearInventory(client)
            local player = Framework.getPlayer(client)

            if not player then
                return false
            end

            local inventory = player.getInventory()
            local p = promise.new()
            local state = false

            if inventory and next(inventory) then
                local size = table.size(inventory)
                
                for k, v in pairs(inventory) do
                    local amount = tonumber(v.count)

                    if amount and amount > 0 then
                        if Config.Stash.KeepItemsState and not Inventory.KeepSessionItems[v.name] then
                            local match = string.match(v.name, "^WEAPON(.*)")

                            if match then
                                player.removeWeapon(v.name)
                            else
                                player.setInventoryItem(v.name, 0)
                            end
                        elseif not Config.Stash.KeepItemsState then
                            local match = string.match(v.name, "^WEAPON(.*)")

                            if match then
                                player.removeWeapon(v.name)
                            else
                                player.setInventoryItem(v.name, 0)
                            end
                        end
                    end


                    if tonumber(k) >= size then
                        TriggerEvent("esx:playerInventoryCleared", client)
                        TriggerEvent("esx:playerLoadoutCleared", client)
                        state = true
                    end
                end
            end

            return state
        end

        RegisterNetEvent('rcore_prison:server:requestPlayerLoaded', function()
            local playerId = source

            if playerId then
                TriggerEvent('rcore_prison:server:playerLoaded', playerId)
            end
        end)

        AddEventHandler('esx:playerLogout', function (playerId)
            TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
        end)

        AddEventHandler('esx:playerDropped', function (playerId)
            TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
        end)

        AddEventHandler('playerDropped', function()
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
            end
        end)

        Framework.cacheItems()
    end    
end, "sv-esx code name: Phoenix")