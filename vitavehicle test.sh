#!/bin/sh
echo -ne '\033c\033]0;Godot Vehicle\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/vitavehicle test.x86_64" "$@"
