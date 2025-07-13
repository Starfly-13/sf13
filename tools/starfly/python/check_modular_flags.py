#!/usr/bin/env python3
# check_modular_flags.py

import re
import sys
from pathlib import Path

def parse_dm_defines(dm_path: Path):
    """
    Parse the .dm file for #define STARFLY13_MODULE_* entries.
    Returns a dict of flag -> True
    (with the STARFLY13_ prefix stripped)
    """
    defines = {}
    pattern = re.compile(r'#define\s+(STARFLY13_MODULE_[A-Z0-9_]+)')
    with dm_path.open(encoding='utf-8') as f:
        for line in f:
            match = pattern.match(line.strip())
            if match:
                full_flag = match.group(1)
                short_flag = full_flag.replace("STARFLY13_", "", 1)
                defines[short_flag] = True
    return defines

def parse_ts_constants(ts_path: Path):
    """
    Parse the .ts file for export const STARFLY13 = { ... } entries.
    Returns a dict of flag -> boolean.
    (keys are MODULE_* without STARFLY13_ prefix)
    """
    constants = {}
    content = ts_path.read_text(encoding='utf-8')
    export_block = re.search(
        r'export\s+const\s+STARFLY13\s*=\s*\{(.*?)\};',
        content,
        re.DOTALL,
    )
    if not export_block:
        raise RuntimeError("Could not find STARFLY13 export block in the TypeScript file.")
    block_text = export_block.group(1)
    line_pattern = re.compile(r'(MODULE_[A-Z0-9_]+)\s*:\s*(true|false)', re.IGNORECASE)
    for line in block_text.splitlines():
        line = line.strip().rstrip(',')
        if not line:
            continue
        match = line_pattern.match(line)
        if match:
            key = match.group(1)
            value = match.group(2).lower() == "true"
            constants[key] = value
    return constants

def main():
    if len(sys.argv) != 3:
        print("Usage: check_starfly13_flags.py <dm_file> <ts_file>")
        sys.exit(1)

    dm_file = Path(sys.argv[1])
    ts_file = Path(sys.argv[2])

    dm_flags = parse_dm_defines(dm_file)
    ts_flags = parse_ts_constants(ts_file)

    all_keys = sorted(set(dm_flags.keys()) | set(ts_flags.keys()))

    errors = []

    for key in all_keys:
        in_dm = key in dm_flags
        in_ts = key in ts_flags

        if not in_dm:
            errors.append(f"Flag STARFLY13_{key} is missing in .dm file")
        if not in_ts:
            errors.append(f"Flag {key} is missing in .ts file")

        if in_dm and in_ts:
            if not ts_flags[key]:
                errors.append(f"Flag STARFLY13_{key} is enabled in .dm but set to false in .ts")

    if errors:
        print("ERROR: Inconsistent STARFLY13 module flags found:")
        for err in errors:
            print("  - " + err)
        sys.exit(1)

    print("All STARFLY13 module flags are consistent ✅")

if __name__ == "__main__":
    main()
