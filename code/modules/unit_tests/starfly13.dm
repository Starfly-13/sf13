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

/datum/unit_test/starfly13_ion_laws

/datum/unit_test/starfly13_ion_laws/Run()
	var/ionabstract = strings(ION_FILE, "ionabstract")
	TEST_ASSERT_NOTNULL(ionabstract, "Unable to load ionabstract list from ION_FILE")
	TEST_ASSERT_NOTNULL(GLOB.string_cache[ION_FILE], "Unable to cache strings from ION_FILE")
