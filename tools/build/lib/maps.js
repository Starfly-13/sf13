// maps.js
// Copyright 2026 Patrick Meade.
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

import fs from "fs";
import path from "path";

const fsp = fs.promises;

async function pathExists(p) {
  try {
    await fsp.access(p);
    return true;
  } catch {
    return false;
  }
}

async function isDirectory(p) {
  try {
    const st = await fsp.stat(p);
    return st.isDirectory();
  } catch {
    return false;
  }
}

async function mkdirp(dir) {
  await fsp.mkdir(dir, { recursive: true });
}

async function removeTree(target) {
  await fsp.rm(target, { recursive: true, force: true });
}

async function copyTree(src, dest) {
  if (!(await isDirectory(src))) {
    return;
  }

  await mkdirp(dest);

  const entries = await fsp.readdir(src, { withFileTypes: true });
  for (const entry of entries) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);

    if (entry.isDirectory()) {
      await copyTree(srcPath, destPath);
    } else if (entry.isFile()) {
      await mkdirp(path.dirname(destPath));
      await fsp.copyFile(srcPath, destPath);
    } else if (entry.isSymbolicLink()) {
      // Optional: preserve symlinks if they ever appear.
      const linkTarget = await fsp.readlink(srcPath);
      await mkdirp(path.dirname(destPath));
      try {
        await fsp.symlink(linkTarget, destPath);
      } catch {
        // On Windows this may fail depending on permissions.
        // Fall back to copying the linked file if possible.
        const realSrc = await fsp.realpath(srcPath);
        const st = await fsp.stat(realSrc);
        if (st.isDirectory()) {
          await copyTree(realSrc, destPath);
        } else {
          await fsp.copyFile(realSrc, destPath);
        }
      }
    }
  }
}

async function* walkFiles(root, base = root) {
  if (!(await isDirectory(root))) {
    return;
  }

  const entries = await fsp.readdir(root, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = path.join(root, entry.name);
    if (entry.isDirectory()) {
      yield* walkFiles(fullPath, base);
    } else if (entry.isFile() || entry.isSymbolicLink()) {
      yield path.relative(base, fullPath);
    }
  }
}

async function removeMatchesFromTree(removalsRoot, destRoot, logger = console) {
  if (!(await isDirectory(removalsRoot))) {
    return;
  }

  for await (const relPath of walkFiles(removalsRoot)) {
    const targetPath = path.join(destRoot, relPath);
    logger.info?.(`Removing: ${targetPath}`) ?? logger.log(`Removing: ${targetPath}`);
    await fsp.rm(targetPath, { recursive: true, force: true });
  }
}

async function readText(file) {
  return await fsp.readFile(file, "utf8");
}

export async function buildLayeredMaps({
  projectRoot = process.cwd(),
  definesFile = path.join("code", "__DEFINES", "__starfly.dm"),
  moduleEnableDefine = "STARFLY13_MODULE_STARFLY_MAPS_ENABLED",
  upstreamMapsDir = "_maps",
  modulesRoot = path.join("modular_starfly", "modules"),
  removalModuleName = "starfly_maps",
  outputMapsDir = "_maps2eb",
  logger = console,
} = {}) {
  const definesPath = path.resolve(projectRoot, definesFile);
  const upstreamMapsPath = path.resolve(projectRoot, upstreamMapsDir);
  const modulesRootPath = path.resolve(projectRoot, modulesRoot);
  const removalMapsPath = path.join(modulesRootPath, removalModuleName, "_maps");
  const outputMapsPath = path.resolve(projectRoot, outputMapsDir);

  // If the module isn't enabled, bail out with success.
  if (!(await pathExists(definesPath))) {
    throw new Error(`Defines file not found: ${definesPath}`);
  }

  const definesText = await readText(definesPath);
  const defineLine = `#define ${moduleEnableDefine}`;
  if (!definesText.split(/\r?\n/).includes(defineLine)) {
    logger.info?.(
      `Skipping layered maps build; ${moduleEnableDefine} is not enabled.`
    ) ?? logger.log(`Skipping layered maps build; ${moduleEnableDefine} is not enabled.`);
    return {
      enabled: false,
      outputMapsDir: outputMapsPath,
    };
  }

  if (!(await isDirectory(upstreamMapsPath))) {
    throw new Error(`Upstream maps directory not found: ${upstreamMapsPath}`);
  }

  logger.info?.(`Preparing layered maps in: ${outputMapsPath}`) ??
    logger.log(`Preparing layered maps in: ${outputMapsPath}`);

  await removeTree(outputMapsPath);
  await mkdirp(outputMapsPath);

  logger.info?.(`Copying: ${upstreamMapsPath} -> ${outputMapsPath}`) ??
    logger.log(`Copying: ${upstreamMapsPath} -> ${outputMapsPath}`);
  await copyTree(upstreamMapsPath, outputMapsPath);

  if (await isDirectory(modulesRootPath)) {
    const moduleEntries = await fsp.readdir(modulesRootPath, { withFileTypes: true });

    for (const entry of moduleEntries) {
      if (!entry.isDirectory()) {
        continue;
      }

      if (entry.name === removalModuleName) {
        continue;
      }

      const moduleMapsPath = path.join(modulesRootPath, entry.name, "_maps");
      if (!(await isDirectory(moduleMapsPath))) {
        continue;
      }

      logger.info?.(`Merging: ${moduleMapsPath} -> ${outputMapsPath}`) ??
        logger.log(`Merging: ${moduleMapsPath} -> ${outputMapsPath}`);
      await copyTree(moduleMapsPath, outputMapsPath);
    }
  }

  await removeMatchesFromTree(removalMapsPath, outputMapsPath, logger);

  return {
    enabled: true,
    outputMapsDir: outputMapsPath,
    maprootDefine: outputMapsDir,
  };
}

export default buildLayeredMaps;
