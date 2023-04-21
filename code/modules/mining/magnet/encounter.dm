/datum/mining_encounter
	var/name = null
	var/info = null
	var/rarity = 0
	var/no_pick = 0	// If this is 1, the encounter will not be randomly picked and is not sorted into rarity lists.

	proc/generate(var/obj/magnet_target_marker/target)
		return 0

/datum/mining_encounter/asteroid_small
	name = "Small Asteroid"
	rarity = -1

	generate(var/obj/magnet_target_marker/target)
		if(..())
			return
		var/list/generated_turfs
		var/size = 3
		var/magnetic_center = mining_controls.magnetic_center
		var/area_restriction = /area/mining/magnet
		if(target)
			magnetic_center = target.magnetic_center
			area_restriction = null
			size = min(size, min(target.width, target.height))

		// Something something generate turfs here
