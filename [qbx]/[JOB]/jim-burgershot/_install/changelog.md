Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/9pCDHmjYwd

-------------------------------------------------------------------------------------------------

# Changelog

## 3.0.12

- Tidy up and add to all location files
- Use new `jim_bridge` createPropTarget() function
- Adjust auto minZ and maxZ generation
- Support embedded shop recipes
- Support `jim_bridge` alcohol syncing export for built in consume
  - Alcohol consumtion should now be synced between my scripts
- Fix pack items not giving items
- Fix Trash Stashes not being created
- Allow "Bag" items to have custom slots and weight (itemcontrol.lua)
- Fixes for upcoming new features soon

Files to replace:

- locations/burgershot_rz.lua
- locations/burgershot_uniqx.lua
- locations/burgershot_gabz.lua
- locations/burgershot_gnmods.lua
- locations/burgershot_gnmodsmirror.lua
- locations/burgershot_np.lua
- locations/burgershot_smallo.lua
- locales/en.lua
- client/client.lua
- client/encclient.lua
- client/functions.lua
- server/encserver.lua
- server/itemcontrol.lua

## 3.0.11

- Support stress in built-in consume event
- Fix registering personal stashes if tied to a prop
- Start working on future features

Files to replace:
- client/client.lua
- client/functions.lua
- server/itemcontrol.lua
- server/encserver.lua

## 3.0.10

- Fix built-in comsume event not working with ox_inv
- Add SingleProgress config option for crafting (place items + one big progressbar)

Files to replace:
  - client/functions.lua
  - server/itemcontrol.lua
  - config.lua (optional)


## 3.0.09

- Overhaul script secuity
  - Moved as much code as possible to server to reduce chance of exploits
- Use new jim_bridge openClothing() function
- Update to jim_bridge 2.1.0+

Files to replace:
  - client/encclient.lua
  - client/functions.lua
  - server/encserver.lua
  - server/itemcontrol.lua

## 3.0.08

- Fix cabinet location for kingmaps mlo
- Make use of jim_bridge's new shop exploit protection
- Use jim_bridge's `getItemLabel()` function more

Files to replace:
- client/functions.lua
- server/encserver.lua

## 3.0.07

- Add new location - KingMaps Burgershot (burgershot_kingmaps.lua)
  - All tables, chairs and toilets are all usable
- Remove thread that was stopping built in prop emotes from working

Files to replace:

- client/functions.lua
- locations/burgershot_kingmaps.lua

## 3.0.06

- Full support for Lation_UI
- State in config that okok billing is an option
- Fix anim flag logic for built in consume event
- Update discord links and add gitbook link info

Files to replace:

- client/functions.lua
- config.lua
- _install/

## 3.0.05

- Add support for jim-blipcontroller
	- New config options
- Add support for jim-imagedisplay
- Change built in `jim-payments` trigger to `jim_bridge` `billPlayer()` function
	- This includes a new config option, if not set it will default to `jim-payments`
- Change built in "qb-bossmenu" trigger event to `jim_bridge` `openBossMenu()`
	- This detects what bossmenu you have started

## 3.0.04

- Added `StashCraft` information to install.md's
	- Crafting from a stash is possible with this script, its just disabled by default
	- Each location comes with a commented out variable `StashCraft = `
	- Uncommenting this will select the stash id as the crafting stash
- Fix consumable event erroring or returning when consumable info isn't available
- Improve debug/error prints on the server side when starting the script
- Fix stash labels showing as target labels
- Fix Stash Prop for counters
	- When placing an item on a custom counter prop for a stash, it will spawn a paperbag
	- This represents theres an item there
	- This wasn't working because of inventory open checks, not works as intended

## 3.0.03
- Fix more broken locales
	- I did a proper check for the locales, sorry for the issues
- Fix murderbag not being usable
	- Ox_inv needs extra steps to get it working, check any of the `install.md`'s in the _install folder
- Updated all install.md info to explain how to use murderbags with `ox_inv`
- Removed `MultiCraftAmounts` as it's not used anymore

## 3.0.02
- Fix consumable info, somehow using the wrong file
- Fix crafting info, some items were named wrong
- Fix shop selling wrong type of cheese
- Fix crafting recipe info making some say `invalid` on the progressbar

## 3.0.01
- Placed server start functions behind onResourceStart() to help ESX load correctly
	- This doesn't affect any other frameworks

## 3.0:
- Multiframework Update
	- Now works with `QB-Core`, `QBOX`, `OXCore`, `ESX` (if using ox_lib + ox_inventory)
- Full rewrite
- Added cams for progressbars
- Updated Multi Location support
	- Locations are now set in the locations folder
- Added the ability to craft from a stash
	- I have added a preset to the location, but it is disabled by default
	- They need to match the name of a created stash
- Added drawText prompt for when sitting in a chair on how to stand up
- Fix and updated multicraft
- Placed crafting/shops in the shared folder
	- Allows for different crafting/shop menus

## 2.6:
- Rewrite to tidy up and streamline the location code
	- (support for 6 mlos in one spot gets messy)
	- If you have a custom MLO layout they WILL still work
	- just copy into if statement like before
	- The MLO's I've personally added support for will be a different format from now on
- Optimizations, less memory usage
	- `GetCoreObject()` removed from every file and moved to bottom of config.lua to reduce memory usage
- Added uNiqx Burgershot MLO Support
- Added usable toilets to all possible MLO's

