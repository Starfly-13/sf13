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

/obj/item/bodypart/tail/lizard
	name = "unathi tail"
	desc = "A severed Unathi's tail. Can't they regrow these...?"
	icon = 'modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi'
	icon_state = "sinta_tail"
	examine_id = SPECIES_SARATHI
	limb_id = SPECIES_SARATHI
	uses_mutcolor = TRUE
	overlay_icon_state = TRUE
	max_damage = 30
	max_stamina_damage = 30
	body_damage_coeff = 0.6
	body_weight = 8
	can_thump = TRUE
	/// Keeps track of which spines should be displayed.
	var/spines

/obj/item/bodypart/tail/lizard/set_owner(new_owner)
	. = ..()
	if(. == FALSE)
		return
	if(owner)
		if(!spines)
			spines = owner.dna.features["spines"] || "None"
			owner.dna.species.mutant_bodyparts |= "spines"
		else
			owner.dna.features["spines"] = spines
	else if(.)
		var/mob/living/carbon/old_owner = .
		old_owner.dna.species.mutant_bodyparts -= "spines"

/obj/item/bodypart/tail/lizard/set_wag(new_state)
	if(!..())
		return FALSE
	if(owner.dna?.species)
		owner.dna.species.handle_mutant_bodyparts(owner)
	return TRUE

/obj/item/bodypart/tail/lizard/large
	name = "large unathi tail"
	icon_state = "large_sinta_tail"
	limb_id = "large_" + SPECIES_SARATHI
	max_damage = 50
	max_stamina_damage = 50
	body_damage_coeff = 0.75
	body_weight = 16 // big tail == big target

/obj/item/bodypart/tail/lizard/small
	name = "small unathi tail"
	icon_state = "small_sinta_tail"
	limb_id = "small_" + SPECIES_SARATHI
	max_damage = 20
	max_stamina_damage = 20
	body_weight = 4

/obj/item/bodypart/tail/lizard/synth
	name = "prosthetic unathi tail"
	icon_state = "synth_sinta_tail"
	examine_id = "prosthetic " + SPECIES_SARATHI
	limb_id = "synth_" + SPECIES_SARATHI
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ROBOTIC
	biological_state = BIO_ROBOTIC
	overlay_use_primary_color = TRUE
	draw_color_use_secondary = TRUE

/obj/item/bodypart/tail/lizard/synth/large
	name = "prosthetic large unathi tail"
	icon_state = "large_sinta_tail"
	examine_id = "prosthetic large " + SPECIES_SARATHI
	limb_id = "large_" + SPECIES_SARATHI
	max_damage = 50
	max_stamina_damage = 50
	body_damage_coeff = 0.75
	body_weight = 16 // big tail == big target

/obj/item/bodypart/tail/lizard/one_color
	name = "unathi tail (one color)"
	icon_state = "onecolor_sinta_tail"
	limb_id = "onecolor_" + SPECIES_SARATHI
	overlay_icon_state = FALSE

/obj/item/bodypart/tail/lizard/fake
	name = "fabricated unathi tail"
	desc = "A fabricated severed unathi tail. This one's made of synthflesh."

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
