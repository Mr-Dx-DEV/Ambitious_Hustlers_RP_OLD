function CheckIfJobsIsGroup(job, jobLabel)

    -- check if job is in Config.GroupJobs
    for k, v in pairs(Config.GroupJobs) do
        for _, v2 in pairs(v.jobs) do
            if job == v2 then
                job = k
                jobLabel = v.label
                break
            end
        end
    end
    local returnData = {
        id = job,
        display_name = jobLabel,
        ibanId = uniqueIdsJobGang[job],
        balance = jobGangAccounts[job] or 0,
    }
    return returnData
end

function GetGroupNameBasedOnJob(job)
    for k, v in pairs(Config.GroupJobs) do
        for _, v2 in pairs(v.jobs) do
            if job == v2 then
                return k
            end
        end
    end
    return job
end