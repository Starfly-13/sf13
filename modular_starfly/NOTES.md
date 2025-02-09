# NOTES.md
Some notes about the current state of modularization of previous STARFLY-13 content.

## Ask LectroNyx About
Some things to ask Lectro about with respect to future modules

- [ ] Ask LectroNyx About
  - [ ] Create XENOBIOLOGY module (https://github.com/shiptest-ss13/Shiptest/pull/3527)
    - [ ] Add SLIME_EXTRACT back to /datum/species/lizard/changesource_flags

- [ ] Ask LectroNyx About
  - [ ] Create MAGIC module (https://github.com/shiptest-ss13/Shiptest/pull/2877)
    - [ ] Add FIREBREATH back to /datum/species/lizard/inert_mutation

- [ ] Ask LectroNyx About
  - [ ] Create MUTATION_TOXIN module (https://github.com/shiptest-ss13/Shiptest/pull/2659)
    - [ ] Use /datum/reagent/mutationtoxin/lizard from #11

## More Needs
More things that we'll need to create to suport Modular Starfly

- [ ] Create a CI action to compile shiptest.dmb with each module enabled/disabled
- [ ] Create a CI action to compare `code/__DEFINES/__STARFLY/__modules.dm` with `tgui/packages/tgui/starfly.ts`

## 11: Introducing Unathi (Part One)

Source: https://github.com/Starfly-13/STARFLY-13/pull/11
Destination: https://github.com/Starfly-13/sf13/pull/#

### Includes
- [X] Language modification
- [X] Species modification
- [X] Nanite Species Sensor
- [X] Tail modification

### Excludes
- [X] Upstream Code Comment Modifications
- [X] Mutation Toxin modification
  - Removed Upstream at: https://github.com/shiptest-ss13/Shiptest/pull/2659
- [ ] Yeosa Language
  - [ ] Move to YEOSA_UNATHI module
- [ ] Changing 'Moth' to 'Nian
  - [ ] Move to NIAN_MOTH(?) module

### Edits
- [ ] Removed FIREBREATH
  - Removed Upstream at: https://github.com/shiptest-ss13/Shiptest/pull/2877
- [ ] Removed SLIME_EXTRACT
  - Removed Upstream at: https://github.com/shiptest-ss13/Shiptest/pull/3527
