function StartAlarm()
    if isResourcePresentProvideless('xsound') then
        exports.xsound:PlayUrlPos("PRISON_BREAK", "https://youtu.be/GWXLPu8Ky9k?si=ErQ3MFio0IF0MRKL", 0.1, vec3(1696.727, 2565.864, 45.564), true)
        exports.xsound:Distance("PRISON_BREAK", 150.0) 
    end
end

function StopAlarm()
    if isResourcePresentProvideless('xsound') then
        exports.xsound:Destroy("PRISON_BREAK")
    end
end
