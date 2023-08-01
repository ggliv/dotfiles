#!/usr/bin/env bash
set -e

BASE_DIR="$(cd $(dirname "$0"); pwd)"

cd "$BASE_DIR"

# Add contents of .config
for e in .config/*; do
    if [ -d ~/"$e" ]; then
        printf "Delete existing config directory ~/%s? " "$e"
        read c
        [ "$c" = "y" ] && rm -rf ~/"$e"
    fi
    ln -sfib "$BASE_DIR"/"$e" ~/"$(dirname "$e")"
done

# Add top-level files prefixed with .
for e in \.*; do
    [ -d "$e" ] && continue
    ln -sfib "$BASE_DIR"/"$e" ~/"$e"
done
