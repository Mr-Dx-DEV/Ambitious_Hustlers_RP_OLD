if GetResourceState("qtarget") ~= "started" then return end
if GetResourceState("ox_target") == "started" then return end
exports["qtarget"]:Vehicle({
    options = { 
        { 
            icon = 'fas fa-magnifying-glass', 
            label = 'Sweep Car For Evidence', 
            action = function(entity)
                local plate = GetVehicleNumberPlateText(entity)
                CheckCarEvidence(string.gsub(plate, '^%s*(.-)%s*$', '%1'), entity)
            end,
            canInteract = function(entity, distance, data)
                return CanAccess()
            end,
        }
    },
    distance = 2.5,
})

if Config.InteractType == "target" then
    for k, v in pairs(Config.LocationsToAccessCrimeScenes) do
        exports['qtarget']:AddCircleZone("evidence_"..k, v, 2.0, {
            name = "evidence_"..k,
            debugPoly = false,
            useZ = true,
        }, {
            options = {
                {
                    icon = 'fas fa-magnifying-glass',
                    label = 'Evidence',
                    action = function()
                        if not CanAccess() then
                            ShowNotification(Locales["no_access"], "error")
                            return
                        end
                        Wait(100)
                        OpenEvidenceUI()
                    end,
                },
            },
            distance = 2.5
        })
    end
end