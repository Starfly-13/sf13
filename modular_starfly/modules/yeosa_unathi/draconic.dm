#ifdef STARFLY13_MODULE_YEOSA_UNATHI_ENABLED
//---------------------------------------------------------------------------------------------------------------------

// draconic.dm
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

// See: code/modules/language/draconic.dm

/datum/language/yeosa
	name = "Yeosa'Unathi"
	desc = "A moghesan language consisting of spoken words and gestures, used by those who live near the shore. The rarity of this language outside of its native region and its prominence within only cause further obscurity of Yeosa culture."
	speech_verb = "hisses"
	ask_verb = "rattles"
	exclaim_verb = "barks"
	sing_verb = "sings"
	key = "O"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD //WS Edit- Language icon hiding
	space_chance = 40
	syllables = list(
		"azs","zis","zau","azua","skiu","zuakz","izo","aei","ki","kut","zo",
		"ozs","siz","gau","uzua","sgyu","suags","ogh","eya","ghi","gut","gho",
		"ga", "ag", "ge", "eg", "gi", "ig", "go", "og", "gu", "ug", "gs", "sg",
		"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz", "zs", "sz",
		"ha", "ah", "he", "eh", "hi", "ih", "ho", "oh", "hu", "uh", "hs", "sh",
		"la", "al", "le", "el", "li", "il", "lo", "ol", "lu", "ul", "ls", "sl",
		"ka", "ak", "ke", "ek", "ki", "ik", "ko", "ok", "ku", "uk", "ks", "sk",
		"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us", "ss", "ss",
		"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur", "rs", "sr",
		"a",  "a",  "e",  "e",  "i",  "i",  "o",  "o",  "u",  "u",  "s",  "s"
	)
	icon = 'modular_starfly/modules/yeosa_unathi/icons/language.dmi'
	icon_state = "yeosa"
	default_priority = 90

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_YEOSA_UNATHI_ENABLED
