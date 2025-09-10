if Config.WeatherScript ~= "renewed" then return end

function SetWeather(weatherName)
    TriggerServerEvent("qb-weathersync:server:setWeather", weatherName) -- used to change the weather if you use qb-weathersync (edit if you use another weather script)
end

function SetTime(hours, mins)
    TriggerServerEvent("qb-weathersync:server:setTime", hours, mins) -- used to change the time if you use qb-weathersync (edit if you use another weather script)
end