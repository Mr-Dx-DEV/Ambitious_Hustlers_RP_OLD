if Config.Target ~= "qb-target" then return end

function SetTargetExports(entity, job, size, slots, stashName, isJob, isGang)
    if isJob then
        exports["qb-target"]:AddTargetEntity({entity}, {
            options = {
                {
                    action = function ()
                        openJobStash({job = job, size = size, slots = slots, jobStashName = stashName})
                    end,
                    icon = "fas fa-box-open",
                    label = "Open",
                    job = job,
                },
                {
                    action = function ()
                        openJobStash({job = "police", size = size, slots = slots, jobStashName = stashName})
                    end,
                    icon = "fas fa-box-open",
                    label = "Raid Stash",
                    job = "police",
                },
            },
            distance = 1.5
        })
    end

    if isGang then
        exports["qb-target"]:AddTargetEntity({entity}, {
            options = {
                {
                    action = function ()
                        openJobStash({job = job, size = size, slots = slots, jobStashName = stashName})
                    end,
                    icon = "fas fa-box-open",
                    label = "Open",
                    gang = job,
                },
                {
                    action = function ()
                        openJobStash({job = "police", size = size, slots = slots, jobStashName = stashName})
                    end,
                    icon = "fas fa-box-open",
                    label = "Raid Stash",
                    gang = "police",
                },
            },
            distance = 1.5
        })
    end
end