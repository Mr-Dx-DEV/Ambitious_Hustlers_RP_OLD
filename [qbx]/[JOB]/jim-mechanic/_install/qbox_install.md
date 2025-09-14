Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/9pCDHmjYwd

-------------------------------------------------------------------------------------------------

# QBOX Installation

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

# Qbox & Extra stuff
ensure ox_lib
ensure qbx_core
ensure ox_target
ensure [ox]
ensure [qbx]
ensure [standalone]  # Place `jim_bridge` here
ensure [voice]

ensure [npwd-apps]
ensure qbx_npwd
ensure npwd

# Extra Jim Stuff
ensure [jimextras]  # Place `jim-consumables / jim-jobgarage / jim-djbooth` here
ensure [jim]

---
# Item installation

- There are two image folders, `images_alt` contains tiered images with their rank included

- Add the chosen images to your inventory folder eg. `ox_inventory > web > images`

- Add the lines from `ox_items.lua` to your `ox_inventory > data > items.lua`

# Conflicting Scripts

- It is highly recommended to remove these scripts from QBOX to stop double events happening or conflicts
- `qbx_mechanicjob`
- `qbx_seatbelt` -- if you want to use jim-mechanics seatbelt system
- `vehiclehandler`

-------------------------------------------------------------------------------------------------

## NOS + Odometer
There are expanded features included in this scripts with SQL

The script will auto inject the sql data into the correct place, if it doesn't import it manually.

For the script to function you need to import the `vehaddon.sql` file into your `player_vehicles` database to add the appropriate columns (traveldistance, hasnitro, noslevel)

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

# Harness Item

The script can take control of the already in place `harness` item

This can be enabled or disabled in the config with `Config.Harness.HarnessControl == true`

If you enable this, there are a few steps you need to take as this is handled in `jim-mechanic`.

1. Delete the file `qbx_seatbelt`

2. In [qbx] > qbx_hud > html > index.html (around line 311 remove this:

```html
  <div class="responsive" id="speedometer">
      <q-circular-progress class="q-ml-xl" style="transform: rotate(-150deg); opacity: 60%;" :value="speedometer" size="70px" :thickness="0.21" color="gauge" :min="0" :max="100"></q-circular-progress>
      <q-circular-progress class="q-ml-xl" style="transform: rotate(-150deg); left: -50%;" show-value :value="speed" size="70px" :thickness="0.21" color="gauge" :min="0" :max="600">
      <speed>{{(speed)}}</speed>
  </div>
  <div class="responsive" id="fuelgauge">
      <q-circular-progress class="q-ml-xl" style="transform: rotate(-125deg); opacity: 60%;" :value="fuelgauge" size="36px" :thickness="0.21" color="gauge" :min="0" :max="100"></q-circular-progress>
      <q-circular-progress class="q-ml-xl" style="transform: rotate(-125deg); left: -50%;" show-value :value="fuel" size="36px" :thickness="0.21" :style="{color: fuelColor}">
      <q-icon name="fas fa-gas-pump" style="transform: rotate(125deg);" size="14px" color="white"/>
  </div>
  <div class="responsive" id="altitudegauge" v-if="showAltitude">
      <q-circular-progress class="q-ml-xl" style="transform: rotate(-135deg); opacity: 60%;" :value="altitudegauge" size="70px" :thickness="0.21" color="gauge" :min="0" :max="100"></q-circular-progress>
      <q-circular-progress class="q-ml-xl" style="transform: rotate(-135deg); left: -50%;" show-value :value="altitude" size="70px" :thickness="0.21" color="gauge" :min="0" :max="750">
      <altitude>{{(altitude)}}</altitude>
  </div>
  <transition name="fade">
  <div class="responsive" id="seatbelt" v-if="showSeatbelt">
      <q-circular-progress class="q-ml-xl" style="transform: rotate(-125deg); opacity: 60%;" size="70px" :thickness="0.21" color="gauge" :min="0" :max="100"></q-circular-progress>
      <q-circular-progress class="q-ml-xl" style="transform: rotate(-125deg); left: -40%;" show-value size="70px" :thickness="0.21" color="gauge" :min="0" :max="750">
      <q-icon name="fas fa-user-slash" style="transform: rotate(125deg);" :value="seatbelt" size="21px" :style="{color: seatbeltColor}"/>
  </div>
  </transition>
```

-------------------------------------------------------------------------------------------------

# Updating core events

If using `ox_lib`:
- Replace the `getVehicleProperties` and `setVehicleProperties` in `ox_lib > resource > vehicleProperties > client.lua` with the ones from `properties_ox.lua`