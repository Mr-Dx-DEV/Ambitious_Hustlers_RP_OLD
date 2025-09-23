Thank you for purchasing rtx_gym we're grateful for your support. If you'd ever have a question and / or need our help, please reach out to us by sending an email or go ahead and create a ticket on our discord: https://discord.gg/P6KdaDpgAk


Install instructions (Standalone):
1. Put rtx_gym folder to your resources
2. Open config.lua file
3. Configure your config.lua to your preferences
4. Upload sql sql_STANDALONE-QBCORE.sql file to your mysql database.
5. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/LWaYxz7.png) remove -- from line 11, or replace line 11 with '@oxmysql/lib/MySQL.lua',
6. Put rtx_gym to the server.cfg

Install instructions (QBCore):
1. Put rtx_gym folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "qbcore"
4. Configure your config.lua to your preferences
5. Upload sql sql_STANDALONE-QBCORE.sql file to your mysql database.
6. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/LWaYxz7.png) remove -- from line 11, or replace line 11 with '@oxmysql/lib/MySQL.lua',
7. Put rtx_gym to the server.cfg
6. Add new items to qb-core/shared/items.lua - items name: protein, creatine, preworkout, testosterone 
Example items line for items.lua:
['protein'] = {['name'] = 'protein', ['label'] = 'Protein', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'protein.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Protein'},
['creatine'] = {['name'] = 'creatine', ['label'] = 'Creatine', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'creatine.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Creatine'},
['preworkout'] = {['name'] = 'preworkout', ['label'] = 'Preworkout', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'preworkout.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Preworkout'},
['testosterone'] = {['name'] = 'testosterone', ['label'] = 'Testosterone', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'testosterone.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Testosterone'},

Install instructions (ESX):
1. Put rtx_gym folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "esx"
4. Configure your config.lua to your preferences
5. Upload sql sql_ESX.sql file to your mysql database.
6. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/yoULcX4.png) remove -- from line 10, or replace line 10 with '@mysql-async/lib/MySQL.lua',
7. Put rtx_gym to the server.cfg

Maps:
Los Santos GYM
https://www.gta5-mods.com/maps/mlo-interior-los-santos-gym
Pump & Run GYM
https://www.gta5-mods.com/maps/mlo-pump-run-gym-add-on-sp-fivem-ragemp
La Fitness
https://www.youtube.com/watch?v=LXm9ix0fF4Y'

Commands for admins:

/addgymstats - example (/addgymstats 1 condition 25.0)
/removegymstats - example /removegymstats 1 condition 25.0)
/statsgymclear - example (/statsgymclear 1)


Server Exports:

exports["rtx_gym"]:SavePlayer(source) Use this export to save player
exports["rtx_gym"]:AddStats(source, "condition", 25.0) Use this export to add specific player stats
exports["rtx_gym"]:RemoveStats(source, "condition", 25.0) Use this export to remove specific player stats
exports["rtx_gym"]:UpdateStats(source, "condition", 25.0) Use this export to replace the player's specific stat
exports["rtx_gym"]:GetStats(source, "condition") Through this export you will gain a specific player stat
exports["rtx_gym"]:GetAllStats(source)  Through this export you gain all player stats

Client Exports:

exports["rtx_gym"]:GetStats("condition") Through this export you will gain a specific player stat
exports["rtx_gym"]:GetAllStats()  Through this export you gain all player stats

-----------------------------
Object names for whitelist to anticheat:

prop_barbell_10kg
prop_barbell_100kg
prop_barbell_80kg
prop_barbell_60kg
prop_barbell_50kg
prop_barbell_40kg
prop_barbell_30kg
prop_barbell_20kg
prop_curl_bar_01
prop_barbell_01
prop_ld_flow_bottle
prop_cs_pills
p_syringe_01_s

License agreement / Terms of Service
1. Any purchase is non-refundable.
2. Each product is to be used on a singular server, with the exception of a test server.
3. Any form of redistribution of our content is considered copyright infringement.
4. If any of these rules are broken, legal actions can be taken.
© 2025 RTX Development, all rights reserved.