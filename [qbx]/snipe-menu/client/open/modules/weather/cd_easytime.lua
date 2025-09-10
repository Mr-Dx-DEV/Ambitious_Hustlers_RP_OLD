if Config.WeatherScript ~= "cd_easytime" then return end
function SetWeather(weatherName)
    local values = {
        instantweather = true,
        weather = weatherName,
        dynamic = exports["cd_easytime"]:GetWeather().dynamic,
        instanttime = true,
        hours = exports["cd_easytime"]:GetWeather().hours,
        mins = exports["cd_easytime"]:GetWeather().mins,
        freeze = exports["cd_easytime"]:GetWeather().freeze,
        tsunami = exports["cd_easytime"]:GetWeather().tsunami,
        blackout = exports["cd_easytime"]:GetWeather().blackout
    }
    TriggerServerEvent('cd_easytime:ForceUpdate', values)
end

function SetTime(hours, mins)
    local values = {
        instantweather = false,
        weather = exports["cd_easytime"]:GetWeather().weather,
        dynamic = exports["cd_easytime"]:GetWeather().dynamic,
        instanttime = true,
        hours = hours,
        mins = mins,
        freeze = exports["cd_easytime"]:GetWeather().freeze,
        tsunami = exports["cd_easytime"]:GetWeather().tsunami,
        blackout = exports["cd_easytime"]:GetWeather().blackout
    }
    TriggerServerEvent('cd_easytime:ForceUpdate', values)
end