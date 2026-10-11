// __starflymaps.dm
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

// if we weren't provided with a MAPROOT at build time
#ifndef MAPROOT
	// if we're using STARFLY-13 maps...
	#ifdef STARFLY13_MODULE_STARFLY_MAPS_ENABLED
		// STARFLY-13 maps are located at _maps 2: electric boogaloo
		#define MAPROOT "_maps2eb"
	// otherwise...
	#else
		// Shiptest maps are located at _maps
		#define MAPROOT "_maps"
	#endif // #ifdef STARFLY13_MODULE_STARFLY_MAPS_ENABLED
#endif // #ifndef MAPROOT
