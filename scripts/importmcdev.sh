#!/usr/bin/env bash

(
set -e
nms="net/minecraft/server"
export MODLOG=""
PS1="$"
basedir="$(cd "$1" && pwd -P)"
gitcmd="git -c commit.gpgsign=false"

workdir="$basedir/work"
decompiledir="$basedir/mc-dev/"

export importedmcdev=""
function import {
    export importedmcdev="$importedmcdev $1"
    file="${1}.java"
    target="$basedir/CraftBukkit/src/main/java/$nms/$file"
    base="$decompiledir/$nms/$file"

    if [[ ! -f "$target" ]]; then
        export MODLOG="$MODLOG  Imported $file from mc-dev\n";
        echo "Copying $base to $target"
        cp "$base" "$target"
    else
        echo "UN-NEEDED IMPORT: $file"
    fi
}

(
    cd "$basedir/CraftBukkit"
    lastlog=$($gitcmd log -1 --oneline)
    if [[ "$lastlog" = *"mc-dev Imports"* ]]; then
        $gitcmd reset --hard HEAD^
    fi
)

import RegionFile
import ChunkCoordIntPair
import NextTickListEntry
import ThreadServerApplication
import BlockChest
import BlockGrass
import BlockFlowing
import Packet10Flying
import ChunkLoader
import Container
import ContainerChest
import ContainerDispenser
import ContainerFurnace
import TileEntity

cd "$basedir/CraftBukkit"
$gitcmd add . -A >/dev/null 2>&1
echo -e "mc-dev Imports\n\n$MODLOG" | $gitcmd commit . -F -
)
