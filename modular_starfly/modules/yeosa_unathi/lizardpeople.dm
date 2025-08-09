#ifdef STARFLY13_MODULE_YEOSA_UNATHI_ENABLED
//---------------------------------------------------------------------------------------------------------------------

// lizardpeople.dm
// Copyright 2023 LectroNyx.
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

/// Lizard subspecies: YEOSA'UNATHI
/datum/species/lizard/yeosa
	name = "Yeosa'Unathi"
	id = SPECIES_YEOSA
	species_age_min = 22
	species_age_max = 200
	examine_limb_id = SPECIES_LIZARD
	inherent_traits = list(TRAIT_ALCOHOL_TOLERANCE)
	species_language_holder = /datum/language_holder/yeosa
	coldmod = 2
	heatmod = 0.7
	burnmod = 1.25
	siemens_coeff = 1.25
//---------------------------------------------------------------------------------------------------------------------
// STARFLY EDIT - ADDITION BEGIN
#ifdef STARFLY13_MODULE_OXYGEN_DAMAGE_MOD_ENABLED
//---------------------------------------------------------------------------------------------------------------------
	oxymod = 0.75
//---------------------------------------------------------------------------------------------------------------------
#endif // #ifndef STARFLY13_MODULE_OXYGEN_DAMAGE_MOD_ENABLED
// STARFLY EDIT - ADDITION END
//---------------------------------------------------------------------------------------------------------------------
	grad_color="#fffec4"

	// Yeosa are more cold-blooded than Sinta, and thus should be less cozy in bad temps.
	bodytemp_heat_damage_limit = HUMAN_BODYTEMP_HEAT_DAMAGE_LIMIT + 10 // This puts lizards 10 above lavaland max heat for ash lizards.
	bodytemp_cold_damage_limit = HUMAN_BODYTEMP_COLD_DAMAGE_LIMIT - 5
	loreblurb = "The Yeosa'Unathi are a cold-blooded reptilian species originating from the depths of the ocean on the planet Moghes, in the Uuoea-Esa system. Most Yeosa'Unathi will seldom step on the surface except to sunbathe - this can leave the impression of laziness and lethargy on those who interact with them. However, their culture largely mirrors that of the Sinta, and they are equally proud."

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_YEOSA_UNATHI_ENABLED
