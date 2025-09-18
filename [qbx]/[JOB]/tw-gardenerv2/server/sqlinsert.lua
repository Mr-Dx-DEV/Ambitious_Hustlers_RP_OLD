SQLChecker = false
local processingColumns = {} -- Örneğin "tw_gardener_dailymission" gibi anahtarlar tutar

local createTableQueries = {
    tw_gardener = [[
        CREATE TABLE IF NOT EXISTS `tw_gardener` (
            `identifier` char(50) DEFAULT NULL,
            `profiledata` longtext DEFAULT NULL,
            `dailymission` longtext DEFAULT NULL,
            `tutorial` longtext DEFAULT NULL,
            `history` longtext DEFAULT NULL,
            `uisettings` longtext DEFAULT NULL,
            UNIQUE KEY `identifier` (`identifier`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
    ]]
}

local alterTableQueries = {
    tw_gardener = {
        { column = "identifier",   alterQuery = "ALTER TABLE `tw_gardener` ADD COLUMN `identifier` char(50) DEFAULT NULL;",   correctType = "char(50)" },
        { column = "profiledata",  alterQuery = "ALTER TABLE `tw_gardener` ADD COLUMN `profiledata` longtext DEFAULT NULL;",  correctType = "longtext" },
        { column = "dailymission", alterQuery = "ALTER TABLE `tw_gardener` ADD COLUMN `dailymission` longtext DEFAULT NULL;", correctType = "longtext" },
        { column = "tutorial",     alterQuery = "ALTER TABLE `tw_gardener` ADD COLUMN `tutorial` longtext DEFAULT NULL;",     correctType = "longtext" },
        { column = "history",      alterQuery = "ALTER TABLE `tw_gardener` ADD COLUMN `history` longtext DEFAULT NULL;",      correctType = "longtext" },
        { column = "uisettings",   alterQuery = "ALTER TABLE `tw_gardener` ADD COLUMN `uisettings` longtext DEFAULT NULL;",   correctType = "longtext" },
    }
}

local function checkAndCorrectColumnType(tableName, column, correctType)
    local checkQuery = "SHOW COLUMNS FROM `" .. tableName .. "` LIKE '" .. column .. "';"
    local callbackFunction = function(result)
        if #result > 0 then
            local currentType = result[1].Type:lower()
            if currentType ~= correctType then
                local alterQuery = "ALTER TABLE `" .. tableName .. "` MODIFY `" .. column .. "` " .. correctType .. " DEFAULT NULL;"
                if Config.SQL == "oxmysql" then
                    exports.oxmysql:execute(alterQuery, {})
                elseif Config.SQL == "ghmattimysql" then
                    exports.ghmattimysql:execute(alterQuery, {})
                elseif Config.SQL == "mysql-async" then
                    MySQL.Async.execute(alterQuery, {})
                end
            end
        end
    end

    if Config.SQL == "oxmysql" then
        exports.oxmysql:execute(checkQuery, {}, callbackFunction)
    elseif Config.SQL == "ghmattimysql" then
        exports.ghmattimysql:execute(checkQuery, {}, callbackFunction)
    elseif Config.SQL == "mysql-async" then
        MySQL.Async.fetchAll(checkQuery, {}, callbackFunction)
    end
end

local function checkAndCorrectCollation(tableName, column, correctCollation)
    local checkCollationQuery = "SHOW FULL COLUMNS FROM `" .. tableName .. "` LIKE '" .. column .. "';"
    local callbackFunction = function(result)
        if #result > 0 then
            local currentCollation = result[1].Collation
            if currentCollation ~= correctCollation then
                local alterQuery = "ALTER TABLE `" .. tableName .. "` MODIFY `" .. column .. "` " .. result[1].Type .. " COLLATE " .. correctCollation .. ";"
                if Config.SQL == "oxmysql" then
                    exports.oxmysql:execute(alterQuery, {})
                elseif Config.SQL == "ghmattimysql" then
                    exports.ghmattimysql:execute(alterQuery, {})
                elseif Config.SQL == "mysql-async" then
                    MySQL.Async.execute(alterQuery, {})
                end
            end
        end
    end

    if Config.SQL == "oxmysql" then
        exports.oxmysql:execute(checkCollationQuery, {}, callbackFunction)
    elseif Config.SQL == "ghmattimysql" then
        exports.ghmattimysql:execute(checkCollationQuery, {}, callbackFunction)
    elseif Config.SQL == "mysql-async" then
        MySQL.Async.fetchAll(checkCollationQuery, {}, callbackFunction)
    end
end

local function checkAndAddColumn(tableName, queryInfo, callback)
    local column = queryInfo.column
    local key = tableName .. "_" .. column
    if processingColumns[key] then
        callback(false)
        return
    end
    processingColumns[key] = true

    local alterQuery = queryInfo.alterQuery
    local correctType = queryInfo.correctType
    local correctCollation = "utf8mb4_unicode_ci"
    local checkQuery = "SHOW COLUMNS FROM `" .. tableName .. "` LIKE '" .. column .. "';"

    local function attemptAdd()
        if Config.SQL == "oxmysql" then
            exports.oxmysql:execute(alterQuery, {}, function(alterResult)
                if alterResult then
                    Citizen.Wait(200)
                    processingColumns[key] = nil
                    callback(true)
                else
                    exports.oxmysql:execute(checkQuery, {}, function(newResult)
                        processingColumns[key] = nil
                        callback(#newResult > 0)
                    end)
                end
            end)
        elseif Config.SQL == "ghmattimysql" then
            exports.ghmattimysql:execute(alterQuery, {}, function(alterResult)
                if alterResult then
                    Citizen.Wait(200)
                    processingColumns[key] = nil
                    callback(true)
                else
                    exports.ghmattimysql:execute(checkQuery, {}, function(newResult)
                        processingColumns[key] = nil
                        callback(#newResult > 0)
                    end)
                end
            end)
        elseif Config.SQL == "mysql-async" then
            MySQL.Async.execute(alterQuery, {}, function(alterResult)
                if alterResult then
                    Citizen.Wait(200)
                    processingColumns[key] = nil
                    callback(true)
                else
                    MySQL.Async.fetchAll(checkQuery, {}, function(newResult)
                        processingColumns[key] = nil
                        callback(#newResult > 0)
                    end)
                end
            end)
        end
    end

    local callbackFunction = function(result)
        if #result == 0 then
            Citizen.Wait(200)
            if Config.SQL == "oxmysql" then
                exports.oxmysql:execute(checkQuery, {}, function(newResult)
                    if #newResult == 0 then
                        attemptAdd()
                    else
                        processingColumns[key] = nil
                        callback(false)
                    end
                end)
            elseif Config.SQL == "ghmattimysql" then
                exports.ghmattimysql:execute(checkQuery, {}, function(newResult)
                    if #newResult == 0 then
                        attemptAdd()
                    else
                        processingColumns[key] = nil
                        callback(false)
                    end
                end)
            elseif Config.SQL == "mysql-async" then
                MySQL.Async.fetchAll(checkQuery, {}, function(newResult)
                    if #newResult == 0 then
                        attemptAdd()
                    else
                        processingColumns[key] = nil
                        callback(false)
                    end
                end)
            end
        else
            if correctType then
                checkAndCorrectColumnType(tableName, column, correctType)
            end
            if correctCollation then
                checkAndCorrectCollation(tableName, column, correctCollation)
            end
            processingColumns[key] = nil
            callback(false)
        end
    end

    if Config.SQL == "oxmysql" then
        exports.oxmysql:execute(checkQuery, {}, callbackFunction)
    elseif Config.SQL == "ghmattimysql" then
        exports.ghmattimysql:execute(checkQuery, {}, callbackFunction)
    elseif Config.SQL == "mysql-async" then
        MySQL.Async.fetchAll(checkQuery, {}, callbackFunction)
    end
end

local function processAlterQueries(tableName, alterQueries, index, alterationsMade, finalCallback)
    index = index or 1
    alterationsMade = alterationsMade or false

    if index > #alterQueries then
        SQLChecker = true
        if finalCallback then finalCallback() end
        return
    end

    local queryInfo = alterQueries[index]
    checkAndAddColumn(tableName, queryInfo, function(alterationMade)
        if alterationMade then
            alterationsMade = true
        end
        Citizen.Wait(200)
        processAlterQueries(tableName, alterQueries, index + 1, alterationsMade, finalCallback)
    end)
end

Citizen.CreateThread(function()
    for tableName, createQuery in pairs(createTableQueries) do
        local function handleCallback(result)
            if result then
                local alterQueries = alterTableQueries[tableName]
                if alterQueries then
                    processAlterQueries(tableName, alterQueries, 1, false)
                else
                    SQLChecker = true
                end
            else
                SQLChecker = true
            end
        end

        if Config.SQL == "oxmysql" then
            exports.oxmysql:execute(createQuery, {}, handleCallback)
        elseif Config.SQL == "ghmattimysql" then
            exports.ghmattimysql:execute(createQuery, {}, handleCallback)
        elseif Config.SQL == "mysql-async" then
            MySQL.Async.execute(createQuery, {}, handleCallback)
        else
            SQLChecker = true
        end
    end
end)

function executeSQL(query, successMessage, failureMessage, callback)
    if Config.SQL == "oxmysql" then
        exports.oxmysql:execute(query, {}, function(result)
            if result then
                if callback then callback(true) end
            else
                if callback then callback(false) end
            end
        end)
    elseif Config.SQL == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(result)
            if result then
                if callback then callback(true) end
            else
                if callback then callback(false) end
            end
        end)
    elseif Config.SQL == "mysql-async" then
        MySQL.Async.execute(query, {}, function(result)
            if result then
                if callback then callback(true) end
            else
                if callback then callback(false) end
            end
        end)
    else
        if callback then callback(false) end
    end
end
