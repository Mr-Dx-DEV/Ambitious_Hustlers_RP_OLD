CreateThread(function()
    if Config.Dispatches == Dispatches.KARTIK then
        RegisterNetEvent('rcore_prison:client:setDispatch', function(payload)
            if source == '' then return end

            if not payload then
                return
            end

            if not doesExportExistInResource(Dispatches.KARTIK, 'CustomAlert') then
                dbg.critical('Kartik - dispatch module failed since CustomAlert doesnt exist!')
                return 
            end

            exports['kartik-mdt']:CustomAlert(payload)
        end)
    end
end)
