# NOTES.md
Some notes about the current state of modularization of previous STARFLY-13 content.



## More Needs
More things that we'll need to create to suport Modular Starfly

- [ ] Create a CI action to compile shiptest.dmb with each module enabled/disabled
- [ ] Create a CI action to compare `code/__DEFINES/__STARFLY/__modules.dm` with `tgui/packages/tgui/starfly.ts`

- [ ] Create XENOBIOLOGY module (https://github.com/shiptest-ss13/Shiptest/pull/3527)
  - [ ] Add SLIME_EXTRACT back to /datum/species/lizard/changesource_flags



## 11: Introducing Unathi (Part One)

Source: https://github.com/Starfly-13/STARFLY-13/pull/11
Destination: https://github.com/Starfly-13/sf13/pull/13

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
- [ ] Removed SLIME_EXTRACT
  - Removed Upstream at: https://github.com/shiptest-ss13/Shiptest/pull/3527



## 14: STARFLY 13 Identity Creation

This one mixes a few changes; Roseus Galactic creation, Sinta'Unathi
improvements, Yeosa language creation, Kalixcian language creation.

Source: https://github.com/Starfly-13/STARFLY-13/pull/14
Destination: https://github.com/Starfly-13/sf13/pull/?? # TODO: PR number




## Rejected
Upstream changes we don't intend to modularize

- [-] Create MAGIC module (https://github.com/shiptest-ss13/Shiptest/pull/2877)
- [-] Create MUTATION_TOXIN module (https://github.com/shiptest-ss13/Shiptest/pull/2659)
