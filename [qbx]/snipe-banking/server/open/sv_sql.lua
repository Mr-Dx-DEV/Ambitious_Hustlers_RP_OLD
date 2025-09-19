MySQL.ready(function()

    -- this will cleanup the banking_management table if the player has deleted their character
    -- the reason being you cannot search the history of these players if their character is deleted!

    if Config.Framework == "qb" then
        MySQL.Async.execute("DELETE FROM banking_management WHERE identifier NOT IN (SELECT citizenid FROM players)", {}, function() end)
    elseif Config.Framework == "esx" then
        MySQL.Async.execute("DELETE FROM banking_management WHERE identifier NOT IN (SELECT identifier FROM users)", {}, function() end)
    end
end)