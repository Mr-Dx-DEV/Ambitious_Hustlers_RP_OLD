Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/9pCDHmjYwd

-------------------------------------------------------------------------------------------------

# Changelog

## 2.1.08

- Tidy items in _install a bit
- Remove thread that was stopping prop spawn
- Make use of jim_bridge's new shop exploit protection
- Use jim_bridge's `getItemLabel()` function more

Files to replace:
- client/functions.lua
- server/encserver.lua

## 2.1.07

- Full support for Lation_UI
- State in config that okok billing is an option
- Fix anim flag logic for built in consume event
- Fix cats.lua being escrowed
- Update discord links and add gitbook link info

Files to replace:

- client/cats.lua
- client/functions.lua
- config.lua
- _install/

## 2.1.06

- Add support for jim-blipcontroller
	- New config options
- Add support for jim-imagedisplay
- Change built in `jim-payments` trigger to `jim_bridge` `billPlayer()` function
	- This includes a new config option, if not set it will default to `jim-payments`
- Change built in "qb-bossmenu" trigger event to `jim_bridge` `openBossMenu()`
	- This detects what bossmenu you have started

## 2.1.05

- Fix qb-items being unusable, replace your items in the shared to fix this

## 2.1.03

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


## 2.1.03
- Placed server start functions behind onResourceStart() to help ESX load correctly
	- This doesn't affect any other frameworks

## 2.1.02
- Update fxmanifest to allow jim_bridge to load the framework files
- If djbooth is added, it checks for the script before hand

## 2.1.01
- Fix consume event breaking on ox_inv (client/functions.lua)
- Fix personal stash targets possibly kicking on ox_inv (client/functions.lua)

## 2.1
- Reworked install info and items (update your items, especcially if on OX)
- Rework to new format
- Supports QBCore again after all their changes
- Enchanced built in consume food function
	- No longer requires rpemotes
	- Hunger, thirst and emote info comes from `/consumables` folder

## 2.0
- Multiframework Update
- Now works with `QB-Core`, `QBOX`, `OXCore`, `ESX` (if using ox_lib + ox_inventory)
- Full rewrite
- Added cams for progressbars
- Added Multi Location support
- Added the ability to craft from a stash
	- I have added a preset to the location, but it is disabled by default
	- They need to match the name of a created stash
