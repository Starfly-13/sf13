#ifdef STARFLY13_MODULE_RKSH_UNATHI_ENABLED
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

/// Lizard subspecies: ASHWALKERS
/datum/species/lizard/ashwalker
	name = "Rksh'Unathi"
	id = SPECIES_ASHWALKER
	species_age_min = 18
	species_age_max = 300
	examine_limb_id = SPECIES_LIZARD
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS, NO_UNDERWEAR)
	inherent_traits = list(TRAIT_CHUNKYFINGERS,TRAIT_NOBREATH)
	species_language_holder = /datum/language_holder/lizard/ash
	loreblurb = "The Rksh'Unathi are a mysterious reptilian species scattered across numerous planets, but only where the Necropolis' tendrils have scarred the land. While they are genetically related to the other species of Unathi, it is unclear how they came to be."

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_RKSH_UNATHI_ENABLED
