#ifdef STARFLY13_MODULE_ADMIN_VERB_FREEZE_ENABLED
//---------------------------------------------------------------------------------------------------------------------

// freeze.dm
// Copyright 2025 Patrick Meade.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------

// Ported from Ported from NSS Pheonix (Unbound Travels) to Paradise Station
// Ported from Paradise Station to STARFLY-13
// Allows admins to right click on any mob/mech and Admin Freeze them in place.

/// A list of admin-frozen atoms.
GLOBAL_LIST_EMPTY(frozen_atom_list)

/// Client verb allowing Admins to freeze mobs
/client/proc/freeze(atom/movable/M)
	set name = "\[Admin\] Freeze"
	set category = null

	if(!check_rights(R_ADMIN))
		return

	M.admin_freeze(src)

/// Created here as a base proc. Override as needed for any type of object or mob you want able to be frozen.
/atom/movable/proc/admin_freeze(client/admin)
	to_chat(admin, "<span class='warning'>Freeze is not able to be called on this type of object.</span>")
	return

/// Admin freeze a /mob/living
/mob/living/admin_freeze(client/admin, skip_overlays = FALSE, mech = null)
	if(!istype(admin))
		return

	if(!(src in GLOB.frozen_atom_list))
		GLOB.frozen_atom_list += src

		var/obj/effect/overlay/adminoverlay/AO = new
		if(!skip_overlays)
			overlays += AO

		anchored = TRUE
		admin_prev_sleeping = AmountSleeping()
		admin_frozen = AO
		PermaSleeping()

	else
		GLOB.frozen_atom_list -= src

		if(!skip_overlays)
			overlays -= admin_frozen

		anchored = FALSE
		admin_frozen = null
		set_sleeping(admin_prev_sleeping, TRUE)
		admin_prev_sleeping = null

	to_chat(src, "<b><font color= red>You have been [admin_frozen ? "frozen" : "unfrozen"] by [admin]</b></font>")
	message_admins("<span class='notice'>[key_name_admin(admin)] [admin_frozen ? "froze" : "unfroze"] [key_name_admin(src)] [mech ? "in a [mech]" : ""]</span>")
	log_admin("[key_name(admin)] [admin_frozen ? "froze" : "unfroze"] [key_name(src)] [mech ? "in a [mech]" : ""]")
	update_icons()

	return admin_frozen

//-----------------------------------------------------------------------------

/mob/living/simple_animal
	var/admin_prev_health = null

/// Admin freeze a /mob/living/simple_animal
/mob/living/simple_animal/admin_freeze(admin)
	if(..()) // The result of the parent call here will be the value of the mob's `frozen` variable after they get (un)frozen.
		admin_prev_health = health
		health = 0
	else
		revive()
		overlays.Cut()

/// Admin freeze a /mob/living/simple_animal/slime
/mob/living/simple_animal/slime/admin_freeze(admin)
	if(..()) // The result of the parent call here will be the value of the mob's `frozen` variable after they get (un)frozen.
		adjustHealth(1000) //arbitrary large value
	else
		revive()

//-----------------------------------------------------------------------------

/// Admin freeze an /obj/mecha
/obj/mecha/admin_freeze(client/admin)
	var/obj/effect/overlay/adminoverlay/freeze_overlay = new
	if(!admin_frozen)
		GLOB.frozen_atom_list += src
		admin_frozen = TRUE
		overlays += freeze_overlay
	else
		GLOB.frozen_atom_list -= src
		admin_frozen = FALSE
		overlays -= freeze_overlay

	if(occupant)
		occupant.admin_freeze(admin, mech = name) // We also want to freeze the driver of the mech.
	else
		message_admins("<span class='notice'>[key_name_admin(admin)] [admin_frozen ? "froze" : "unfroze"] an empty [name]</span>")
		log_admin("[key_name(admin)] [admin_frozen ? "froze" : "unfroze"] an empty [name]")

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_ADMIN_VERB_FREEZE_ENABLED
