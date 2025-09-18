Locales["en"] = {
    -- price note: this isnt the only place for this currency there are more in the locales that contians "$"
    ["currency"] = "$%s",

    ["not_enough_money_for_fuel"] = "There is no point of using it... I do not have enough money anyway.",

    -- shop
    ["shop_primary_title"] = "Vehicle gear shop",
    ["buy_item"] = "Buy item with",
    ["decline_buy"] = "Not interested",
    ["cant_carry_item"] = "You can't carry this item!",
    ["item_bought"] = "Item bought",

    -- taxi
    ["taxi_primary"] = "Taxi",
    ["taxi_second"] = "Do you need a driver?",

    ["accept_taxi"] = "Yes, I need a taxi!",
    ["decline_taxi"] = "I'll take a walk.",

    -- target
    ["target_pump_label"] = "Interaction with nozzle",
    ["target_pump_icon"] = "fas fa-gas-pump",
    ["target_pump_targeticon"] = "fas fa-gas-pump",

    ["target_pickup_barrel_label"] = "Interact with barrel",
    ["target_pickup_barrel_icon"] = "fas fa-tint",
    ["target_pickup_barrel_targeticon"] = "fas fa-tint",

    ["target_process_label"] = "Interact with pipe",
    ["target_process_icon"] = "fas fa-wrench",
    ["target_process_targeticon"] = "fas fa-wrench",

    ["target_store_label"] = "Store the barrel",
    ["target_store_icon"] = "fas fa-tint",
    ["target_store_targeticon"] = "fas fa-tint",

    -- player job
    ["did_not_pick_wrong_fuel"] = "This vehicle has the correct fuel. No action is needed!",
    ["select_vehicle"] = "Look at the vehicle until it glows and select it by pressing ~INPUT_ATTACK~ or exit the selector by pressing ~INPUT_FRONTEND_RRIGHT~",
    ["wrong_fuel_failure"] = "Hmm? What's that smell? Oh no... I pumped the wrong type of fuel into my vehicle... I need to get a Fuel Pumper or call a mechanic to pump out the fuel...",
    ["pumping_out"] = "Pumping out the fuel [💧]",
    ["there_is_generator"] = "There is already a generator placed!",

    -- company
    ["maximum_fuel_price"] = "The maximum price for this type of fuel can be: $%s!",

    ["company_price"] = "$%s",

    ["bought_property_title"] = "Property Bought!",
    ["bought_property_desc"] = "Gas station at %s",

    ["bought_property_title_no_money"] = "You don't have enough money",

    ["your_company_blip"] = "Your company",
    ["for_sale_company_blip"] = "Fuel station for sale",

    -- fuel pump notif
    ["vehicle_is_full"] = "This vehicle you're trying to refuel is full!",

    ["take_gun"] = "Press ~INPUT_PICKUP~ to grab the fuel nozzle",
    ["put_away_gun"] = "Press ~INPUT_PICKUP~ to put back the fuel nozzle",
    ["select_car"] = "Awesome! Now, just look at the car you want to refuel until it glows, then press ~INPUT_ATTACK~\nUse key ~INPUT_COVER~ to switch the fuel type!",
    ["wrong_fuel_type_car"] = "The vehicle you're attempting to refuel uses %s, while the dispenser at your location is for %s. Fueling with the wrong type of gas could damage the vehicle.",
    ["wrong_fuel_type_engine"] = "The vehicle cannot accept this this, it requires %s not %s",


    ["how_to_stop"] = "You can stop refueling the car by pressing ~INPUT_ATTACK~",
    ["pump_doesnt_have_any_fuel"] = "This pump does not have any fuel!",

    ["closed"] = "The gas station is closed",
    ["empty"] = "Out of", -- the result will be "out of gasoline" / "out of diesel" etc.
    ["cannot_refuel_from_jerrycan"] = "You cannot refuel this vehicle from jerrycan!",

    -- just for now if player is too far away it will show subtitle
    ["fueling_noscaleform"] = "Fuel: %0.f%% <br>Cost: %0.f$",

    -- buy company menu
    ["buy_company_main_title_menu"] = "For Sale!",
    ["buy_company_title_menu"] = "This company costs $%s",

    ["buy_company"] = "I want to buy it!",
    ["decline_buying_company"] = "I need some time to consider it.",

    ["money_management"] = "Money management",

    ["cant_buy_his_own"] = "You own this gas station. You cannot buy it!",

    -- money management menu
    ["money_management_title"] = "Company Money",
    ["money_management_second_title"] = "Funds: $%s",

    ["withdraw"] = "Withdraw money",
    ["deposit"] = "Deposit money",

    -- company menu
    ["not_enough_money_in_company"] = "Your company lack the funds to do this action!",
    ["player_lack_funds_deposit"] = "You do not have enough money to deposit this much!",

    ["final_payment"] = "Buying to the stock",
    ["final_payment_second_title"] = "It will cost: $%s | %s",

    ["select_payment_method"] = "Choose your payment method",

    ["fuel_prices"] = "Price per type of fuel",
    ["mission_task"] = "Fuel mission tasks",

    ["company_menu_primaty_title"] = "Company Menu",
    ["company_menu_title"] = "Your Company Menu",

    ["sell_company"] = "Put this company up for sale",
    ["open/close_shop"] = "Are we open?",

    ["price_fuel"] = "Set new price for fuel",
    ["refuel_tankers"] = "Call for refuel tankers",
    ["cancel_mission"] = "Cancel mission",

    ["mission"] = "Mission",
    ["cancel_mission_text"] = "Do you wish to cancel the mission?",
    ["mission_canceled_by_owner"] = "The mission was canceled by owner.",

    ["company_player_list"] = "Select the employee for this job",

    ["current_gas_price_input"] = "New price for gas: %s",

    ["previous_price_of_station"] = "This gas station's current price is: %s$",

    ["company_fuel_type_title"] = "Company Fuel",
    ["company_fuel_type_subtitle"] = "Select the fuel you wish to buy",

    ["gas_station_open"] = "The gas station is open for business",
    ["gas_station_close"] = "You closed the gas station",

    ["gas_station_selling"] = "You have put your business up for sale.",
    ["gas_station_selling_canceled"] = "You removed your business from the sale.",

    ["choose_how_much_fuel"] = "Select the amount you wish to buy",
    ["capacity_fuel_full"] = "You cannot buy more fuel for your company, your tanks are full!",

    ["employee_item"] = "Allow only employees to fuel?",

    ["employee_item_open"] = "Now only employees of this fuel station can refuel cars",
    ["employee_item_close"] = "Everyone can refuel their car now",

    ["must_find_employee"] = "This fuel station's policy requires an employee to fuel your vehicle. Please find one.",

    ["boss_action"] = "Boss actions",
    ["boss_menu"] = "Open boss menu",

    ["wrong_price"] = "The price of the company can be between only ~g~$%s ~w~and ~g~$%s!",
    -- fuel mission

    -- keep it mind there is a hard limit on how many chars the default GTA notification can display. I already had to shorten this to fit.
    ["tiptruck_area_not_clear"] = "Something blocking the area for the mission vehicle, please go clear it first! (marked on the map)",

    ["take_card"] = "Press ~INPUT_PICKUP~ to take a punch card",
    ["return_card"] = "Press ~INPUT_PICKUP~ to return the punch card",

    ["equip_clothes"] = "Press ~INPUT_PICKUP~ to wear your working outfit",
    ["back_to_civil_clothes"] = "Press ~INPUT_PICKUP~ to take back your civil clothes.",

    ["wrong_barrel"] = "This barrel is already filled, take it to your tip truck and store it there!",

    ["money_refunded"] = "The player who took your mission has canceled the contract. We have refunded %s$ amount back.",

    ["mission_canceled"] = "The mission has been canceled!",
    ["not_in_mission"] = "You're not in any mission!",
    ["mission_successfull"] = "The mission ended, you successfully refilled the fuel of that station!",

    ["call_taxi"] = "Press ~INPUT_PICKUP~ to call a taxi!",

    ["place_barrel"] = "Press ~INPUT_PICKUP~ to fill this barrel!",
    ["store_barrel"] = "Press ~INPUT_PICKUP~ to store this barrel!",
    ["missing_barrel"] = "You're missing a barrel! Go pick one up!",

    ["barrel_not_processed"] = "You cannot load this barrel into this truck! It was not processed yet!",
    ["barrel_wait"] = "It is not ready yet, please wait!",
    ["barrel_done"] = "The barrel is now ready you can pick it by by pressing ~INPUT_PICKUP~",
    ["barrel_done_interaction"] = "The barrel is now ready you can pick it up by using your eye target menu!",

    ["put_barrel_into_truck"] = "Put barrel into the truck by ~INPUT_PICKUP~ key",
    ["take_barrel_from_truck"] = "Take the barrel from tip truck by ~INPUT_PICKUP~ key",

    ["lacking_funds"] = "You or your company don't have enough money for refueling! You need ~g~$%s~w~!",

    ["processing_oil"] = "Preparing oil barrel [🛢️]",
    ["final_pumping"] = "Transferring fuel [🔋]️",

    ["3d_text_completed"] = "COMPLETED",

    ["fuel_mission_primary_title_menu"] = "Mission Job!",
    ["fuel_mission_title_menu"] = "Businessman: '%s' is asking you to bring fuel. Will you accept the task?",
    ["select_item"] = "Select item",

    ["entrance_oil_fac"] = "This is the entrance to the facility where you will process oil",
    ["equip_clothes_tut"] = "This is where you will equip your work clothes to work safely!",
    ["pick_up_oil_barrel"] = "Here you will pick up an empty oil barrel and fill it",
    ["fill_barrel_here"] = "Fill the barrel with oil here",
    ["then_take_the_barrel"] = "After filling the barrel, take it back to your truck and repeat as needed",

    ["pick_barrel"] = "Press ~INPUT_PICKUP~ to pick up",

    ["talk_to_npc"] = "Speak to this person about getting a phantom truck",

    ["all_barrel_pickup"] = "You collected all barrels. Proceed to the next point marked on your map!",
    ["all_barrel_stored"] = "You stored all barrels. Proceed to the next point marked on your map!",

    ["what_to_do_in_drop_out_barrels"] = "Pick up the barrels from your tiptruck and store them with the other barrels in this location",
    ["phantom_nozzle_info"] = "Press ~INPUT_PICKUP~ to attach/detach nozzle",

    ["drop_barrel_info"] = "Great, now bring this barrel to the pump! You can also drop this barrel by key ~INPUT_VEH_DUCK~ but you will lose the barrel forever!",

    ["press_to_speak_with_npc"] = "Press ~INPUT_PICKUP~ to speak with the NPC",
    ["go_store_phantom"] = "Awesome! Now just store this truck and you're finished!",

    ["fuel_bought_company"] = "You bought the fuel.",
    ["maximum_owned_companies"] = "You can own only up to ~r~[%s]~w~ fuel companies at same time!",
    -- other
    ["interact_key"] = "Press ~INPUT_PICKUP~ to interact",

    ["accept_task"] = "Accept task",
    ["decline_task"] = "Decline task",

    ["cash"] = "Cash",
    ["bank"] = "Bank",
    ["society"] = "Society",

    ["y"] = "Yes",
    ["n"] = "No",

    -- type fuel for check
    ["manual_guide"] = "Look at the vehicle you want to check the fuel type of, then press ~INPUT_ATTACK~",
    ["manual_reading"] = "Reading the manual...",


    -- UI translation ( The editor is not planned to added in locales )

    ["close_button"] = "Close",
    ["truck_hose_title"] = "How to Plug the Truck Hose to the Tap",

    ["truck_hose_part_1"] = "1. Go to the back of your truck on the right side, click \"E\" to pick up the truck hose.",
    ["truck_hose_part_2"] = "2. Plug it into the tap that is connected to the fuel tank.",
    ["truck_hose_part_3"] = "Wait until the progress reaches 100%%, and then simply reverse the steps.",

    -- fuel label names
    [FuelType.NATURAL] = "Gasoline",
    [FuelType.DIESEL] = "Diesel",
    [FuelType.EV] = "EV",
    [FuelType.LPG] = "LPG",
    [FuelType.CNG] = "CNG",
    [FuelType.MILK] = "Milk",
    [FuelType.AVIATION] = "Aviation fuel",

    [FuelType.NATURAL .. "_check"] = "This vehicle runs only on gasoline",
    [FuelType.DIESEL .. "_check"] = "This vehicle runs only on diesel",
    [FuelType.EV .. "_check"] = "This vehicle is electric",
    [FuelType.LPG .. "_check"] = "This vehicle runs only on LPG",
    [FuelType.CNG .. "_check"] = "This vehicle runs only on CNG",
    [FuelType.AVIATION .. "_check"] = "This vehicle runs only on aviation fuel",
    [FuelType.MILK .. "_check"] = "What... this vehicle runs on milk???",
}