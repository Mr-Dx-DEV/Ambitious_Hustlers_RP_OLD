Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/9pCDHmjYwd

-------------------------------------------------------------------------------------------------

# QBOX Installation

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

- Add the images from `_install > images` to your inventory folder eg. `qb-inventory > html > images`

- Add the `ox_items.txt` to your `ox_inventory > data > items.lua`

--------------------------------------------------------------------------------------------------

# Job installation

- Add the lines from `qb_jobs.txt` to your `qb-core > shared > jobs.lua`

## QBX-Management

- Update to the latest github version
- Make sure the job "burgershot" has been added to the database
- The menu's targets should be accessible to bosses from the clock in spot

--------------------------------------------------------------------------------------------------

# Add the script to the server resources

- It is highly recommend to put this script folder in a new folder called `[jim]`
- Then add `ensure [jim]` AFTER your other scripts in your server.cfg

-------------------------------------------------------------------------------------------------

## Ensure List

GO TO YOUR `server.cfg`

## Resources (EXAMPLE)
```
# Qbox & Extra stuff
ensure ox_lib
ensure qbx_core
ensure ox_target
ensure [ox]
ensure [qbx]
ensure [standalone] # Place jim_bridge here
ensure [voice]

ensure [npwd-apps]
ensure qbx_npwd
ensure npwd

# Extra Jim Stuff
ensure [jimextras]  # Place jim-payments / jim-consumables / jim-jobgarage / jim-djbooth here
ensure [jim]        # Place all other jim scripts here
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