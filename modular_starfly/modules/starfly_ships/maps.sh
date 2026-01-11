#!/usr/bin/env bash
# maps.sh

set -euo pipefail

# if this module isn't enabled, just bail out here (no error)
if ! grep -q '^#define STARFLY13_MODULE_STARFLY_SHIPS_ENABLED$' code/__DEFINES/__starfly.dm; then
    exit 0
fi

# define some useful stuff
dest_maps="_maps"
modules_root="modular_starfly/modules"
starfly_maps="$modules_root/starfly_ships/_maps"

# if _maps doesn't exist, just bail out here (error)
[[ -d "$dest_maps" ]] || { echo "ERROR: $dest_maps not found" >&2; exit 1; }

# otherwise, its time to build up the custom maps staging directory
export STARFLY_MAPS_DIR=".staging/_maps"

# ensure staging directory exists and is clean
rm -rf "$STARFLY_MAPS_DIR"
mkdir -p "$STARFLY_MAPS_DIR"

# copy the original maps into our staging directory
echo "Copying: $dest_maps -> $STARFLY_MAPS_DIR/"
cp -a "$dest_maps"/. "$STARFLY_MAPS_DIR"/

# copy the custom maps provided by every other module
shopt -s nullglob
for module_dir in "$modules_root"/*/; do
    [[ "${module_dir%/}" == "$modules_root/starfly_ships" ]] && continue
    maps_dir="${module_dir%/}/_maps"

    [[ -d "$maps_dir" ]] || continue

    echo "Merging: $maps_dir -> $STARFLY_MAPS_DIR/"
    cp -a "$maps_dir"/. "$STARFLY_MAPS_DIR"/
done

# remove all the maps specified by this module
if [[ -d "$starfly_maps" ]]; then
    (
        cd "$starfly_maps"
        find . -type f -mindepth 1 -depth -print0
    ) | while IFS= read -r -d '' relpath; do
        echo "Removing: $STARFLY_MAPS_DIR/$relpath"
        rm -rf "$STARFLY_MAPS_DIR/$relpath"
    done
fi
