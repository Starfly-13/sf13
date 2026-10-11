#!/usr/bin/env python3
# check_dme_includes.py
# Copyright 2026 Patrick Meade.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#----------------------------------------------------------------------------

import sys
from pathlib import Path

EXPECTED_SUFFIXES = [".dm", ".dmf"]

def get_includes(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    includes = [line for line in lines if line.strip().startswith('#include')]
    paths = [line.split('#include')[1].strip().strip('"') for line in includes]
    return paths

def check_dme_include_types(file_path):
    # until we know otherwise, all the path suffixes are legitimate
    all_good = True

    # get all of the include paths from the .dme file
    paths = get_includes(file_path)

    # for each include path in the dme file
    for include_path_str in paths:
        # turn it into a python Path object
        include_path = Path(include_path_str)

        # if the path suffix is NOT one of the ones we expect
        if include_path.suffix not in EXPECTED_SUFFIXES:
            # set the all_good flag to False
            all_good = False
            # tell the user what we found
            print(f'#include "{include_path_str}" has suffix "{include_path.suffix}"')

    # if we found an error
    if not all_good:
        print(f"Some #include paths in {file_path} are a little sus.")

    # return our result to ther caller
    return all_good


if __name__ == "__main__":
    file_path = sys.argv[1]
    if not check_dme_include_types(file_path):
        sys.exit(1)
    else:
        print("All #include paths have suffixes we expected.")
