if Config.Framework == 2 then
    QBCore = nil
    PlayerData = {}

    function UpdatePlayerDataForQBCore()
        local pData = QBCore.Functions.GetPlayerData()

        local jobLabel = "none"
        local jobName = "none"
        local gradeName = "none"
        local grade = 0

        local grade_label = "none"
        local grade_salary = 0

        if pData.job then
            jobName = pData.job.name or "none"
            jobLabel = pData.job.label or "none"

            -- i am not sure if i should check if its nil or not so i will just make sure so it wont break anything.
            if pData.job.grade then
                local gradeData = pData.job.grade
                gradeName = gradeData.name or "grade name does not exists"

                if gradeData.level then
                    grade = gradeData.level
                end

                if gradeData.grade_label then
                    grade_label = gradeData.grade_label or "none"
                end

                if gradeData.grade_salary then
                    grade_salary = gradeData.grade_salary or 0
                end
            end
        end

        PlayerData = {
            job = {
                id = -1,
                name = jobName,
                label = jobLabel,

                grade_name = gradeName,
                grade_label = grade_label,
                grade_salary = grade_salary,
                grade = grade,

                skin_male = {},
                skin_female = {},
            }
        }
    end

    CreateThread(function()
        QBCore = Config.GetQBCoreObject()
        if QBCore and QBCore.Functions.GetPlayerData() then
            UpdatePlayerDataForQBCore()
        end
    end)

    RegisterNetEvent(Config.OnPlayerLoaded, function()
        UpdatePlayerDataForQBCore()
    end)

    RegisterNetEvent(Config.OnJobUpdate, function()
        UpdatePlayerDataForQBCore()
    end)

    function isAtJob(name)
        if name == nil then
            return true
        end
        if not PlayerData then
            return false
        end
        return PlayerData.job.name == name
    end
end