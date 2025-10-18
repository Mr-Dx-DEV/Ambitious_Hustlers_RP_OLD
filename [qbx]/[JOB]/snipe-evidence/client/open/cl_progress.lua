function DoProgress(cb, progressData)

    local propOne = {}
    local propTwo = {}
    if Config.ProgressBar == "qb" then
        if progressData.prop then
            if progressData.prop[1] then
                propOne = {
                    model = progressData.prop[1].model,
                    bone = progressData.prop[1].bone,
                    coords = progressData.prop[1].pos,
                    rotation = progressData.prop[1].rot,
                }
            end
    
            if progressData.prop[2] then
                propTwo = {
                    model = progressData.prop[2].model,
                    bone = progressData.prop[2].bone,
                    coords = progressData.prop[2].pos,
                    rotation = progressData.prop[2].rot,
                }
            end
        end
        QBCore.Functions.Progressbar("progress-"..progressData.progressbar, progressData.progressbar,  (progressData.progresstime), false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict =  progressData.dictionary,
            anim = progressData.animname,
            flags = 49,
        }, propOne, propTwo, function() -- Done
            cb(true)
        end, function()
            cb(false)
        end)
    else
        if lib.progressCircle({
			duration = progressData.progresstime,
			label = progressData.progressbar,
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
			},
			position= 'bottom',
			anim = {
				dict = progressData.dictionary,
				clip =  progressData.animname,
			},
            prop = progressData.prop,
		}) then 
            StopAnimTask(PlayerPedId(), progressData.dictionary, progressData.animname, 1.0)
            cb(true)
		else 
			cb(false)
		end
    end
end