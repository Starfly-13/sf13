// starfly13_ruin_placement.dm
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

//minimize overhead of the default system
/datum/overmap_star_system/shiptest
	generator_type = OVERMAP_GENERATOR_NONE
	has_outpost = FALSE
	encounters_refresh = FALSE

/datum/overmap/dynamic/ruin_tester
	populate_turfs = FALSE

/datum/unit_test/ruin_placement/proc/test_placement(var/planet_name)
	var/datum/overmap_star_system/dummy_system = SSovermap.default_system
	dummy_system.name = "Ruin Test: Dummy System"

	var/datum/planet_type/planet_type = SSmapping.planet_types[planet_name]
	TEST_ASSERT(planet_type, "'[planet_name]' is not a planet type! planet_types: [SSmapping.planet_types]")

	if (planet_type.ruin_type == null)
		log_test("Planet Type: [planet_name] does not have ruins (ruin_type == null). Skipping tests.")
		return

	for(var/ruin_name as anything in SSmapping.ruin_types_list[planet_type.ruin_type])
		log_test("Testing Ruin: [ruin_name]")
		var/datum/map_template/ruin/ruin = SSmapping.ruin_types_list[planet_type.ruin_type][ruin_name]

		var/datum/overmap/dynamic/ruin_tester/dummy_overmap = new(null, dummy_system, FALSE)
		TEST_ASSERT(!dummy_overmap.selected_ruin, "[dummy_overmap] was not meant to set its own ruin, this will init all its pois and fuck up shit when we overwrite in this test!")

		dummy_overmap.name = "Ruin Test: [ruin_name]"
		dummy_overmap.selected_ruin = ruin

		dummy_overmap.set_planet_type(planet_type)

		//12 is since it pads 6 and i dont feel like fixing that rn
		dummy_overmap.vlevel_height = ruin.height+12
		dummy_overmap.vlevel_width = ruin.width+12

		dummy_overmap.populate_turfs = FALSE

		for(var/mission_type in ruin.ruin_mission_types)
			var/datum/mission/ruin/ruin_mission = new mission_type(dummy_overmap, 1 + length(dummy_overmap.dynamic_missions))
			dummy_overmap.dynamic_missions += ruin_mission
			ruin_mission.start_mission()
			log_test("Testing Mission: [ruin_mission.name]")

		TEST_ASSERT(!dummy_overmap.loading, "[dummy_overmap] is somehow loading before we call the load level proc?!?")
		TEST_ASSERT(dummy_overmap.load_level(), "[dummy_overmap] failed to load!")
		TEST_ASSERT_EQUAL(length(SSmissions.unallocated_pois), 0, "Somehow a planet created pois but did not manage to allocate them to itself!")

		log_test("Mission poi count: [length(dummy_overmap.spawned_mission_pois)]")
		var/list/errors = atmosscan(TRUE, TRUE)
		//errors += powerdebug(TRUE)

		for(var/error in errors)
			Fail("Mapping error in [ruin_name]: [error]", ruin.mappath, 1)

		log_test("Cleaning up [dummy_overmap]")
		//qdel(vlevel)
		qdel(dummy_overmap)
