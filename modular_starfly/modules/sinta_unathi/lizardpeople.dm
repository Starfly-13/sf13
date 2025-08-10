#ifdef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
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

// See: code/modules/mob/living/carbon/human/species_types/lizardpeople.dm

/datum/species/lizard
	// Reptilian humanoids with scaled skin and tails.
	name = "\improper Sinta'Unathi"
	id = SPECIES_SINTA
	default_color = "00FF00"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,SCLERA,EMOTE_OVERLAY,MUTCOLORS_SECONDARY)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	mutant_bodyparts = list("tail_lizard", "face_markings", "frills", "horns", "spines", "body_markings", "legs")
	mutanttongue = /obj/item/organ/tongue/lizard
	mutant_organs = list(/obj/item/organ/tail/lizard)
	coldmod = 1.5
	heatmod = 0.67
	species_age_min = 22
	species_age_max = 200
	default_features = list("mcolor" = "0F0", "tail_lizard" = "Smooth", "face_markings" = "None", "horns" = "None", "frills" = "None", "spines" = "None", "body_markings" = "None", "legs" = "Normal Legs", "body_size" = "Normal")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/food/meat/slab/human/mutant/lizard
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
	exotic_bloodtype = "L"
	disliked_food = GRAIN | CLOTH | GROSS
	liked_food = GORE | MEAT
	deathsound = 'sound/voice/lizard/deathsound.ogg'
	wings_icons = list("Dragon")
	species_language_holder = /datum/language_holder/lizard
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	mutanteyes = /obj/item/organ/eyes/lizard
	sclera_color = "#fffec4"
	blush_color = COLOR_BLUSH_TEAL

	species_chest = /obj/item/bodypart/chest/lizard
	species_head = /obj/item/bodypart/head/lizard
	species_l_arm = /obj/item/bodypart/l_arm/lizard
	species_r_arm = /obj/item/bodypart/r_arm/lizard
	species_l_leg = /obj/item/bodypart/leg/left/lizard
	species_r_leg = /obj/item/bodypart/leg/right/lizard

	species_robotic_chest = /obj/item/bodypart/chest/robot/lizard
	species_robotic_head = /obj/item/bodypart/head/robot/lizard
	species_robotic_l_arm = /obj/item/bodypart/l_arm/robot/surplus/lizard
	species_robotic_r_arm = /obj/item/bodypart/r_arm/robot/surplus/lizard
	species_robotic_l_leg = /obj/item/bodypart/leg/left/robot/surplus/lizard
	species_robotic_r_leg = /obj/item/bodypart/leg/right/robot/surplus/lizard

	robotic_eyes = /obj/item/organ/eyes/robotic/lizard

	// Lizards are coldblooded and can stand a greater temperature range than humans
	bodytemp_heat_damage_limit = HUMAN_BODYTEMP_HEAT_DAMAGE_LIMIT + 20 // This puts lizards 10 above lavaland max heat for ash lizards.
	bodytemp_cold_damage_limit = HUMAN_BODYTEMP_COLD_DAMAGE_LIMIT - 10
	loreblurb = "The Sinta'Unathi are a cold-blooded reptilian species originating from the harsh mainland of the planet Moghes, in the Uuoea-Esa system. A warrior culture with emphasis on honor, family, and loyalty to one's clan, the divided Sinta'Unathi find themselves as powerful a force as any other species despite their less than hospitable homeworld."

	ass_image = 'icons/ass/asslizard.png'
	var/datum/action/innate/liz_lighter/internal_lighter

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
