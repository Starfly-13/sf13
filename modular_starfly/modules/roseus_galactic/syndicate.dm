#ifdef STARFLY13_MODULE_ROSEUS_GALACTIC_ENABLED
//---------------------------------------------------------------------------------------------------------------------

// syndicate.dm
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

// See: code/modules/clothing/under/syndicate.dm

/obj/item/clothing/under/syndicate/aclfgrunt/roseus
	name = "Roseus Galactic uniform"
	desc = "A button-up in a tasteful shade of gray with red pants, used as the uniform of the Roseus Galactic corporation on the rim."
	icon = 'modular_starfly/modules/roseus_galactic/icons/obj/syndicate.dmi'
	icon_state = "aclfgrunt"
	mob_overlay_icon = 'modular_starfly/modules/roseus_galactic/icons/mob/syndicate.dmi'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 40)
	alt_covers_chest = TRUE

/obj/item/clothing/under/syndicate/sniper/roseus
	name = "Tactical turtleneck suit"
	desc = "A double seamed tactical turtleneck disguised as a civilian grade silk suit. Popular among high-ranking Roseus Galactic staff."
	icon = 'modular_starfly/modules/roseus_galactic/icons/obj/suits.dmi'
	icon_state = "really_black_suit"
	item_state = "bl_suit"
	mob_overlay_icon = 'modular_starfly/modules/roseus_galactic/icons/mob/suits.dmi'

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_ROSEUS_GALACTIC_ENABLED
