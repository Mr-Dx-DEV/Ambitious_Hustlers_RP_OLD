function GetFuelLevel(vehicle)
    --standalone / ox_fuel
    if Config.FuelScript == 'ox_fuel' or Config.FuelScript == nil then 
        return GetVehicleFuelLevel(vehicle)

    --cdn fuel script
    elseif Config.FuelScript == 'cdn-fuel' then 
        return exports['cdn-fuel']:GetFuel(vehicle) 

    --legacy fuel script
    elseif Config.FuelScript == 'legacy-fuel' then
        return DecorGetFloat(vehicle, '_FUEL_LEVEL') 
    
    elseif Config.FuelScript == 'other' then
        -- If you are using any other fuel script, just add the code that gets the fuel amount right here
        -- Make sure the fuel amount is RETURNED as a number between 0 and 100 
    end
end

-- If you want to add any restrictions/conditions for opening the vehicle menu, you can add them here
-- By defualt, the player cannot open the menu if in handcuffs. Open a ticket in our discord, 
-- if for whatever reason, you want handcuffed players to use the menu
function openCCAfterCheck()
    openCC() -- This will actually open the menu, so add your conditions before this
end



