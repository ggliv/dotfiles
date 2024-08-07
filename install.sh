#!/usr/bin/env bash
set -e

BASE_DIR="$(cd $(dirname "$0"); pwd)"

cd "$BASE_DIR"

CONFIG_DIR="$XDG_DESKTOP_HOME"
[ -z "$CONFIG_DIR" ] && CONFIG_DIR=~/.config

# Add contents of .config
for e in config/*; do
  de="$CONFIG_DIR"/"$(basename -- $e)"
  if [ -e ~/"$de" ]; then
    printf "Replace existing config directory ~/%s? " "$de"
    read c
    if [ "$c" = "y" ]; then
      mv ~/"$de" ~/"$de"~
      echo "Placed backup at ~/$de~"
    fi
  fi
  ln -sfib "$BASE_DIR"/"$e" "$de"
done

# Add top-level files prefixed with .
for e in home/\.*; do
  [ -d "$e" ] && continue
  ln -sfib "$BASE_DIR"/"$e" ~/"$(basename -- $e)"
done
