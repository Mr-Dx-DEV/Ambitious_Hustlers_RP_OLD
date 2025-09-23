Config = {}

Config.GTAMenu = {
    top = {
        -- "text" will display only "Server Name" in the top of the menu
        -- "texture" will display the texture in the top of the menu
        -- "both" will display the texture and the text in the top of the menu
        DisplayMode = "both",
        texture = {
            TextureDict = "texture_name", -- if UseTexture is set to true, this is the name of the texture inside the ytd
            TextureFile = "file_name", --the ytd file name
            Width = 30,
            Height = 30,
        },
        text = "Ambitious Hustlers Roleplay", -- if UseTexture is set to false, this is the text that will be displayed in the top of the menu
    },
    menu = {
        ChangeColor = true, -- Set to true to change the color of the menu
        colors = {
            TextUnselected = { r = 255, g = 165, b = 0, a = 200 }, -- unselected text and Selected Menu (Blip list, menu ecc)
            TextSelected = { r = 255, g = 255, b = 255, a = 200 }, -- selected text (Blip list, menu ecc)
            MenuUnselected = { r = 75, g = 0, b = 130, a = 150 }, -- unselected menu (Blip list, menu ecc)
            MapBackground = { r = 255, g = 173, b = 0, a = 255 }, -- map background (255 - Transparent)
            OtherLines = { r = 255, g = 173, b = 0, a = 200 } -- Color for other lines and menu selection bar
        }
    }
}

