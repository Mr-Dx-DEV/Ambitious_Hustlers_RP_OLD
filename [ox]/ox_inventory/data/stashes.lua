return {
	{
		coords = vec3(446.27, -998.73, 30.71),
		target = {
			loc = vec3(446.27, -998.73, 30.71),
			length = 1.5,
			width = 5.6,
			heading = 194.84,
			minZ = 29.02,
			maxZ = 30.90,
			label = 'Open personal locker'
		},
		name = 'policelocker',
		label = 'Personal locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = shared.police
	},
	{
		coords = vec3(2808.87, 4744.19, 47.93),
		target = {
			loc = vec3(2808.87, 4744.19, 47.93),
			length = 1.7,
			width = 5.6,
			heading = 293.33,
			minZ = 47.01,
			maxZ = 48.90,
			label = 'Open personal locker'
		},
		name = 'sahp1locker',
		label = 'SAHP1 locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = shared.police
	},
	{
		coords = vec3(301.3, -600.23, 43.28),
		target = {
			loc = vec3(301.82, -600.99, 43.29),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Open personal locker'
		},
		name = 'emslocker',
		label = 'Personal Locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},
}
