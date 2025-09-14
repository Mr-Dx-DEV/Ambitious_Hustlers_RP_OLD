Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/9pCDHmjYwd

-------------------------------------------------------------------------------------------------

# QBCore Installation

-------------------------------------------------------------------------------------------------

# Dependencies

 - Jim_Bridge - https://github.com/jimathy/jim_bridge
   - This script is a requirement of jim-mechanic to function and bridge it between frameworks
 - Jim-Payments - https://github.com/jimathy/jim-payments [OPTIONAL]
   - This script is designed for charging customs and sending money to the society accounts
 - Jim-JobGarage - https://github.com/jimathy/jim-jobgarage [OPTIONAL]
   - This script is for creating temporary vehicles for job roles

-------------------------------------------------------------------------------------------------

# Documentation: (This will always be most up to date and informative)

https://jixelpatterns.gitbook.io/docs/

-------------------------------------------------------------------------------------------------

Full Credit to wildbrick142 for the inclusion of the Chameleon Paints Mod

# INSTALLATION

## Ensure List
GO TO YOUR `server.cfg`

# Core & Extra stuff
ensure qb-core
ensure [qb]
ensure [standalone] -- Place `jim_bridge` here
ensure [voice]
ensure [defaultmaps]
ensure [vehicles]

# Extra Jim Stuff
ensure [jimextras]  -- Palce `jim-consumables / jim-jobgarage / jim-djbooth` here
ensure [jim] -- Place all other jim scripts here
# Extra Other Scripts Here

---
# Item installation
- There are two image folders, `images_alt` contains tiered images with their rank included

- Add the chosen images to your inventory folder eg. `qb-inventory > html > images`

- If using `ox_inventory` add the `ox_items.txt` to your `ox_inventory > data > items.lua`

- If using `qb-inventory` or similar, add the lines from `qb_items.txt` to your `qb-core > shared > items.lua`

# Conflicting Scripts

- It is highly recommended to remove this script from [qb] to stop double events happening or conflicts
- `qb-mechanicjob`

-------------------------------------------------------------------------------------------------

## NOS + Odometer
There are expanded features included in this scripts with SQL

The script will auto inject the sql data into the correct place, if it doesn't import it manually.

The `hasnitro` and `noslevel` columns being added enables the of saving Nitrous levels through server restarts

The `traveldistance` column adds an Odometer to the toolbox/mechanic_tools menus, this this can retrieved in miles or kilometers.

-------------------------------------------------------------------------------------------------

# Extra Damages and Upgrades

**As of v3.0 you no longer need `qb-mechanicjob` to use any of this script**
**As of v3.2 you no longer need `qb-vehcilefailure` as several features are now built in**

Extra Damages and their upgrades can be enabled/disabled in the config with `Config.Repairs.ExtraDamages = true`

The extra damages added by this script are shown as `Oil Level`, `Axle Shaft`, `Spark Plugs`, `Car Battery`and `Fuel Tank`.

These are repaired with the items (through the mechanic_tools repair item)
`newoil` - Fixes `Oil Level`
`sparkplugs` - Fixes `Spark Plugs`
`carbattery` - Fixes `Car Battery`
`axleparts` - Fixes `Axle Shaft`
`steel` - Fixes `Fuel Tank`
These are changeable through the config.

These effects are shown when they are damaged by driving
`Oil Level` damage will "Overheat" the vehicle and slowly damage the engine
`Axle Shaft` damage will affect the steering of the vehicle
`Spark Plugs` damage will make the vehicle stall
`Car Battery` damage will make the vehicle stall
`Fuel Tank` damage will cause fuel to drain faster

-------------------------------------------------------------------------------------------------

# Harness Item

The script can take control of the already in place `harness` item

This can be enabled or disabled in the config with `Config.Harness.HarnessControl == true`

If you enable this, there are a few steps you need to take as this is handled in `jim-mechanic`.

1. Delete the file `seatbelt.lua` from `qb-smallresources > client`
2. **REMOVE** these 3 events from `qb-smallresources > server > main.lua`:

```lua
QBCore.Functions.CreateUseableItem('harness', function(source, item)
    TriggerClientEvent('seatbelt:client:UseHarness', source, item)
end)

RegisterNetEvent('equip:harness', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not Player.PlayerData.items[item.slot].info.uses then
        Player.PlayerData.items[item.slot].info.uses = Config.HarnessUses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    elseif Player.PlayerData.items[item.slot].info.uses == 1 then
        exports['qb-inventory']:RemoveItem(src, 'harness', 1, false, 'equip:harness')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['harness'], 'remove')
    else
        Player.PlayerData.items[item.slot].info.uses -= 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if hp == 0 then
        exports['qb-inventory']:RemoveItem(src, 'harness', 1, data.slot, 'seatbelt:DoHarnessDamage')
    else
        Player.PlayerData.items[data.slot].info.uses -= 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)
```

