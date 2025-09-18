if not Config.DisablePassiveIncome then
    function passiveIncome()
        for k, v in pairs(Config.ShopList) do
            local modal = GetCompanyModal(k)
            if modal.IsBuyingCompanyEnabled() and modal.IsOwned() and (hourlyIncome or hourlyIncome ~= 0) then
                for _, fuelType in pairs(modal.GetAllFuelTypes()) do
                    local fuelToRemove = math.floor(v.hourlyIncome / modal.GetPriceOfFuelType(fuelType)) / 60

                    if modal.IsTankerAboveCapacity(fuelType, fuelToRemove) then
                        modal.RemoveAmountForFuelCapacity(fuelType, fuelToRemove)

                        if modal.IsSocietyEnabled() then
                            GiveMoneyToSociety(v.hourlyIncome / 60, v.SocietyName or v.Job)
                        end

                        modal.AddCompanyStockMoney(v.hourlyIncome / 60)
                        break
                    end
                end
            end
        end
    end

    CreateThread(function()
        while true do
            Wait(60000)
            passiveIncome()
        end
    end)
end