- Added drawText prompt for when sitting in a chair on how to stand up
- Support for custom blip preview images in the pause menu map.
	- This requires the script `blip_info` to be running in your server (https://github.com/jimathy/blip_info)
	- If you dont have one added it will default to the payment logo image, if that isnt set it wont show anything.
	- Custom images can be any size but recommended to be 512x256 png's

## v1.8.7
- Optimizations, less memory usage
- `GetCoreObject()` removed from every file and moved to bottom of config.lua to optimise memory usage

## v1.8.6hotix
- Fix for crafting progressbar locale causing errors for some

## v1.8.6
- Add "Multi-Craft" option in the config.lua
- Split-Stack item exploit fix
- Change/Add support for creating jobGarages in (https://github.com/jimathy/jim-jobgarage)
- Optional: Support for new `Jim-Consumables` automated item adding events
- (Start `jim-consumables` BEFORE this script and set `Config.JimConsumables` to `true` for it to work)
- (https://github.com/jimathy/jim-consumables)
- Fix looking in the wrong direction when crafting

## v1.8.5
- Added image icons to ox_lib menus
- Added Version Update check

## v1.8.4
- Improved `OX_Lib` Context support (better layout for ingredients)
- Added `OX_Lib` Progressbar support
- Improved script stopping/restarting events
- Added more options to blip creation
- Updated shared functions to give more info and be more optimized

## v1.8.3
- Improved OX_Inv support
- *Basic* `OX_Lib` notification support (Set `Config.Notify = "ox"`)
- Updated shared functions to give more info and be more optimized
- Merged built-in eating events into one optimized event

## v1.8.2
- Fix lookEnt() event

## v1.8.1
- Set "qb" as default setting in config for inv
- Add support for OX_Lib's Context Menu's
- Updated emotes in built-in consumable events
- Removed doubled `onResourceStop` event

## v1.8
- Support for changing Core name
- Support added for OX_Target
- Support added for OX_Inventory
- Added autoClock variable to locations config
- This helps define if leaving or entering the zone clocks in or out

## v1.7.2
- Update install.md
- Included instructions to make use of Jim-Consuambles if wanted
- Updated built-in client and server Hasitem events to be more accurate
- Fix standing petting animation not cancelling correctly

## v1.7.1
- Workaround for the HasItem() allowing crafting when items aren't there

## v.1.7
- New CatCafe Props thanks to ZenKat again
- This includes new emotes <3
- Locale system implemented thanks to Vosscat
- Made the `HasItem` functions built in, so no edits to core needed
- This allows optimizations + makes crafting menus open/load much faster
- Add item duping protection to item crafting

## v.1.6.2
- Fix crashes linked to filenames being similar to other scripts, thanks to idrp again
- Added missing "catcoffee" and removed "coffee" from the recipes
- QBCore item changes and fixes
- Greatly utilised custom lookEnt() function to have player face towards interaction point

## v1.6.1
- Fix sleeping cats breaking after being pet once

## v1.6
- Shared file added to handle all the functions
- Optmizations all over
- Cat handling more optimized
- Chair code remade
- Cat's AI updated
- All targetable/petable
- Now less chance of getting stuck on walls (added a route they randomly pick locations from)
- Fix debug message giving wrong missing items

## v1.5.2
- Fixed Cat Coffee not being usable
- Included updated dpemotes in the install.md (replace all)

## v1.5.1
- 3 More Props and 2 more custom emotes!
- Update the custom dpemotes that are already there
- 4 new inventory images to fit props
- New drink, Cat Coffee
- Cat Cafes own Cat Coffee.
- Don't forget to add this to the items.lua
- Thanks again to Zenkat :D

## v1.5
- Fixed only one animation when crafting items
- Added support for the uWuCafe props and dpemotes custom emotes
- These were provided by Zenkat <3 - https://discord.com/invite/UEqvHUHZ24

## v1.4.1
- Fix Patheal not affecting anything when petting cats
- Added RelieveStress to add customisable stress relief when petting cats
- Fix Prepared food shelf being usable by anyone
- Attempt to hopefully fix garage vehicles not being removed if it wasn't spawned by them
- Added support for ps-progressbar

## v1.4
- Added Support for CheckMarks
- This is a toggle in the config, if it causes issues(like lag) disable it
- Added Support for Jim-Shops
- Optimizations and improved crafting
- Better handling of targets and peds(cats)
- Improved/optimized crafting systems, This fixes the issues some were having with crafting "coffee" and "nekolatte"
- Added support for new QB-Menu in the config
- Added Job Garage (for delivery vehicles, not parking personal vehicles)
- Basic Support for prizes from an item
- New config options to help set this up
- Added 3 target locations to access bossmenu in the offices

## v.1.3.1
- Fixed crafting calling on a nil value
- Fixed Cash Register not working
- Fixed watermelon from beanmachine being required

## v1.3
- Changed to new versions of systems
- Uses crafting recipes
- Uses Icons in qb-menu now
- Fixes any issues with making food and drinks
- Install Checks to see if any items are missing.
- Added image support for jim-payments cash register

## v1.2
- Payment systems removed/changed in favour of support for my free payment script jim-payments: https://github.com/jimathy/jim-payments#
- Add this script to your server and payment systems will work as normal with extra features
- This change removes events from client.lua and server.lua
- Fixed typo in a hand washing qb-target location
- Several QoL fixes I've lost track of
- Removed doubled up cat from ledge near staff door
- Rearranged qb-menu layout
- Added item checkmarks to qb-menu's to show if you have the required items or not
- This adds changes to client.lua
- Changed seat variable name in chairs.lua to reduce conflicts with my other scripts
- After many arguements, people prefer to PET the cat not PAT the cat.
- Fixed item requirements/removal. Messed up mochi ingredients all using mint
- Added missing item, the orange.
- Consumable info now stored in the shared's item info

## v1.1
- Cat Fixes/Updates
- Added 6 cats that wander (they are dumb/blind and sometimes get stuck in corners)
- Cats have no collision so you can walk through them (this is to stop people pushing them into corners and such)
- ONLY sleeping cats can be petted to relieve stress (for now)

- Added now food preparation location, the Hob's next to the ovens
- These are for noodles and soups

- New Food Items
- Bowl of Ramen
- Bowl of Noodles
- Paw Cakes (Pancakes)
- Kitty Pizza (Pizza)
- Cat Cake Pop (Cake Lolly Pops)
- Purrito (Burrito)
- New Drink Item
- Mocha Meow (Mocha Drink)
- New Ingredient
- Instant Noodles

- Complete rewrite of the payment system, now using qb-menu and qb-phone
- Tickets are still obtainable through this change
- Added a minimum amount to get receipts, to stop possible $1 exploits
- If someone tries to make a payment less than this amount, no one will get a receipt. If its over this amount it will work as usual
- This is based on the amount set in config.lua with Config.MinAmountforTicket
- This should, in theory be set to the cheapest product you are selling.

- Couple of QoL fixes