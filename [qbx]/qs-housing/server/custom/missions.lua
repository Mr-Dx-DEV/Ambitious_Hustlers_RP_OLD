function CreateQuests(source)
    if GetResourceState('qs-inventory') ~= 'started' then
        Debug('qs-inventory not started, skipping housing quest creation.')
        return 
    end

    local quest1 = exports['qs-inventory']:createQuest(source, {
        name = 'buy_house',
        title = 'Home Sweet Home',
        description = 'Purchase your first house.',
        reward = 300,
        requiredLevel = 1
    })

    local quest2 = exports['qs-inventory']:createQuest(source, {
        name = 'install_home_upgrade',
        title = 'Upgrade Life',
        description = 'Install an upgrade in your home.',
        reward = 200,
        requiredLevel = 1
    })

    local quest3 = exports['qs-inventory']:createQuest(source, {
        name = 'give_house_keys',
        title = 'Sharing is Caring',
        description = 'Give a friend the keys to your house.',
        reward = 150,
        requiredLevel = 1
    })

    local quest4 = exports['qs-inventory']:createQuest(source, {
        name = 'buy_furniture',
        title = 'Decorator\'s Touch',
        description = 'Buy at least 10 pieces of furniture for your home.',
        reward = 250,
        requiredLevel = 2
    })

    local quest5 = exports['qs-inventory']:createQuest(source, {
        name = 'place_home_stash',
        title = 'Private Storage',
        description = 'Place a personal stash inside your house to store your items.',
        reward = 200,
        requiredLevel = 1
    })

    local quest6 = exports['qs-inventory']:createQuest(source, {
        name = 'place_home_wardrobe',
        title = 'Dressed for Success',
        description = 'Install a wardrobe in your home to manage your outfits.',
        reward = 200,
        requiredLevel = 1
    })

    local quest7 = exports['qs-inventory']:createQuest(source, {
        name = 'place_phone_charger',
        title = 'Power Up',
        description = 'Place a Smartphone PRO charger spot in your house.',
        reward = 200,
        requiredLevel = 1
    })

    Debug('Housing quests assigned to player:', source, {
        buy_house = quest1,
        install_home_upgrade = quest2,
        give_house_keys = quest3,
        buy_furniture = quest4,
        place_home_stash = quest5,
        place_home_wardrobe = quest6,
        place_phone_charger = quest7
    })
end
