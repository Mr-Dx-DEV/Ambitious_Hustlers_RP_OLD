FuelCompanyKeysToLoad = {
    "price", "open", "for_sale", "capacity", "owner_identifier", "fuel_only_employee", "companyMoney",
}

local previousData = {}

function clamp(value, min, max)
    return math.min(math.max(value, min), max)
end

function GetCompanyModal(identifier)
    local self = {}

    self.DoesExists = function()
        return Config.ShopList[identifier] ~= nil
    end

    self.IsForEmployeeOnly = function()
        return Config.ShopList[identifier].fuel_only_employee
    end

    self.SetForEmployeeOnlyStatus = function(result)
        Config.ShopList[identifier].fuel_only_employee = result
    end

    self.SetForSale = function(result)
        Config.ShopList[identifier].for_sale = result
    end

    self.IsOpen = function()
        return Config.ShopList[identifier].open
    end

    self.SetOpenStatus = function(status)
        Config.ShopList[identifier].open = status
    end

    self.IsForSale = function()
        return Config.ShopList[identifier].for_sale
    end

    self.GetCompanyPrice = function()
        return Config.ShopList[identifier].price
    end

    self.SetCompanyPrice = function(value)
        Config.ShopList[identifier].price = value
    end

    ----------------------------------------------------------------
    self.SetCompanyStockMoney = function(money)
        Config.ShopList[identifier].companyMoney = money
    end

    self.GetCompanyStockMoney = function()
        return Config.ShopList[identifier].companyMoney or 0
    end

    self.RemoveCompanyStockMoney = function(value)
        self.SetCompanyStockMoney(self.GetCompanyStockMoney() - value)
    end

    self.AddCompanyStockMoney = function(value)
        self.SetCompanyStockMoney(self.GetCompanyStockMoney() + value)
    end
    ----------------------------------------------------------------
    self.GetAllFuelTypes = function()
        local fuelList = {}

        for k, v in pairs(Config.ShopList[identifier].maxCapacity) do
            table.insert(fuelList, k)
        end

        return fuelList
    end

    self.GetPriceOfFuelType = function(type)
        return Config.ShopList[identifier].gasPrices[type]
    end

    self.SetPriceOfFuelType = function(type, price)
        Config.ShopList[identifier].gasPrices[type] = price
    end

    self.GetMaximumFuelCapacity = function(fuelType)
        return Config.ShopList[identifier].maxCapacity[fuelType]
    end

    self.GetCurrentFuelCapacity = function(fuelType)
        return Config.ShopList[identifier].capacity[fuelType]
    end

    self.SetCurrentFuelCapacity = function(fuelType, value)
        Config.ShopList[identifier].capacity[fuelType] = value
    end

    self.RemoveAmountForFuelCapacity = function(fuelType, value)
        self.SetCurrentFuelCapacity(fuelType, clamp(self.GetCurrentFuelCapacity(fuelType) - value, 0.0, self.GetMaximumFuelCapacity(fuelType)))
    end

    self.AddAmountForFuelCapacity = function(fuelType, value)
        self.SetCurrentFuelCapacity(fuelType, clamp(self.GetCurrentFuelCapacity(fuelType) + value, 0.0, self.GetMaximumFuelCapacity(fuelType)))
    end

    self.IsTankerOutOfGas = function(fuelType)
        return self.GetCurrentFuelCapacity(fuelType) < 1
    end

    self.IsTankerAboveCapacity = function(fuelType, minimumFuel)
        return self.GetCurrentFuelCapacity(fuelType) > minimumFuel
    end
    ----------------------------------------------------------------

    self.IsBuyingCompanyEnabled = function()
        return Config.ShopList[identifier].EnableBuyingCompany
    end

    self.IsSocietyEnabled = function()
        return Config.ShopList[identifier].EnableSociety
    end

    self.IsOwned = function()
        return Config.ShopList[identifier].owner_identifier ~= "none"
    end

    self.SetOwnerIdentifier = function(owner_identifier)
        Config.ShopList[identifier].owner_identifier = owner_identifier
    end

    self.GetOwnerIdentifier = function()
        return Config.ShopList[identifier].owner_identifier
    end

    self.IsSourceOwner = function(source)
        local shopData = Config.ShopList[identifier]
        local playerIdentifier = SharedObject.GetPlayerFromId(source).identifier

        if shopData.EnableSociety then
            return IsPlayerBossGrade(source, shopData.Job) or playerIdentifier == (Config.ShopList[identifier].owner_identifier or "none")
        end
        return playerIdentifier == (Config.ShopList[identifier].owner_identifier or "none")
    end

    self.Load = function(loadedData)
        local shopData = Config.ShopList[identifier]
        local data = { }

        for v, vals in pairs(FuelCompanyKeysToLoad) do
            local loadedValue = loadedData[vals]
            if loadedValue == nil then
                loadedValue = 0
            end

            if type(loadedValue) == "table" then
                for key, val in pairs(shopData[vals]) do
                    if not loadedValue[key] then
                        loadedValue[key] = val
                    end
                end
            end

            Config.ShopList[identifier][vals] = loadedValue
            data[v] = shopData[v]
        end

        for fuelIdenf, fuelPrice in pairs(shopData.gasPrices) do
            if not shopData.EnableBuyingCompany then
                shopData.gasPrices[fuelIdenf] = fuelPrice
                data[fuelIdenf] = v
            else
                shopData.gasPrices[fuelIdenf] = loadedData[tostring(fuelIdenf)] or fuelPrice
                data[fuelIdenf] = v
            end
        end

        previousData[identifier] = data

    end

    self.Save = function(insert, forceSave)
        if insert then
            if type(insert) == "string" then
                insert = nil
                forceSave = true
            end
        end

        local shopData = Config.ShopList[identifier]
        local data = { }

        if insert then
            Config.ShopList[identifier].capacity = Config.ShopList[identifier].maxCapacity
            self.SetForEmployeeOnlyStatus(self.IsForEmployeeOnly())
        end

        for k, v in pairs(FuelCompanyKeysToLoad) do
            local loadedValue = shopData[v]
            if loadedValue == nil then
                loadedValue = 0
            end
            data[v] = loadedValue
        end

        for k, v in pairs(shopData.gasPrices) do
            data[k] = v
        end

        data.owner_identifier = nil
        if insert then
            MySQL.Async.execute("INSERT INTO rcore_fuelshop (shop_identifier, owner_identifier, data) VALUES (@shop_identifier, @owner_identifier, @data)", {
                ['@shop_identifier'] = identifier,
                ["@owner_identifier"] = "none",
                ["@data"] = json.encode(data),
            })

            previousData[identifier] = data
        else
            local update = false

            for k, v in pairs(data) do
                if previousData[identifier][k] ~= v then
                    update = true
                end
            end

            if update then
                MySQL.Sync.execute("UPDATE `rcore_fuelshop` SET data = @data, owner_identifier = @owner_identifier WHERE shop_identifier = @shop_identifier", {
                    ['@shop_identifier'] = identifier,
                    ["@owner_identifier"] = self.GetOwnerIdentifier(),
                    ["@data"] = json.encode(data),
                })

                previousData[identifier] = data
            end
        end
    end

    self.RefreshData = function()
        UpdateConfigForClient(-1, identifier)
    end

    return self
end

exports("GetCompanyModal", GetCompanyModal)