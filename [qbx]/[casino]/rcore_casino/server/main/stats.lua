local statsInited = false
local function setupStats()
    if not statsInited then
        statsInited = true
        TriggerEvent('rcore_stats:api:ensureCategory', 'casino', 'Casino', function()
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_slots_time_spent",
                "Casino - Slots - Time Spent", "player", "time", "casino", true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_slots_time_spent_ach1",
                        "Slot Rookie", "Play slots for 10 minutes. Getting the hang of it!", "joystick",
                        "rcore_casino_slots_time_spent", 10)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_slots_time_spent_ach2",
                        "Slot Enthusiast", "Play slots for 30 minutes. You're on a roll!", "joystick",
                        "rcore_casino_slots_time_spent", 30)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_slots_time_spent_ach3",
                        "Slot Addict", "Play slots for 60 minutes. Can't stop, won't stop!", "joystick",
                        "rcore_casino_slots_time_spent", 60)
                end)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_slots_wins", "Casino - Slots - Wins", "player",
                nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_slots_loss", "Casino - Slots - Loss", "player",
                nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_slots_games_played",
                "Casino - Slots - Games Played", "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_slots_profit",
                "Casino - Slots - Winnings In Total", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_slots_profitreal", "Casino - Slots - Profit",
                "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_slots_jackpots", "Casino - Slots - Jackpots",
                "player", nil, "casino", true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_slots_jackpots_ach1",
                        "Slot Machine Dream", "Hit the jackpot on the slots.", "party-popper",
                        "rcore_casino_slots_jackpots", 1)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_slots_jackpots_ach2",
                        "Triple Threat", "Win the slots jackpot three times. Luck is on your side!", "party-popper",
                        "rcore_casino_slots_jackpots", 3)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_slots_jackpots_ach3",
                        "High Roller Hustler", "Score five jackpots on the slots. You own the casino!", "party-popper",
                        "rcore_casino_slots_jackpots", 5)
                end)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_roulette_time_spent",
                "Casino - Roulette - Time Spent", "player", "time", "casino", true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_roulette_time_spent_ach1",
                        "Roulette Novice", "Play roulette for 10 minutes. Feeling the spin!", "spade",
                        "rcore_casino_roulette_time_spent", 10)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_roulette_time_spent_ach2",
                        "Roulette Fanatic", "Play roulette for 30 minutes. Spin to win!", "spade",
                        "rcore_casino_roulette_time_spent", 30)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_roulette_time_spent_ach3",
                        "Roulette Pro", "Play roulette for 60 minutes. The wheel bows to you!", "spade",
                        "rcore_casino_roulette_time_spent", 60)
                end)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_roulette_wins", "Casino - Roulette - Wins",
                "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_roulette_loss", "Casino - Roulette - Loss",
                "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_roulette_games_played",
                "Casino - Roulette - Games Played", "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_roulette_profit",
                "Casino - Roulette - Winnings In Total", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_roulette_profitreal",
                "Casino - Roulette - Profit", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_poker_time_spent",
                "Casino - Poker - Time Spent", "player", "time", "casino", true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_poker_time_spent_ach1",
                        "Poker Beginner", "Play poker for 10 minutes. Learning the ropes!", "diamond",
                        "rcore_casino_poker_time_spent", 10)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_poker_time_spent_ach2",
                        "Poker Enthusiast", "Play poker for 30 minutes. Card shark in the making!", "diamond",
                        "rcore_casino_poker_time_spent", 30)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_poker_time_spent_ach3",
                        "Poker Master", "Play poker for 60 minutes. Bluffing legend!", "diamond",
                        "rcore_casino_poker_time_spent", 60)
                end)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_poker_wins", "Casino - Poker - Wins", "player",
                nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_poker_loss", "Casino - Poker - Loss", "player",
                nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_poker_games_played",
                "Casino - Poker - Games Played", "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_poker_profit",
                "Casino - Poker - Winnings In Total", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_poker_profitreal",
                "Casino - Roulette - Profit", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_bj_time_spent",
                "Casino - Blackjack - Time Spent", "player", "time", "casino", true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_bj_time_spent_ach1",
                        "Blackjack Newbie", "Play blackjack for 10 minutes. Hit or stand?", "club",
                        "rcore_casino_bj_time_spent", 10)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_bj_time_spent_ach2",
                        "Blackjack Buff", "Play blackjack for 30 minutes. Counting cards!", "club",
                        "rcore_casino_bj_time_spent", 30)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_bj_time_spent_ach3",
                        "Blackjack Ace", "Play blackjack for 60 minutes. The house fears you!", "club",
                        "rcore_casino_bj_time_spent", 60)
                end)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_bj_wins", "Casino - Blackjack - Wins",
                "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_bj_loss", "Casino - Blackjack - Loss",
                "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_bj_games_played",
                "Casino - Blackjack - Games Played", "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_bj_profit",
                "Casino - Blackjack - Winnings In Total", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_bj_profitreal", "Casino - Blackjack - Profit",
                "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_track_time_spent",
                "Casino - Inside Track - Time Spent", "player", "time", "casino", true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_track_time_spent_ach1",
                        "Pony Rookie", "Play Inside Track for 10 minutes. Betting on the ponies!", "paw-print",
                        "rcore_casino_track_time_spent", 10)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_track_time_spent_ach2",
                        "Track Enthusiast", "Play Inside Track for 30 minutes. Eye on the prize!", "paw-print",
                        "rcore_casino_track_time_spent", 30)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_track_time_spent_ach3",
                        "Derby Dominator", "Play Inside Track for 60 minutes. The horse whisperer!", "paw-print",
                        "rcore_casino_track_time_spent", 60)
                end)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_track_wins", "Casino - Inside Track - Wins",
                "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_track_loss", "Casino - Inside Track - Loss",
                "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_track_games_played",
                "Casino - Inside Track - Games Played", "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_track_profit",
                "Casino - Inside Track - Winnings In Total", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_track_profitreal",
                "Casino - Inside Track - Profit", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_wheel_time_spent",
                "Casino - Wheel - Time Spent", "player", "time", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_wheel_wins", "Casino - Wheel - Wins", "player",
                nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_wheel_loss", "Casino - Wheel - Loss", "player",
                nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_wheel_games_played",
                "Casino - Wheel - Games Played", "player", nil, "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_wheel_profit",
                "Casino - Wheel - Winnings In Total", "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_wheel_profitreal", "Casino - Wheel - Profit",
                "player", "finance", "casino", true, nil)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_cashier_used", "Casino - Cashier Used",
                "player", nil, "casino", true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_cashier_used_ach1", "Quick Cash",
                        "Visit the cashier 10 times. Cashing in!", "hand-coins", "rcore_casino_cashier_used", 10)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_cashier_used_ach2",
                        "Frequent Flyer", "Use the cashier 50 times. You're a regular!", "hand-coins",
                        "rcore_casino_cashier_used", 50)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_cashier_used_ach3", "Money Manager",
                        "Cash out 100 times. Master of your money!", "hand-coins", "rcore_casino_cashier_used", 100)
                end)
            TriggerEvent('rcore_stats:api:ensureStatType', "rcore_casino_visits", "Casino - Visits", "player", nil,
                "casino", true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_visits_ach1", "Casino Visitor",
                        "Visit the casino 10 times. Getting a taste of the high life!", "coins", "rcore_casino_visits",
                        10)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_visits_ach2", "Casino Regular",
                        "Visit the casino 50 times. A familiar face at the tables!", "coins", "rcore_casino_visits", 50)
                    TriggerEvent('rcore_stats:api:ensureAchievement', "rcore_casino_visits_ach3", "Casino VIP",
                        "Visit the casino 100 times. The casino is your second home!", "coins", "rcore_casino_visits",
                        100)
                end)
        end)
    end
end

if Config.Rcore_Stats then
    CreateThread(function()
        if GetResourceState("rcore_stats") == "started" or GetResourceState("rcore_stats") == "starting" then
            while not statsInited do
                TriggerEvent('rcore_stats:api:isReady', function(isReady)
                    if isReady then
                        setupStats()
                    end
                end)
                Wait(1000)
            end
        end
    end, "rcore_stats api is ready")
end
