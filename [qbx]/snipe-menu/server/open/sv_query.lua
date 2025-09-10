MySQL.ready(function()
    MySQL.Async.execute('CREATE TABLE IF NOT EXISTS `snipe_menu_modsettings` (`role` varchar(100) NOT NULL, `settings` longtext DEFAULT NULL, PRIMARY KEY (`role`), KEY `role` (`role`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;', {})
    MySQL.Async.execute('CREATE TABLE IF NOT EXISTS `snipe_menu_perms` (`identifier` varchar(100) NOT NULL, `name` varchar(100) DEFAULT NULL, `perms` longtext DEFAULT NULL, PRIMARY KEY (`identifier`), KEY `identifier` (`identifier`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;', {})
    MySQL.Async.execute('CREATE TABLE IF NOT EXISTS `snipe_menu_stashesprop` (`id` int(11) NOT NULL AUTO_INCREMENT, `model` varchar(100) DEFAULT NULL, `heading` float DEFAULT NULL, `stashName` varchar(50) DEFAULT "0", `job` varchar(100) DEFAULT "0", `size` bigint(20) DEFAULT 0, `slots` bigint(20) DEFAULT 0, `coords` longtext DEFAULT NULL, `isJob` tinyint(4) DEFAULT 0, `isGang` tinyint(4) DEFAULT 0, KEY `id` (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;', {})

    -- check if column rotation exists in snipe_menu_stashesprop if not then add it
    MySQL.Async.execute('ALTER TABLE `snipe_menu_stashesprop` ADD COLUMN IF NOT EXISTS `rotation` longtext DEFAULT NULL;', {})
end)

CreateThread(function()
    local LoadJson = json.decode(LoadResourceFile(GetCurrentResourceName(), 'jobstash.json'))
    
    if next(LoadJson) ~= nil then
        for k,v in ipairs(LoadJson) do
            MySQL.Async.execute('INSERT INTO snipe_menu_stashesprop (stashName, model, heading, job, size, slots, coords, isJob, isGang) VALUES (@stashName, @model, @heading, @job, @size, @slots, @coords, @isJob, @isGang)', {
                ['@stashName'] = v.stashName,
                ['@model'] = v.model,
                ['@heading'] = v.heading,
                ['@job'] = v.job,
                ['@size'] = v.size,
                ['@slots'] = v.slots,
                ['@coords'] = json.encode(v.coords),
                ['@isJob'] = v.isJob,
                ['@isGang'] = v.isGang
            })
            v.coords = vector3(v.coords['x'], v.coords['y'], v.coords['z'])
        end
        SaveResourceFile(GetCurrentResourceName(), "jobstash.json", '[]', -1)
    end


    local LoadJson = json.decode(LoadResourceFile(GetCurrentResourceName(), 'modsettings.json'))
    -- ModSettings = LoadJson
    if next(LoadJson) ~= nil then
        for k,v in pairs(LoadJson) do
            MySQL.Async.execute('INSERT INTO snipe_menu_modsettings (role, settings) VALUES (@role, @settings) ON DUPLICATE KEY UPDATE settings = @settings', {
                ['@role'] = k,
                ['@settings'] = json.encode(v)
            })
        end
        SaveResourceFile(GetCurrentResourceName(), "modsettings.json", '[]', -1)
    end

    local jsonLoad = json.decode(LoadResourceFile(GetCurrentResourceName(), 'perms.json'))
    
    if next(jsonLoad) ~= nil then
        for k, v in pairs(jsonLoad) do
            MySQL.Async.execute('INSERT INTO snipe_menu_perms (identifier, name, perms) VALUES (@identifier, @name, @perms) ON DUPLICATE KEY UPDATE perms = @perms', {
                ['@identifier'] = k,
                ['@name'] = v.name,
                ['@perms'] = json.encode(v.perms)
            })
        end
        SaveResourceFile(GetCurrentResourceName(), "perms.json", '[]', -1)
    end

end)