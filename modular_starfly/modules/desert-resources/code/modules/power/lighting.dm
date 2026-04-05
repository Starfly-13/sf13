/obj/machinery/light/street
	name = "street light"
	icon = 'modular_starfly/modules/desert-resources/icons/obj/lighting_32x50.dmi'
	base_state = "streetlight"
	icon_state= "streetlight-on"
	desc = "A cheaper-quality streetlight used in small towns."
	layer = ABOVE_OBJ_LAYER
	brightness = 10

obj/machinery/light/street/broken
	status = LIGHT_BROKEN
	icon_state = "streetlight-broken"

obj/machinery/light/street/pawn
	name = "pawn shop lamp"
	base_state = "pawnlight"
	icon_state = "pawnlight-on"
	desc = "Traditionally, pawn shops used to have lamps featuring three bulbs by their signs. Many pawn shops still use imagery featuring these lamps to this day."