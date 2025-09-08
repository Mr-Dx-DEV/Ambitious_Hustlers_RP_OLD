local oldShowNotification = ESX.ShowNotification

ESX.ShowNotification = function(message, notifyType, length)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowNotification(message, notifyType, nil, length)
    else
        oldShowNotification(message, notifyType, length)
    end
end

local oldShowHelpNotification = ESX.ShowHelpNotification

ESX.ShowHelpNotification = function(message)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowHelpNotificationWhile(message)
    else
        oldShowHelpNotification(message)
    end
end

local oldTextUI = ESX.TextUI

ESX.TextUI = function(message, notifyType)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowHelpNotificationWhile(message)
    else
        oldTextUI(message)
    end
end

local oldProgressbar = ESX.Progressbar

ESX.Progressbar = function(message, length, Options)
    if GetResourceState("17mov_Hud") == "started" then
        local options = {
            label = message,
            duration = length,
        }

        if Options then
            if Options.animation then
                if Options.animation.type == "anim" then
                    options.animation = {
                        animDict = Options.animation.dict,
                        anim = Options.animation.lib,
                        flags = 1
                    }
                elseif Options.animation.type == "Scenario" then
                    options.animation = {
                        task = Options.animation.Scenario,
                    }
                end
            end
        end

        exports["17mov_Hud"]:StartProgress(options)
    else
        oldProgressbar(message)
    end
end