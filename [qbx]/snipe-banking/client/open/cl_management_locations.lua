CreateThread(function()
    for k, v in pairs(Config.ManagementLocations) do
        local point = lib.points.new({
            coords = v,
            distance = 2,
        })
        
        function point:onEnter()
            lib.showTextUI(Locales["manage_accounts_text"])
        end
        
        function point:onExit()
            lib.hideTextUI()
        end

        function point:nearby()
            if IsControlJustPressed(0, 38) then
                OpenManage()
            end
        end
    end
end)