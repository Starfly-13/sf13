# Starfly-13 Ships

Module ID: `STARFLY_SHIPS`

## Description

Removes non-lore ships and ship configurations in a modular way. New ships will
appear in thier own modules.

### Usage

This module applies custom ships that provided by other modules. We start with
the base `_maps` provided from upstream (Shiptest).

We then copy the contents of `_maps` from modules under `modular_starfly`. Any
module providing a new file will take precedence over upstream. Modules that
provide identical filenames will conflict with each other. Those conflicts
must be resolved between the modules if you expect the ships to work properly.

Finally, anything defined in this module `STARFLY_SHIPS` will be deleted from
the `_maps` directory. By providing a file like `_maps/configs/srm_elder.json`
in this module, we instruct the build process to remove that file from the
codebase at build time. It will not be present in the game.

#### tl;dr

- Add your new ships under `_maps` in your own new modular_starfly modules.

- Add empty files in this module `STARFLY_SHIPS` if you want to DELETE a ship
  from the Starfly version of the game.

## TG Proc/File Changes

- N/A
<!-- If you edited any core procs, you should list them here. You should specify the files and procs you changed.
E.g:
- `code/modules/mob/living.dm`: `proc/overriden_proc`, `var/overriden_var`
-->

## Modular Overrides

- N/A
<!-- If you added a new modular override (file or code-wise) for your module, you should list it here. Code files should specify what procs they changed, in case of multiple modules using the same file.
E.g:
- `modular_starfly/master_files/sound/my_cool_sound.ogg`
- `modular_starfly/master_files/code/my_modular_override.dm`: `proc/overriden_proc`, `var/overriden_var`
-->

## Defines

- N/A
<!-- If you needed to add any defines, mention the files you added those defines in, along with the name of the defines. -->

## Included files that are not contained in this module

- N/A
<!-- Likewise, be it a non-modular file or a modular one that's not contained within the folder belonging to this specific module, it should be mentioned here. Good examples are icons or sounds that are used between multiple modules, or other such edge-cases. -->

## Credits

- Patrick Meade created this module.
