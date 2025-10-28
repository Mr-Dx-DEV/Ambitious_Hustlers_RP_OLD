Crafting = Crafting or {}

Crafting.BurgerShotChopBoard = {
    Header = locale("menu", "food"),
	Anims = CraftingEmotes.Typing,
    progressBar = {
		label = locale("progressbar", "progress_make"),
		time = 5000,
	},
    Recipes = {
		{ slicedonion = { onion = 1, }, amount = 3 },
		{ slicedpotato = { potato = 1, }, amount = 3 },
		{ chickenwrap = { shotnuggets = 1, lettuce = 1, } },
		{ cheesewrap = { cheddar = 1, lettuce = 1, } },
    },
}
Crafting.BurgerShotFryer = {
    Header = locale("menu", "fryer"),
	Anims = CraftingEmotes.Grill,
    progressBar = {
		label = locale("progressbar", "progress_make"),
		time = 5000,
	},
    Recipes = {
		{ shotfries = { slicedpotato = 1, } },
		{ shotrings = { slicedonion = 1, } },
		{ shotnuggets = { frozennugget = 1, } },
    },
}
Crafting.BurgerShotGrill = {
    Header = locale("menu", "grill"),
	Anims = CraftingEmotes.Grill,
    progressBar = {
		label = locale("progressbar", "progress_make"),
		time = 5000,
	},
    Recipes = {
		{ burgermeat = { burgerpatty = 1, } },
    },
}
Crafting.BurgerShotPrepare = {
    Header = locale("menu", "food"),
	Anims = CraftingEmotes.Typing,
    progressBar = {
		label = locale("progressbar", "progress_make"),
		time = 12500,
	},
    Recipes = {
		{
            heartstopper = {
				burgerbun = 1,
				cheddar = 1,
				lettuce = 1,
				burgermeat = 1,
				slicedonion = 1,
            }
        },
        {
			bleeder = {
				burgerbun = 1,
				cheddar = 1,
				lettuce = 1,
				burgermeat = 1,
				slicedonion = 1,
            }
        },
		{
            torpedo = {
				burgerbun = 1,
				cheddar = 1,
				lettuce = 1,
				burgermeat = 1,
				slicedonion = 1,
            }
        },
		{
            meatfree = {
				burgerbun = 1,
				cheddar = 1,
				lettuce = 1,
				slicedonion = 1,
            }
        },
		{
            moneyshot = {
				burgerbun = 1,
				cheddar = 1,
				lettuce = 1,
				burgermeat = 1,
				slicedonion = 1,
            }
        },
    }
}
Crafting.BurgerShotDrink = {
    Header = locale("menu", "drinks_dispenser"),
	Anims = CraftingEmotes.Pour,
    progressBar = {
		label = locale("progressbar", "progress_pour"),
		time = 3500,
	},
    Recipes = {
		{ water_bottle = { } },
		{ bscoke = { } },
		{ bscoffee = { } },
		{ milkshake = { milk = 1, icecream = 1, } },
    },
}
Crafting.BurgerShotDonut = {
    Header = locale("menu", "food_cabinet"),
	Anims = CraftingEmotes.Typing,
    progressBar = {
		label = locale("progressbar", "progress_make"),
		time = 3500,
	},
    Recipes = {
		{ ["rimjob"] = {} },
		{ ["creampie"] = {} },
    },
}