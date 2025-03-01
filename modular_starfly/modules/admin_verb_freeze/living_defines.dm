#ifdef STARFLY13_MODULE_ADMIN_VERB_FREEZE
//---------------------------------------------------------------------------------------------------------------------

// living_defines.dm
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

/mob/living
	/// Used for preventing attacks on admin-frozen mobs.
	var/admin_frozen = null
	/// Used for keeping track of previous sleeping value with admin freeze.
	var/admin_prev_sleeping = 0

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_ADMIN_VERB_FREEZE
