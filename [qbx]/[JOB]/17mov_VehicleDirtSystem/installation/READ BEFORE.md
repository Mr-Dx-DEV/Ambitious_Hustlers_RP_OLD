# Welcome!

Thank you for purchasing our script. I would like to inform you that it has an automatic installation feature for your server.

# Installation process

1. Copy the images from the `installation/images` directory and paste them into your inventory system.
2. Add these items to your inventory system or framework:

(English version)
```lua
    ['mov_basic_ceramic'] = {
        label = "Basic Ceramic",
        description = "After application on the car, dirt does not stick to the bodywork, making it much easier to wash off at the car wash. It lasts about 3 days on the car, after which time reapplication is required to maintain the effect.",
        image = 'mov_basic_ceramic.png',
        weight = 10,
    },

    ['mov_advanced_ceramic'] = {
        label = "Premium Ceramic",
        description = "After application on the car, dirt does not stick to the bodywork at all, so at the car wash, it only needs to be rinsed off. It lasts about 7 days on the car, after which time reapplication is required to maintain the effect.",
        image = 'mov_advanced_ceramic.png',
        weight = 10,
    },

    ['mov_basic_wax'] = {
        label = "Basic Wax",
        description = "After application on the car, the car is resistant to external dirt, such as driving on unpaved roads, etc. It will still get dirty, but much more slowly. It lasts about 3 days on the car, after which time reapplication is required to maintain the effect.",
        image = 'mov_basic_wax.png',
        weight = 10,
    },

    ['mov_advanced_wax'] = {
        label = "Advanced Wax",
        description = "After application on the car, the car is highly resistant to external dirt, such as driving on unpaved roads, etc. It will still get dirty, but much more slowly. It lasts about 7 days on the car, after which time reapplication is required to maintain the effect.",
        image = 'mov_advanced_wax.png',
        weight = 10,
    },
```

(Polish version)
```lua
    ['mov_basic_ceramic'] = {
        label = "Ceramika Podstawowa",
        description = "Po nałożeniu na samochód brud nie przykleja się do karoserii, co znacznie ułatwia jego zmycie na myjni. Utrzymuje się na samochodzie około 3 dni, po tym czasie konieczna jest ponowna aplikacja dla podtrzymania efektu.",
        image = 'mov_basic_ceramic.png',
        weight = 10,
    },

    ['mov_advanced_ceramic'] = {
        label = "Ceramika Premium",
        description = "Po nałożeniu na samochód brud w ogóle nie przylega do karoserii, dlatego na myjni wystarczy go jedynie spłukać. Utrzymuje się na samochodzie około 7 dni, po tym czasie wymagana jest ponowna aplikacja dla podtrzymania efektu.",
        image = 'mov_advanced_ceramic.png',
        weight = 10,
    },

    ['mov_basic_wax'] = {
        label = "Wosk Podstawowy",
        description = "Po nałożeniu na samochód auto jest odporne na zabrudzenia zewnętrzne, np. jazdę po drogach nieutwardzonych itp. Nadal będzie się brudziło, ale znacznie wolniej. Utrzymuje się na samochodzie około 3 dni, po tym czasie konieczna jest ponowna aplikacja dla podtrzymania efektu.",
        image = 'mov_basic_wax.png',
        weight = 10,
    },

    ['mov_advanced_wax'] = {
        label = "Wosk Zaawansowany",
        description = "Po nałożeniu na samochód auto jest bardzo odporne na zabrudzenia zewnętrzne, takie jak jazda po nieutwardzonych drogach itp. Nadal będzie się brudziło, ale znacznie wolniej. Utrzymuje się na samochodzie około 7 dni, po tym czasie wymagana jest ponowna aplikacja dla podtrzymania efektu.",
        image = 'mov_advanced_wax.png',
        weight = 10,
    },
```

**NOTE:** structure of items are ready for: `qb-core`, `qbx_core`, `es_extended`, `qb-inventory`, `ox_inventory`. If you are using some other resource, you need to adjust structure at your own.

3. You can restart your server and everything should work fine.

# Issues with MLO, bugged textures etc.

This means that some of your other maps are using the same files as our script, which causes a conflict between the maps. In this case you need to resolve this conflict, you have 3 ways to do that:
- Remove specified wash station
- Remove resource that causing conflict
- Merge two files into one "shared". Our Partner NTeam did a great tutorial how to do that: https://youtu.be/XR9oRhCXdxU

Thank you once again for your support. If you have any problems, feel free to contact us on Discord: https://discord.17movement.net/
**17 Movement**