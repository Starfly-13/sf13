// games.dm
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

#define CARDS_AGAINST_SPESS_BLACK_TXT "strings/cas_black.txt"

//---------------------------------------------------------------------------------------------------------------------
// STARFLY EDIT - CHANGE BEGIN
#ifndef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
//---------------------------------------------------------------------------------------------------------------------
	#define CARDS_AGAINST_SPESS_WHITE_TXT "strings/cas_white.txt"
//---------------------------------------------------------------------------------------------------------------------
#else
//---------------------------------------------------------------------------------------------------------------------
	#define CARDS_AGAINST_SPESS_WHITE_TXT "strings/starfly/cas_white.txt"
//---------------------------------------------------------------------------------------------------------------------
#endif // #ifndef STARFLY13_MODULE_SINTA_UNATHI_ENABLED
// STARFLY EDIT - CHANGE END
//---------------------------------------------------------------------------------------------------------------------
