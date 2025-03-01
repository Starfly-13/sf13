#ifdef STARFLY13_MODULE_ADMIN_VERB_FREEZE
//---------------------------------------------------------------------------------------------------------------------

// mecha.dm
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

/obj/mecha
	/// flag: has this mech been frozen by an admin?
	var/admin_frozen = FALSE

/obj/mecha/relaymove(mob/living/user, direction)
	// if the mech has been frozen by an admin, don't move
	if(admin_frozen)
		return
	// otherwise, relaymove as normal
	return ..()

/obj/mecha/MouseDrop_T(mob/M, mob/user)
	// if the mech has been frozen by an admin, don't allow entry
	if(admin_frozen)
		to_chat(user, "<span class='warning'>Do not enter Admin-Frozen mechs.</span>")
		return TRUE
	// otherwise, enter as normal
	return ..()

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_ADMIN_VERB_FREEZE
