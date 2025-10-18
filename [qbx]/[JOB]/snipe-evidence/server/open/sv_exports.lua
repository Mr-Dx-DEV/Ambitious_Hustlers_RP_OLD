local evidenceCompletelyCleared = false

local function RemoveAllEvidences()
    if evidenceCompletelyCleared then
        return
    end

    vehicleFragments = {}
    projectiles = {}
    bulletCasings = {}
    blood = {}
    fingerprints = {}
    vehicleEvidences = {}

    TriggerClientEvent('snipe-evidence:server:removeAllEvidences', -1)
    evidenceCompletelyCleared = true
    SetTimeout(30 * 60 * 1000, function()
        evidenceCompletelyCleared = false
    end)
end

exports('RemoveAllEvidences', RemoveAllEvidences)


-- Usage (look in command below)
local function GetPlayerFingerprintInformation(source)
    if not source then return false end

    local identifier = GetPlayerFrameworkIdentifier(source)
    
    if not identifier then return false end

    local result = MySQL.Sync.fetchAll(Queries["get_fingerprint_by_identifier"][Config.Framework], {
        ['@identifier'] = identifier
    })
    if next(result) then
        return result[1].name, result[1].fingerprint
    else
        return false
    end
end

exports('GetPlayerFingerprintInformation', GetPlayerFingerprintInformation)

-- Usage (look in command below)
local function GetPlayerInformationFromFingerprint(fingerprint)
    if not fingerprint then return false end

    local result = MySQL.Sync.fetchAll(Queries["check_fingerprint"][Config.Framework], {
        ['@fingerprint'] = fingerprint
    })

    if next(result) then
        return result[1].name
    else
        return false
    end
end
exports('GetPlayerInformationFromFingerprint', GetPlayerInformationFromFingerprint)


-- RegisterCommand("getfingerprint", function(source)
--     local name, fingerprint = exports["snipe-evidence"]:GetPlayerFingerprintInformation(source)
--     print("Name: " .. (name or "Unknown") .. ", Fingerprint: " .. (fingerprint or "No fingerprint found"))

--     local name = exports["snipe-evidence"]:GetPlayerInformationFromFingerprint(fingerprint)
--     print("Name from fingerprint: " .. (name or "No name found"))
-- end)