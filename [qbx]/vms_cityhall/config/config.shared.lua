SH = {}

SH.GetVehiclePrice = function(model)
    if not model then return nil end;
    local model = tonumber(model) and model or joaat(model)
    
    for k, v in pairs(Config.VehiclePrices) do
		if model == k then
			return v;
		end
	end

	return nil;
end