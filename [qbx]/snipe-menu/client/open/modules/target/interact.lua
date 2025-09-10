if Config.Target ~= "interact" then return end
function SetTargetExports(entity, job, size, slots, stashName, isJob, isGang)
    local options = {
        {
            label = "Open",
            action = function()
                openJobStash({job = job, size = size, slots = slots, jobStashName = stashName})
            end,
        },
    }

    options[#options + 1] = {
        label = "Raid Stash",
        action = function()
            openJobStash({job = "police", size = size, slots = slots, jobStashName = stashName})
        end,
        canInteract = function()
            return PlayerJob.name == "police"
        end,
    }
    
    if isJob then
        exports.interact:AddLocalEntityInteraction({
            entity = entity,
            offset = vector3(0.0, 0.0, 0.2),
            distance  = 6.0,
            interactDst = 2.0, -- optional
            ignoreLos = true, -- optional
            groups = {
                [job] = 0, -- Jobname | Job grade
                ["police"] = 0, -- Raid stash for police
            },
            options = options
        })
    end
end