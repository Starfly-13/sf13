#ifdef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
//---------------------------------------------------------------------------------------------------------------------

// mining_base.dm
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

// See: code/modules/ruins/rockplanet_ruin_code/mining_base.dm

/obj/effect/mob_spawn/human/corpse/ruin/ns_mine_manager
	mob_name = "gruff unathi man"
	mob_gender = MALE
	mob_species = /datum/species/lizard
	icon_state = "corpsehuman"
	outfit = /datum/outfit/job/nanotrasen/quartermaster
	brute_damage = 120


/obj/item/tape/random/preset/mining_base/one
	ruined = 1
	used_capacity = 120

/obj/item/tape/random/preset/mining_base/one/Initialize()
	. = ..()
	storedinfo = list(
		"\[00:00\] Recording started.",
		"\[00:02\] [span_name("gruff unathi man")] firmly declares \"-urn in hell for thisss.\"",
		"\[00:05\] [span_name("stern human woman")] retorts \"A hell of my own making.\"",
		"\[00:08\] [span_name("gruff unathi man")] states \"And we'll sssend you-\"",
		"\[00:11\] [span_name("gruff unathi man")] suddenly gasps",
		"\[00:12\] [span_name("stern human woman")] confidently delivers \"If you're so sure, why aren't you the one with the gun?\"",
		"\[00:17\] [span_name("gruff unathi man")] stammers \"y-you won't get away with thisss\"",
		"\[00:20\] [span_name("stern human woman")] says \"The last Nanotrasen cuck I killed said that too~\"",
		"\[00:25\] sudden clattering and a dull thump.",
		"\[00:26\] [span_name("gruff unathi man")] gasps for breath!",
		"\[00:27\] [span_name("stern human woman")] contemptously declares \"Different boot. Same pathetic people.\"",
		"\[00:30\] A pistol's slide is racked.",
		"\[00:32\] [span_name("stern human woman")] says \"Burn in hell.\"",
		"\[00:33\] A pistol is fired!",
		"\[00:36\] [span_name("stern human woman")] states \"Get moving. I want us out and a garrison deployed within the hour.\"",
		"\[00:38\] armored footsteps thump against a metal floor",
		"\[00:44\] an airlock hisses open.",
		"\[00:45\] [span_name("stern human woman")] taunts \"tchuss, tovai.\"",
		"\[00:50\] an airlock suddenly closes!",
		"\[02:00\] Recording ended.",
	)
	timestamp = list(
		0,
		2,
		5,
		8,
		11,
		12,
		17,
		20,
		25,
		26,
		27,
		30,
		32,
		33,
		36,
		38,
		44,
		45,
		50,
		120
	)

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
