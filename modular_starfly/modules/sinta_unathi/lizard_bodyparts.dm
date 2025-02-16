#ifdef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
//---------------------------------------------------------------------------------------------------------------------

// lizard_bodyparts.dm
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

// See: code/modules/surgery/bodyparts/species_parts/lizard_bodyparts.dm

/obj/item/bodypart/head/lizard
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_head"
	limb_id = SPECIES_SINTA
	uses_mutcolor = TRUE
	is_dimorphic = FALSE
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_SNOUT

/obj/item/bodypart/chest/lizard
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_chest"
	uses_mutcolor = TRUE
	limb_id = SPECIES_SINTA
	is_dimorphic = FALSE

/obj/item/bodypart/l_arm/lizard
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_l_arm"
	uses_mutcolor = TRUE
	limb_id = SPECIES_SINTA

/obj/item/bodypart/r_arm/lizard
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_r_arm"
	uses_mutcolor = TRUE
	limb_id = SPECIES_SINTA

/obj/item/bodypart/leg/left/lizard
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_l_leg"
	uses_mutcolor = TRUE
	limb_id = SPECIES_SINTA

/obj/item/bodypart/leg/right/lizard
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_r_leg"
	uses_mutcolor = TRUE
	limb_id = SPECIES_SINTA

/obj/item/bodypart/leg/left/lizard/digitigrade
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_l_leg_digitigrade"
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/right/lizard/digitigrade
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_r_leg_digitigrade"
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