## 2.5:
- Added GABZ Bugershot MLO Support
- Fixed "undefined" target for chairs
- Optimized script to reduce memory usage

## 2.4.9.1:
- Added french locale `fr.lua`
- Fixed a couple shop targets breaking
- Fixed RZ Burgershot location opening stash instead the shop
- Fixed broken locale for "sit down" targets

## 2.4.9:
- Fix blips now showing on the map for all locations
- Fix progressbar stopping movement

## 2.4.8:
- Fix deep frier animation (Don't put your hands in a fryer kids)
- Fix for possiblity of locations overriding each other
- Fix Prepared/Chopping Board Headers in certain locations

## 2.4.7:
- Add "Multi-Craft" option in the config.lua
- Split-Stack item exploit fix
- Change/Add support for creating jobGarages in (https://github.com/jimathy/jim-jobgarage)
- Optional: Support for new `Jim-Consumables` automated item adding events
	- (Start `jim-consumables` BEFORE this script and set `Config.JimConsumables` to `true` for it to work)
	- (https://github.com/jimathy/jim-consumables)
- Fix murder bags not working on ox
- Support added for RZ's free burgershot MLO (https://github.com/rz4never/rz-burgershot/tree/main/burgershot-map)
- Fix looking in the wrong direction when crafting

## 2.4.6
- Reset default settings to "qb"
- Fix crafting animations not working for other languages
- Fix crafting menus sometimes not showing a title

## 2.4.5
- Added image icons to ox_lib menus
- Added Version Update check
- Fix ox stores possibly breaking on opening

## 2.4.4
- Improved `OX_Lib` Context support (better layout for ingredients)
- Improved `OX_Inv` support
- Added `OX_Lib` Progressbar support
- Improved script stopping/restarting events
- Added more options to blip creation
- Locale fixes
- Updated shared functions to give more info and be more optimized

## 2.4.3
- Improved locations of targets in Smallo's free MLO
- Improved blip customisablilty
- Update Built-in Consume event to be more optimized and easier to read
- Fix install.md to re-add missing emotes
- a
- **Basic** OX_Lib notification support (Set `Config.Notify = "ox"`)
- Updated shared functions to give more info and be more optimized

## 2.4.2
- Fix lookEnt() event
- Fix Murderbags not opening (these won't work with ox_inventory)

## 2.4.1
- Fix stores not being able to open for qb-inventory
- Updated emote code in built-in consumable events

## 2.4
- Support for changing Core name
- Support added for OX_Target
- Support added for OX_Inventory
- Support added for OX_Lib Context Menus
- Add Support for GNMods Sandy Shores
- Add Support for GNMods Mirror Park
- Added autoClock variable to locations config
	- This helps define if leaving or entering the zone clocks in or out
- Add Support for multiple locations at once
	- Small change in the config as the MLO option is now tied to the one zone as it made more sense

## v2.3.7
- Updated install.md
	- Included instructions to make use of Jim-Consuambles if wanted
- Updated built-in client and server `Hasitem` events to be more accurate

## v2.3.6
- Forgot to swap and old event, it was still trying to check for items incorrectly

## v2.3.5
- Workaround for the `HasItem()` allowing crafting when items aren't there

## v2.3.4
- Made the `HasItem` functions built in, so no edits to core needed
	- This allows optimizations + makes crafting menus open/load much faster
- Add item duping protection to item crafting

## v2.3.3
- Add "cn" locale
- Add item duping protection

## v2.3.1
- Fixes to QBCore item Changes
- Greatly reduced the size of MurderBag stashes

## v2.3
- New shared file with all the functions in
- Optimised Chair code
- Optimized spawning of props

## v2.2.1
- Fixed built in job garage not being selectable
- Optimisations
	- Did some tidying up of code
	- Worked in some unloading of props and such to help reduce memory usage

## v2.2
- Added full support for NoPixels MLO
	- All Chairs usable
	- All Locations usable
	- DUI changing support
	- Interior and External DUI's are linked as the textures use the same names
	- Notes: Come collisions are a bit off so you have to aim at very specific places a lot of the time
- Dui Fixes
	- Optimizations: Unless you manually set the image in dui.lua or in game, it wont try load a DUI
	- Support for NoPixels internal Images, which changes the external ones too

## v2.1.1
- Hotfix for wrong events left in for Smallo's MLO

## v2.1
- Added support for changing the DUI images above the counters
	- Support for both GN Mods and Smallo's MLO
- Fixed Burger Grill checkmarks not working at all
- Added Support for ps-progressbar
- Finally caved in and moved the config.lua based locations over to client.lua
- Introduced new item, the "Murder Bag". Grab these from their pickup locations and put your items inside.
	- Don't forget to add the new item and image.

## v2.0
- Added Support for CheckMarks
	- This is a toggle in the config, if it causes issues(like lag) disable it
- Added Support for Jim-Shops
- Added support for new Qb-Menu icons
- Finally fixed missing missing tray in GN mods MLO
	- It was always there but had to be moved slightly to the side for it to actually not be invisible
- Added missing ATM to other entrance under the 2nd "ATM Machine" sign
- Added Job Garage for delivery vehicles
- QoL Fixes and Optimizations
- Added simple support for Toys/Prizes
- BossMenu is now accessible from the same areas as clock in targets

----------------------------------------------------------------------------------------------------