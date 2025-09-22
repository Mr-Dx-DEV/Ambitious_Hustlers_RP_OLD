Strings = {}

Strings.Notify = {
    lostItem = 'You lost track of the item and move on',
    stopped = 'You stopped metal detecting',
    alreadyDigging = 'You are already digging',
    nothingToDig = 'There is nothing to dig for here',
    noShovel = 'You do not have a shovel',
    nothingToSell = 'You don\'t have anything on you worth anything',
    levelUp = 'You just leveled up in metal detecting!',
    noMoney = 'You do not have enough money',
    noLevel = 'You do not have the required level for this metal detector',
    inVehicle = 'You can\'t do that',
    cantDetect = 'You cannot metal detect in this area',
    notAuthorized = 'You are not authorized to do this'
}

Strings.TextUI = {
    shop = {
        label = '**Shop**  \n E- Open',
        icon = 'basket-shopping'
    },
    searching = {
        label = '**Metal Detecting**  \n Searching..',
        icon = 'magnifying-glass'
    },
    distance = {
        label = '**Metal Detecting**  \n Distance: ',
        icon = 'location-dot'
    },
    dig = {
        label = '**Metal Detecting**  \n E - Start Digging',
        icon = 'trowel'
    },
    error = {
        label = '**Metal Detecting**  \n Error',
        icon = 'exclamation-triangle'
    }
}

Strings.Target = {
    shop = {
        icon = 'fas fa-shopping-basket',
        label = 'Open Shop',
    },
    distance = 2
}

Strings.ContextMenu = {
    detector_shop = { -- The shop a player buys their metal detector(s) from
        title = 'Metal Detecting',
        subtitle = ' | $',
        level1 = { -- Blue metal detector
            title = 'Beginner\'s Beacon',
            description = 'Ideal for novices, the Beginner\'s Beacon offers simplicity and reliability. Perfect for those just starting their treasure-hunting journey.',
            icon = 'fas fa-magnifying-glass-location',
            image = 'nui://lation_detecting/install/images/blue_metaldetector.png',
            metadata = {
                radius = { label = 'Radius', value = '2.5/10', progress = 25 },
                depth = { label = 'Depth', value = '3/10', progress = 30 },
                accuracy = { label = 'Accuracy', value = '3.5/10', progress = 35 }
            }
        },
        level2 = { -- Green metal detector
            title = 'Lustrous Locator',
            description = 'Step up your game with the Lustrous Locator. Enhanced depth capabilities and better material differentiation make this the choice for ambitious explorers.',
            icon = 'fas fa-magnifying-glass-location',
            image = 'nui://lation_detecting/install/images/green_metaldetector.png',
            metadata = {
                radius = { label = 'Radius', value = '4.1/10', progress = 41 },
                depth = { label = 'Depth', value = '5/10', progress = 50 },
                accuracy = { label = 'Accuracy', value = '4.3/10', progress = 43 }
            }
        },
        level3 = { -- Red metal detector
            title = 'Treasure Trove Tracker',
            description = 'Unlock the secrets of the ground below. With superior sensitivity and advanced filtering, the Treasure Trove Tracker will lead you right to the riches.',
            icon = 'fas fa-magnifying-glass-location',
            image = 'nui://lation_detecting/install/images/red_metaldetector.png',
            metadata = {
                radius = { label = 'Radius', value = '5.8/10', progress = 58 },
                depth = { label = 'Depth', value = '6.4/10', progress = 64 },
                accuracy = { label = 'Accuracy', value = '5.2/10', progress = 52 }
            }
        },
        level4 = { -- Orange metal detector
            title = 'Goldseeker\'s Grail',
            description = 'Specifically engineered for the adventurous. The Goldseeker\'s Grail has enhanced detection and refined tuning. No metal or relic escapes its grasp.',
            icon = 'fas fa-magnifying-glass-location',
            image = 'nui://lation_detecting/install/images/orange_metaldetector.png',
            metadata = {
                radius = { label = 'Radius', value = '7.5/10', progress = 75 },
                depth = { label = 'Depth', value = '8.5/10', progress = 85 },
                accuracy = { label = 'Accuracy', value = '7.2/10', progress = 72 }
            }
        },
        level5 = { -- Black metal detector
            title = 'Archaeo Ace',
            description = 'Crafted for the discerning professional. The Archaeo Ace boasts unmatched depth detection and intricate object analysis. Dive deeper and discover more.',
            icon = 'fas fa-magnifying-glass-location',
            image = 'nui://lation_detecting/install/images/black_metaldetector.png',
            metadata = {
                radius = { label = 'Radius', value = '10/10', progress = 100 },
                depth = { label = 'Depth', value = '9.6/10', progress = 96 },
                accuracy = { label = 'Accuracy', value = '8.6/10', progress = 86 }
            }
        }
    },
    sell_shop = {
        title = 'Sell Shop',
        sellAll = {
            title = 'Sell All',
            description = 'Sell all the items you have on you',
            icon = 'fas fa-sack-dollar'
        },
        selectItem = {
            title = 'Select Item',
            description = 'Select which item(s) you want to sell',
            icon = 'fas fa-hand-pointer'
        },
        singleItem = {
            description = 'You have x%s and they sell for $%s each',
            icon = 'fas fa-dollar-sign'
        },
        shovel = {
            title = 'Buy Shovel',
            icon = 'fas fa-trowel'
        }
    },
    stats_menu = {
        title = 'Metal Detecting',
        colors = {
            red = 'red',
            yellow = 'yellow',
            green = 'green'
        },
        level = {
            title = 'Current Level',
            description = 'You are currently level %s/5',
            icon = 'fas fa-ranking-star'
        },
        progress = {
            title = 'Current Progress',
            description = 'Progress towards next level: ',
            description2 = '%',
            icon = 'fas fa-bars-progress',
            metadata = {
                currentXP = {one = 'Current Experience', two = 'XP'},
                nextLevel = {one = 'Next Level In', two = 'XP'}
            }
        },
        itemsFound = {
            title = 'Items Found',
            description = 'You have found a total of %s items',
            icon = 'fas fa-person-digging'
        },
        moneyEarned = {
            title = 'Money Earned',
            description = 'You have earned a total of $',
            icon = 'fas fa-sack-dollar'
        }
    }
}

Strings.InputDialog = {
    title = 'Confirm %s Sale',
    label = 'Quantity',
    description = 'How many do you want to sell? You have x%s',
    icon = 'hashtag'
}

Strings.AlertDialog = {
    selling = {
        header = 'Confirm',
        content = 'You are about to sell everything for $%s. Are you sure you want to continue?',
        labels = { confirm = 'Yes', cancel = 'No' }
    },
    buyDetector = {
        header = 'Confirm Purchase',
        content = 'This metal detector costs $%s. Do you want to continue?',
        centered = true,
        cancel = true,
        labels = { confirm = 'Purchase', cancel = 'Nevermind' }
    }
}

Strings.Logs = {
    found_item = {
        title = 'Found Item',
        message = '%s (identifier: %s) has found x%s %s'
    },
    level_up = {
        title = 'Level Up',
        message = '%s (identifier: %s) has leveled up to level %s'
    },
    buy_detector = {
        title = 'Detector Purchased',
        message = '%s (identifier: %s) has purchased a %s'
    },
    item_sold = {
        title = 'Item Sold',
        message = '%s (identifier: %s) has sold x%s %s for $%s'
    },
    item_sold_all = {
        title = 'Item(s) Sold',
        message = '%s (identifier: %s) has sold items: %s for a total of $%s'
    }
}