-- ████████╗ █████╗ ██╗  ██╗███████╗███████╗
-- ╚══██╔══╝██╔══██╗╚██╗██╔╝██╔════╝██╔════╝
--    ██║   ███████║ ╚███╔╝ █████╗  ███████╗
--    ██║   ██╔══██║ ██╔██╗ ██╔══╝  ╚════██║
--    ██║   ██║  ██║██╔╝ ██╗███████╗███████║
--    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝
---@field UseTaxes boolean: 
Config.UseTaxes = true

---@class Taxes: 
Config.Taxes = {
    ['gains'] = { -- Private taxes
        vehicleexcise = 7, -- Buying a car from another player (by agreement)
    },

    ['tuning'] = 5, --  Business tax (vms_tuning v2.0.6+)
    
    ['vehicles'] = { -- Business tax (vms_vehicleshopV2 v1.0.4+)
        mechanical = 18,
        electric = 9,
        bikes = 5,
    },

    ['products'] = { -- Business tax (vms_stores v1.0.7+)
        electronics = 21,
        alcohol = 23,
        food = 33,
        drinks = 30,
        other = 23,
        fuel = 20,
    },

    ['tattoos'] = 18, -- Business tax (vms_tattooshop v2.0.0+)
    ['barber'] = 12, -- Business tax (vms_barber v2.0.0+)
    ['gym'] = { -- Business taxes (vms_gym v2.0.0+)
        memberships = 8,
        proteins = 10
    }
}

---@field TaxesToSocietyCityhall boolean: 
Config.TaxesToSocietyCityhall = true

---@field PercentTaxesToSocietyCityhall boolean: 
Config.PercentTaxesToSocietyCityhall = 90


------ █▀▄ █▀▄ █ █ █ ▄▀▄ ▀█▀ ██▀   ▀█▀ ▄▀▄ ▀▄▀ ██▀ ▄▀▀
------ █▀  █▀▄ █ ▀▄▀ █▀█  █  █▄▄    █  █▀█ █ █ █▄▄ ▄██
---@field ShowCanceledTaxes boolean: 
Config.ShowCanceledTaxes = false

---@field ShowPaidTaxes boolean: 
Config.ShowPaidTaxes = false

---@field TaxPaymentMaxDays number: 
Config.TaxPaymentMaxDays = 14

---@field TaxOverduePaymentPercent number: Percentage calculated for each day of delay for tax payment, for example when you set 2, then after 10 days it will be 20% of the tax amount
Config.TaxOverduePaymentPercent = 2



------ ██▄ █ █ ▄▀▀ █ █▄ █ ██▀ ▄▀▀ ▄▀▀   ▀█▀ ▄▀▄ ▀▄▀ ██▀ ▄▀▀
------ █▄█ ▀▄█ ▄██ █ █ ▀█ █▄▄ ▄██ ▄██    █  █▀█ █ █ █▄▄ ▄██
---@field UseBusinessTaxes boolean: 
Config.UseBusinessTaxes = true

---@class TaxBusinessAccounts 
Config.TaxBusinessAccounts = {
    -- ['police'] = "LSPD",
    -- ['ambulance'] = "EMS",

    --- vms_barber
    ['barber1'] = "Barber Shop [1]",
    ['barber2'] = "Barber Shop [2]",
    ['barber3'] = "Barber Shop [3]",
    ['barber4'] = "Barber Shop [4]",
    ['barber5'] = "Barber Shop [5]",
    ['barber6'] = "Barber Shop [6]",
    ['barber7'] = "Barber Shop [7]",

    --- vms_tattooshop
    ['tattoo1'] = "Tattoo Shop [1]",
    ['tattoo2'] = "Tattoo Shop [2]",
    ['tattoo3'] = "Tattoo Shop [3]",
    ['tattoo4'] = "Tattoo Shop [4]",
    ['tattoo5'] = "Tattoo Shop [5]",
    ['tattoo6'] = "Tattoo Shop [6]",

    --- vms_gym
    ['gym1'] = "Gym Plaza",
    ['gym2'] = "Gym Pump & Run",

    --- vms_tuning
    ['mechanic'] = "BennyS",

    --- vms_vehicleshopv2
    ['pdm'] = "Premium Deluxe Motorsports",

    --- vms_stores
    ['ltd1'] = "LTD Gasoline [1]",
    ['ltd2'] = "LTD Gasoline [2]",
    ['ltd3'] = "LTD Gasoline [3]",
    ['ltd4'] = "LTD Gasoline [4]",
    ['ltd5'] = "LTD Gasoline [5]",
    ['robsliquor1'] = "Rob's Liquor [1]",
    ['robsliquor2'] = "Rob's Liquor [2]",
    ['robsliquor3'] = "Rob's Liquor [3]",
    ['robsliquor4'] = "Rob's Liquor [4]",
    ['twentyfourseven1'] = "Twenty Four Seven [1]",
    ['twentyfourseven2'] = "Twenty Four Seven [2]",
    ['twentyfourseven3'] = "Twenty Four Seven [3]",
    ['twentyfourseven4'] = "Twenty Four Seven [4]",
    ['twentyfourseven5'] = "Twenty Four Seven [5]",
    ['twentyfourseven6'] = "Twenty Four Seven [6]",
    ['twentyfourseven7'] = "Twenty Four Seven [7]",
    ['twentyfourseven8'] = "Twenty Four Seven [8]",
    ['twentyfourseven9'] = "Twenty Four Seven [9]",
}


---@field TaxBusinessAllowMakeDelayedDeclarations boolean: asdasd
--[[
    The player will have the opportunity to pay outstanding taxes, for example, when we are now September (09.2024), and you have not paid for, for example, June and July,
    by setting true, you will still have the opportunity to make a declaration, by setting false, then the player can no longer pay the outstanding months.
]]
Config.TaxBusinessAllowMakeDelayedDeclarations = true


---@field TaxBusinessPercentagePerMonthForDelay number: 
--[[
    For each month of delay, an additional payment is required, for example, setting it at 15%.
    If it is now September (09.2024), and your company earned $5,000 in August (08.2024), you have $5,000 to pay because you're paying for the previous tax month.
    However, if you didn’t pay for July (07.2024), and your company earned $5,000 then, you owe $5,000 + 15%, which equals $5,750 for one month of delayed payment.
    If it's already two months of delay, for example, for June (06.2024), and your company also earned $5,000, then it's $5,000 + 30%, meaning you now owe $6,500.
]]
Config.TaxBusinessPercentagePerMonthForDelay = 20


---@field AutoTaxCollectionAfterMonths number or false: 
--[[ 
    Automatically collects tax from the company account after a specified number of months of delay (X months).
    If the company hasn't paid taxes for X months, the function automatically deducts the overdue amount from the company account,
    adding any late payment interest according to the specified rules.

    nil = never collect automatically
    1 = The month preceding the current one
    2 = Two months earlier
]]
Config.AutoTaxCollectionAfterMonths = 3





exports('TaxBusinessAllowMakeDelayedDeclarations', function()
    return Config.TaxBusinessAllowMakeDelayedDeclarations
end)

exports('TaxBusinessPercentagePerMonthForDelay', function()
    return Config.TaxBusinessPercentagePerMonthForDelay
end)