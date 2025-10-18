if GetResourceState("ox_target") ~= "started" then return end

exports.ox_target:addGlobalVehicle({
    {
        name = 'ox_target:driverF',
        icon = 'fa-solid fa-magnifying-glass',
        label = 'Sweep Car For Evidence',
        distance = 2,
        onSelect = function(data)
            local entity = data.entity
            local plate = GetVehicleNumberPlateText(entity)
            CheckCarEvidence(string.gsub(plate, '^%s*(.-)%s*$', '%1'), entity)
        end,
        canInteract = function()
            return CanAccess()
        end,
    },
}, {
    distance = 2.5,
})

if Config.InteractType == "target" then
    for k, v in pairs(Config.LocationsToAccessCrimeScenes) do
        exports.ox_target:addSphereZone({
            coords = v,
            radius = 2.0,
            options = {
                {
                    name = 'ox_target:evidence_'..k,
                    icon = 'fa-solid fa-magnifying-glass',
                    label = 'Evidence',
                    onSelect = function()
                        if not CanAccess() then
                            ShowNotification(Locales["no_access"], "error")
                            return
                        end
                        Wait(100)
                        OpenEvidenceUI()
                    end,
                },
            },
        })
    end
end