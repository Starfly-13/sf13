#ifdef STARFLY13_MODULE_HEGEMONY_STATION_ENABLED
//---------------------------------------------------------------------------------------------------------------------

// outpost_types.dm
// Copyright 2026 Patrick Meade.
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


/datum/map_template/outpost/elevator_hegemony
	name = "elevator_hegemony"


/datum/map_template/outpost/hegemony
	name = "hegemony"
	outpost_name = "Hegemony Station"
	outpost_administrator = "Madtankdriver"

/datum/map_template/outpost/hangar/hegemony_20x20
	name = "hangar/hegemony_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/hegemony_40x20
	name = "hangar/hegemony_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/hegemony_40x40
	name = "hangar/hegemony_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/hegemony_56x20
	name = "hangar/hegemony_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/hegemony_56x40
	name = "hangar/hegemony_56x40"
	dock_width = 56
	dock_height = 40


/datum/overmap/outpost/hegemony
	token_icon_state = "station_planet"
	main_template = /datum/map_template/outpost/hegemony
	elevator_template = /datum/map_template/outpost/elevator_hegemony
	weather_controller_type = /datum/weather_controller/rockplanet_safe
	hangar_templates = list(
		/datum/map_template/outpost/hangar/hegemony_20x20,
		/datum/map_template/outpost/hangar/hegemony_40x20,
		/datum/map_template/outpost/hangar/hegemony_40x40,
		/datum/map_template/outpost/hangar/hegemony_56x20,
		/datum/map_template/outpost/hangar/hegemony_56x40
	)
	faction = FACTION_UNKNOWN


//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_HEGEMONY_STATION_ENABLED
