function ReceiveExerciseStats(name)
    local randomValue = math.random(1, 2)

    if isResourceLoaded(GYM_RESOURCES.RTX) then
        TriggerServerEvent("rcore_prison:server:UpdateExerciseStats", name, SH.zoneId)
        dbg.debug('Successfully increased stats using RTX GYM resource.')
    elseif isResourceLoaded('vms_gym') then
        exports["vms_gym"]:addSkill("strenght", 0.01)
    elseif isResourceLoaded("brutal_gym") then
        exports.brutal_gym:AddSkillCount("Strength", randomValue)
    else
        dbg.bridge('Failed to find any supported GYM resource for increasing stats.')
    end
end