To make your hud not complain about the harness export you will need to change the name of the export to jim-mechanic
--PS-HUD--
`ps-hud` > `client.lua` > line 80
REPLACE:
```lua
    local hasHarness = exports['qb-smallresources']:HasHarness()
```
WITH:
```lua
    local hasHarness = exports['jim-mechanic']:HasHarness()
```

--QB-HUD--
REPLACE:
```lua
local function hasHarness(items)
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then return end

    local _harness = false
    if items then
        for _, v in pairs(items) do
            if v.name == 'harness' then
                _harness = true
            end
        end
    end

    harness = _harness
end
```
WITH:
```lua
local function hasHarness(items) harness = exports["jim-mechanic"]:HasHarness() end
```
in [qb] > qb-hud > html > index.html remove:

```html
<div class="responsive" id="speedometer">
    <q-circular-progress id="Speedo" class="q-ml-xl" style="transform: rotate(-150deg); opacity: 60%;" :value="speedometer" :thickness="0.21" color="gauge" :min="0" :max="100"></q-circular-progress>
    <q-circular-progress id="Speedo" class="q-ml-xl" style="transform: rotate(-150deg); left: -50%;" show-value :value="speed" :thickness="0.21" color="gauge" :min="0" :max="600">
    <speed id="Speed">{{(speed)}}</speed>
</div>
<div class="responsive" id="fuelgauge">
    <q-circular-progress id="FuelGaugeBackground" class="q-ml-xl" style="transform: rotate(-125deg); opacity: 60%;" :value="fuelgauge" :thickness="0.21" color="gauge" :min="0" :max="100"></q-circular-progress>
    <q-circular-progress id="FuelGaugeValue" class="q-ml-xl" style="transform: rotate(-125deg); left: -50%;" show-value :value="fuel" :thickness="0.21" :style="{color: fuelColor}">
    <q-icon id="FuelGaugeIcon" name="fas fa-gas-pump" style="transform: rotate(125deg);" color="white"/>
</div>
<div class="responsive" id="altitudegauge" v-if="showAltitude">
    <q-circular-progress id="Altimeter" class="q-ml-xl" style="transform: rotate(-135deg); opacity: 60%;" :value="altitudegauge" size="70px" :thickness="0.21" color="gauge" :min="0" :max="100"></q-circular-progress>
    <q-circular-progress id="AltimeterValue" class="q-ml-xl" style="transform: rotate(-135deg); left: -50%;" show-value :value="altitude" size="70px" :thickness="0.21" color="gauge" :min="0" :max="750">
    <altitude id="Alt">{{(altitude)}}</altitude>
</div>
<transition name="fade">
<div class="responsive" id="seatbelt" v-if="showSeatbelt">
    <q-circular-progress id="SeatbeltLocation" class="q-ml-xl" style="transform: rotate(-125deg); opacity: 60%;" size="70px" :thickness="0.21" color="gauge" :min="0" :max="100"></q-circular-progress>
    <q-circular-progress id="SeatbeltLocation" class="q-ml-xl" style="transform: rotate(-125deg); left: -40%;" show-value size="70px" :thickness="0.21" color="gauge" :min="0" :max="750">
    <q-icon id="SeatbeltIcon" name="fas fa-user-slash" style="transform: rotate(125deg);" :value="seatbelt" size="21px" :style="{color: seatbeltColor}"/>
</div>
```


## QB-RADIAL
Search for:
```lua
    local HasHarnass = exports['qb-smallresources']:HasHarness()
```
and replace with:
```lua
    local HasHarnass = exports['jim-mechanic']:HasHarness()
```

-------------------------------------------------------------------------------------------------

## "mechboard" item

**This isn't fully required but helps organise multiples of the "mechboard"**

The MechBoard item is an item given to the person who uses the preview menu and makes changes

To make full use of this item you need to add the ability for the item to show item info in your inventory system

- Before 2023 QB/PS/LJ Inventory
`qb-inventory/html/js/app.js`

- Search for "harness" or Scroll down until you find:
```js
} else if (itemData.name == "harness") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.uses + " uses left.</p>"
    );
```
- Directly underneath this add:
```js
} else if (itemData.name == "mechboard") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.vehplate + "</p>" +
        "<p>" + itemData.info.veh + "</p>"
    );
```

- 2023-2024 QB/PS/LJ Inventory (Don't need to do this with 2025 qb-inv)
- Search for "harness" or Scroll down until you find:
```js
case "harness":
    return `<p>${itemData.info.uses} uses left</p>`;
```
- Directly underneath this add:
```js
case "mechboard":
    return `<p>${itemData.info.vehplate}</p>
    <p>${itemData.info.veh}</p>`;
```

When successfully added the mechboards will show the vehicle and plate number

-------------------------------------------------------------------------------------------------


## Updating core events

If using `ox_lib`:
- Replace the `getVehicleProperties` and `setVehicleProperties` in `ox_lib > resource > vehicleProperties > client.lua` with the ones from `properties_ox.lua`

If using just `qb-core`:
- Replace the `QBCore.Functions.GetVehicleProperties` and `QBCore.Functions.SetVehicleProperties` in `qb-core > client > functions.lua` with the ones from `properties_qb.lua`
```