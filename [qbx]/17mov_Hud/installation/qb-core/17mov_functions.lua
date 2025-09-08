local oldShowNotification = QBCore.Functions.Notify

QBCore.Functions.Notify = function(text, texttype, length)
    local message, notifyTitle

    if texttype == "primary" then texttype = "info" end

    if texttype == "ambulance" or texttype == "police" then
        oldShowNotification(text, texttype, length)
    end

    if type(text) == "table" then
        notifyTitle = text.caption
        message = text.text
    else
        message = text
    end

    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowNotification(message, texttype, notifyTitle, length)
    else
        oldShowNotification(text, texttype, length)
    end
end

local oldProgressbar = QBCore.Functions.Progressbar

QBCore.Functions.Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:StartProgress({
            duration = duration,
            label = label,
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            controlDisables = disableControls,
            animation = animation,
            prop = prop,
            propTwo = propTwo,
        }, nil, nil, function(cancelled)
            if not cancelled then
                if onFinish then
                    onFinish()
                end
            else
                if onCancel then
                    onCancel()
                end
            end
        end)
    else
        oldProgressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    end
end

local function hideText()
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:HideHelpNotification()
    else
        SendNUIMessage({
            action = 'HIDE_TEXT',
        })
    end
end

local function drawText(text, position)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowHelpNotification(text)
    else
        if type(position) ~= 'string' then position = 'left' end

        SendNUIMessage({
            action = 'DRAW_TEXT',
            data = {
                text = text,
                position = position
            }
        })
    end
end

local function changeText(text, position)
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:ShowHelpNotification(text)
    else
        if type(position) ~= 'string' then position = 'left' end

        SendNUIMessage({
            action = 'CHANGE_TEXT',
            data = {
                text = text,
                position = position
            }
        })
    end
end

local function keyPressed()
    if GetResourceState("17mov_Hud") == "started" then
        exports["17mov_Hud"]:HideHelpNotification()
    else
        CreateThread(function() -- Not sure if a thread is needed but why not eh?
            SendNUIMessage({
                action = 'KEY_PRESSED',
            })
            Wait(500)
            hideText()
        end)
    end
end

RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    drawText(text, position)
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    changeText(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    hideText()
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    keyPressed()
end)

exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', hideText)
exports('KeyPressed', keyPressed)