if Config.Target ~= "ox_target" then return end
function SetTargetExports(entity, job, size, slots, stashName, isJob, isGang)
    local options = {
        {
            onSelect = function ()
                openJobStash({job = job, size = size, slots = slots, jobStashName = stashName})
            end,
            icon = "fas fa-box-open",
            label = "Open",
            groups = job ~= "all" and job or nil,
        },
        {
            onSelect = function ()
                openJobStash({job = "police", size = size, slots = slots, jobStashName = stashName})
            end,
            icon = "fas fa-box-open",
            label = "Raid Stash",
            groups = "police",
        }
    }
    exports.ox_target:addLocalEntity(entity, options)
end