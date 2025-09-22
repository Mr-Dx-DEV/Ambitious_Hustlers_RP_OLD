RegisterCommand('houseMenu', function()
    if EditorCamera then return end
    if not CurrentHouse then return Notification(Lang('HOUSING_NOTIFICATION_NO_HOUSE'), 'error') end
    local house = Config.Houses[CurrentHouse]
    if house.apartmentNumber and not EnteredHouse then
        OpenMyApartments()
        return
    end
    if not CurrentHouseData.haskey and not CurrentHouseData.isOfficialOwner then return Notification(Lang('HOUSING_NOTIFICATION_NO_KEYS'), 'error') end
    OpenManagement(house)
end, false)

RegisterKeyMapping('houseMenu', 'House Menu', 'keyboard', Config.OpenHouseMenu)
