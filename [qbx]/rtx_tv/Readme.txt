Thank you for purchasing rtx_tv we're grateful for your support. If you'd ever have a question and / or need our help, please reach out to us by sending an email or go ahead and create a ticket on our discord: https://discord.gg/P6KdaDpgAk


Install instructions (Standalone):
1. Put rtx_tv folder to your resources
2. Configure your config.lua to your preferences (Configure notify line in bottom of config.lua you need use our notify system or you need change notify line to your system system)
3. Put rtx_tv to the server.cfg

Install instructions (QBCore):
1. Put rtx_tv folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "qbcore"
4. Configure your config.lua to your preferences
5. Upload sql sql_QBCORE.sql file to your mysql database.
6. Add new items to qb-core/shared/items.lua - items name: tvremote, vehicletv
Example items line for items.lua:
['tvremote'] = {['name'] = 'tvremote', ['label'] = 'TV Remote', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'tvremote.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'TV Remote'},
['vehicletv'] = {['name'] = 'vehicletv', ['label'] = 'TV Remote', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'vehicletv.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Vehicle TV'},

7. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/LWaYxz7.png) remove -- from line 11, or replace line 11 with '@oxmysql/lib/MySQL.lua', 
8. Put rtx_tv to the server.cfg

Install instructions (ESX):
1. Put rtx_tv folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "esx"
4. Configure your config.lua to your preferences
5. Upload sql sql_ESX.sql file to your mysql database.
6. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/yoULcX4.png) remove -- from line 10, or replace line 10 with '@mysql-async/lib/MySQL.lua',
7. Put rtx_tv to the server.cfg

If you want a new interface style, instructions can be found in the New Interface Style folder.


Video Tutorial for new Vehicle Offsets (Be sure to enable Config.VehicleTelevisionOffSetsCreator in config)
https://www.youtube.com/watch?v=7Cu8LqRgvj0

Video Tutorial for In-Game Screen Creator (Be sure to enable Config.CustomTvCreator in config)
https://www.youtube.com/watch?v=5NAdvOsIQ2E


License agreement / Terms of Service
1. Any purchase is non-refundable.
2. Each product is to be used on a singular server, with the exception of a test server.
3. Any form of redistribution of our content is considered copyright infringement.
4. If any of these rules are broken, legal actions can be taken.
© 2025 RTX Development, all rights reserved.