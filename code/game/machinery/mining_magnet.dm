/obj/machinery/magnet_chassis
	name = "magnet chassis"
	desc = "The rig of a high powered magnet for optimal asteroid attraction."
	icon = 'icons/obj/large/64x64.dmi'
	icon_state = "chassis"
	opacity = 0
	density = 1
	var/obj/machinery/mining_magnet/linked_magnet = null

/obj/machinery/magnet_chassis/New()
	..()
	SPAWN(0)
		src.update_dir()
		for(var/obj/machinery/mining_magnet/magnet in range(1, src))
			linked_magnet = magnet
			magnet.linked_chassis = src
			break

/obj/machinery/magnet_chassis/Destroy()
	if(linked_magnet)
		qdel(linked_magnet)
	linked_magnet = null
	. = ..()

/obj/machinery/magnet_chassis/attackby(obj/item/attack_by, mob/user)
	if (istype(attack_by, /obj/item/magnet_parts))
		if(istype(src.linked_magnet))
			to_chat(user, span_alert("There's already a magnet installed in this chassis."))
			return

