PlayerJob, Blips = {}, {}

onPlayerLoaded(function()
	local PlayerInfo = getPlayer()
	PlayerJob = PlayerInfo.jobInfo
	PlayerGang = PlayerInfo.gangInfo

	for _, v in pairs(Config.Main.JobRoles) do
		if hasJob(v) then
			havejob = true
			onDuty = getPlayer().onDuty or false
		end
	end

	Wait(500)
	if GetVehiclePedIsIn(PlayerPedId()) ~= 0 then
		TriggerEvent(getScript()..":Client:EnteredVehicle")
	end

	--Wait(3000)
	makeLoc()

end, true)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function()
	local oldJobName = PlayerJob.name
	local PlayerJob = getPlayer().jobInfo
	local hadJob = false
	if not PlayerJob then
		PlayerJob = getPlayer().jobInfo
	end
	onDuty = PlayerJob.onDuty
	for _, loc in pairs(Locations) do
		if loc.job == oldJobName then hadJob = true end
		if loc.blip then
			if loc.job == PlayerJob.name then
				hadJob = false
				--TriggerServerEvent(getScript()..":server:setOnDuty", PlayerJob.name, PlayerJob.onduty)
			end
		end
	end
	if hadJob then
		--TriggerServerEvent(getScript()..":server:setOnDuty", oldJobName, false)
	end
end)

RegisterNetEvent("QBCore:Client:SetDuty", function()
	local PlayerJob = getPlayer().jobInfo
	onDuty = PlayerJob.onDuty
end)


onResourceStop(function()
	Helper.removePropHoldCoolDown()
end, true)