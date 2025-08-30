// starfly13.dm
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


/datum/unit_test/starfly13_ion_laws/Run()
	var/ionabstract = strings(ION_FILE, "ionabstract")
	TEST_ASSERT_NOTNULL(ionabstract, "Unable to load ionabstract list from ION_FILE")
	TEST_ASSERT_NOTNULL(GLOB.string_cache[ION_FILE], "Unable to cache strings from ION_FILE")


/datum/unit_test/starfly13_planet_types/Run()
	// the list of planet types that we know to unit test for ruin placement
	var/list/test_names = list(
		"asteroid",
		"beachplanet",
		"desertplanet",
		"empty space",
		"gas giant",
		"ice",
		"jungle",
		"lava",
		"plasma giant",
		"reebe",
		"rockplanet",
		"sand",
		"space",
		"wasteplanet",
		"waterplanet",
	)
	// for each type on our known types list, make sure it's in the code
	for(var/test_name in test_names)
		TEST_ASSERT((test_name in SSmapping.planet_types), "'[test_name]' is not among the planet types! test_names: [json_encode(test_names, JSON_PRETTY_PRINT)] planet_types: [json_encode(SSmapping.planet_types, JSON_PRETTY_PRINT)]")
	// for each planet type in the code, make sure it's on our known types list
	for(var/planet_name in SSmapping.planet_types)
		TEST_ASSERT((planet_name in test_names), "'[planet_name]' is an unknown planet type! test_names: [json_encode(test_names, JSON_PRETTY_PRINT)] planet_types: [json_encode(SSmapping.planet_types, JSON_PRETTY_PRINT)]")
