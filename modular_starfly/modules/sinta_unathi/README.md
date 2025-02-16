https://github.com/Starfly-13/sf13/pull/13

## Sinta'Unathi

Module ID: SINTA_UNATHI

### Description

Replaces Sarathi with Sinta'Unathi as the default lizard race.

### ST Proc/File Changes

- `code/__DEFINES/mobs.dm`: `SPECIES_SARATHI`
- `code/modules/projectiles/guns/ballistic/launchers.dm`: `rpg_scrawlings`
- `code/modules/research/nanites/nanite_programs/sensor.dm`: `/datum/nanite_program/sensor/species/allowed_species`
- `config/game_options.txt`: `ROUNDSTART_RACES sinta`
- `tgui/packages/tgui/interfaces/ScannerGate.js`: `TARGET_SPECIES_LIST`

### Modular Overrides

- `modular_starfly/modules/sinta_unathi/icons/bodyparts.dmi`
- `modular_starfly/modules/sinta_unathi/draconic.dm`: `/datum/language/draconic`
- `modular_starfly/modules/sinta_unathi/ipc.dm`: `/datum/sprite_accessory/ipc_tail/lizard`, `/datum/sprite_accessory/ipc_tail/lizard_big`
- `modular_starfly/modules/sinta_unathi/lizard_bodyparts.dm`: `/obj/item/bodypart/**/lizard`
- `modular_starfly/modules/sinta_unathi/lizardpeople.dm`: `/datum/species/lizard`
- `modular_starfly/modules/sinta_unathi/mining_base.dm`: `/obj/effect/mob_spawn/human/corpse/ruin/ns_mine_manager`, `/obj/item/tape/random/preset/mining_base/one`
- `modular_starfly/modules/sinta_unathi/tails.dm`: `/obj/item/organ/tail/lizard`

### Defines

- `code/__DEFINES/__STARFLY/__modules.dm`: `STARFLY13_MODULE_SINTA_UNATHI_ENABLED`
- `modular_starfly/modules/sinta_unathi/_defines.dm`: `SPECIES_LIZARD`
- `modular_starfly/modules/sinta_unathi/_defines.dm`: `SPECIES_SINTA`
- `modular_starfly/modules/sinta_unathi/_defines.dm`: `SPECIES_UNATHI`

### Included files that are not contained in this module

- N/A

### Credits

- LectroNyx is the original author of this module.
- Most of this content first appeared here: https://github.com/Starfly-13/STARFLY-13/pull/11
