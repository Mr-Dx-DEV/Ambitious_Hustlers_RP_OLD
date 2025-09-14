Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/9pCDHmjYwd

-------------------------------------------------------------------------------------------------

# ESX Installation

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

# Default & Standalone Resources
# ------------------------------
ensure chat
ensure hardcap
ensure oxmysql
start ox_lib
# ESX Legacy Core
# ----------
ensure [core]
ensure [esx_addons]
start ox_inventory
start ox_target

# ESX Addons
ensure [standalone]  # Place `jim_bridge` here
ensure [jimextras]  # Place `jim-consumables / jim-jobgarage / jim-djbooth` here
ensure [jim]

---
# Item installation

- There are two image folders, `images_alt` contains tiered images with their rank included

- Add the chosen images to your inventory folder eg. `ox_inventory > web > images`

- Add the lines from `ox_items.lua` to your `ox_inventory > data > items.lua`

-------------------------------------------------------------------------------------------------

## NOS + Odometer
There are expanded features included in this scripts with SQL

The script will auto inject the sql data into the correct place, if it doesn't import it manually.

The `hasnitro` and `noslevel` columns being added enables the of saving Nitrous levels through server restarts

The `traveldistance` column adds an Odometer to the toolbox/mechanic_tools menus, this this can retrieved in miles or kilometers.

-------------------------------------------------------------------------------------------------

# Extra Damages and Upgrades

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

# Updating core events

If using `ox_lib`:
- Replace the `getVehicleProperties` and `setVehicleProperties` in `ox_lib > resource > vehicleProperties > client.lua` with the ones from `properties_ox.lua`