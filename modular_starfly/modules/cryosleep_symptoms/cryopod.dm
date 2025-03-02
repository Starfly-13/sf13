#ifdef STARFLY13_MODULE_CRYOSLEEP_SYMPTOMS_FLAG
//---------------------------------------------------------------------------------------------------------------------

// cryopod.dm
// Copyright 2024-2025 Patrick Meade.
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

/obj/machinery/cryopod
	/// if symptoms of cryosleep will be applied to players upon waking
	var/apply_cryosleep_symptoms = TRUE

/obj/machinery/cryopod/Initialize()
	apply_cryosleep_symptoms = CONFIG_GET(flag/cryosleep_symptoms)
	return ..()

/obj/machinery/cryopod/apply_effects_to_mob(mob/living/carbon/sleepyhead)
	// if we're not applying cryosleep symptoms, just skip it
	if(!apply_cryosleep_symptoms)
		return
	// otherwise, apply as normal
	return ..()

//---------------------------------------------------------------------------------------------------------------------
#endif // #ifdef STARFLY13_MODULE_CRYOSLEEP_SYMPTOMS_FLAG
