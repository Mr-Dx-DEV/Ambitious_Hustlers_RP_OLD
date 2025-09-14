Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/9pCDHmjYwd

-------------------------------------------------------------------------------------------------

# OX Installation

-------------------------------------------------------------------------------------------------

# Dependencies

 - Jim_Bridge - https://github.com/jimathy/jim_bridge [**REQUIRED**]
 - Jim-Payments - https://github.com/jimathy/jim-payments [OPTIONAL]
 - Jim-Consumables - https://github.com/jimathy/jim-consumables [OPTIONAL]
 - Jim-JobGarage - https://github.com/jimathy/jim-jobgarage [OPTIONAL]
 - Jim-DJBooth - https://github.com/jimathy/jim-djbooth [OPTIONAL]

-------------------------------------------------------------------------------------------------

# Documentation: (This will always be most up to date and informative)

https://jixelpatterns.gitbook.io/docs/

-------------------------------------------------------------------------------------------------

# Item installation

- Add the images from `_install > images` to your inventory folder eg. `ox_inventory > data > items.lua`
- Add the `ox_items.txt` to your `ox_inventory > data > items.lua`

-------------------------------------------------------------------------------------------------

# Job installation

- Import the `ox_jobs.sql` into your database to add the jobs and their grades

-------------------------------------------------------------------------------------------------

# Add the script to the server resources

- It is highly recommend to put this script folder in a new folder called `[jim]`
- Then add `ensure [jim]` AFTER your other scripts in your server.cfg

## Ensure List

GO TO YOUR `server.cfg`

## Resources (EXAMPLE)

```
start chat
start sessionmanager
start pe-basicloading
start bob74_ipl
start pma-voice
start oxmysql
start ox_lib
start ox_core
start ox_target
start illenium-appearance
start ox_inventory
ensure [standalone] -- Place `jim_bridge` here

# Extra Jim Stuff
ensure [jimextras]  -- Place `jim-consumables / jim-jobgarage / jim-djbooth` here
ensure [jim] -- Place all other jim scripts here

# Extra Other Scripts Here

```

--------------------------------------------------------------------------------------------------

## Stash Crafting

- This script includes an optional stash crafting feature, which is `disabled` by default.
- In the location configuration files, you’ll find a commented out `StashCraft` option.
- Uncommenting this line designates the specified stash as a *crafting stash*.
- When enabled, players can craft items directly from the stash without needing to carry materials in their inventory.
- Crafted items will be delivered directly to the player's pockets.
- Once a stash is marked for crafting, its target option will display an asterisk (`*`) to indicate it is the active crafting stash.
- This helps players easily identify which stash is used for crafting.

--------------------------------------------------------------------------------------------------

## Jim-Payments (Required/Optional) - (https://github.com/jimathy/jim-payments)

- This is the default system for payments in the script but can easily be changed in `client.lua`
- When triggered gets a list of the nearest players and lets you choose which one to charge
- I class it as `optional` because you don't specifically need it if you have another you want to use.

--------------------------------------------------------------------------------------------------

## Jim-Consumables (Optional) - (https://github.com/jimathy/jim-consumables)

- If `jim-consumables` is installed, the script will attempt to reroute consumables
- The server side will automatically add the items to `jim-consumables` (edit any values you wish there)
- When used the item will trigger the `jim-script:client:consume` event which detects wether to use built in event's or `jim-consuambles` (if found)

--------------------------------------------------------------------------------------------------