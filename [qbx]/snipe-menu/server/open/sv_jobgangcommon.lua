
RegisterServerEvent("snipe-menu:server:setjob", function(playerid, job, grade)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["set_job_used"]..GetPlayerName(playerid).." "..job.." "..grade)
        SetJobForPlayer(playerid, job, grade)
    else
        SendLogs(src, "exploit", Config.Locales["set_job_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:setGang", function(playerid, gang, grade)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["set_gang_used"]..GetPlayerName(playerid).." "..gang.." "..grade)
        SetGangForPlayer(playerid, gang, grade)
    else
        SendLogs(src, "exploit", Config.Locales["set_gang_exploit_event"])
    end
end)