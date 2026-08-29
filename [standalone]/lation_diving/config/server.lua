return {
    ----------------------------------------------
    --        💬 Setup logging system
    ----------------------------------------------

    logs = {
        -- What logging service do you want to use?
        -- Available options: 'fivemanage', 'fivemerr', 'discord' & 'none'
        -- It is highly recommended to use a proper logging service such as Fivemanage or Fivemerr
        service = 'discord',
        -- Do you want to include screenshots with your logs?
        -- This is only applicable to Fivemanage and Fivemerr
        screenshots = true,
        -- You can enable (true) or disable (true) specific player events to log here
        events = {
            -- Log when a player picks up a crate
            crateFound = true,
            -- Log when a player opens a crate
            crateOpened = true,
            -- Log when a player makes a purchase from The Dive Shop
            itemPurchased = true,
            -- Log when a player sells an item to The Pawn Shop
            itemPawned = true,
            -- Log when a player rents a boat
            boatRented = true,
            -- Log when a player returns a rented boat
            boatReturned = true,
        },
        -- If service = 'discord', you can customize the webhook data here
        -- If not using Discord, this section can be ignored
        discord = {
            -- The name of the webhook
            name = 'Scuba Diving',
            -- The webhook link
            link = 'YOUR_DISCORD_WEBHOOK_URL',
            -- The webhook profile image
            image = 'https://i.imgur.com/ILTkWBh.png',
            -- The webhook footer image
            footer = 'https://i.imgur.com/ILTkWBh.png'
        }
    },

}