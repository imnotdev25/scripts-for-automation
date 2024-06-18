#!/bin/bash
## This script will remove disabled snap revisions and clean up the snap cache.
## Run this script using sudo
echo "Removing Unused Snap Packages ........"
LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read name rev; do
        snap remove "$name" --revision="$rev"
    done

echo  "\033[0;32m Done :) \033[0m"
