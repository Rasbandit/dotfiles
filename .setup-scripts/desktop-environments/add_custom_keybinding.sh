#!/bin/bash

add_custom_keybinding() {
    local NAME="$1"
    local COMMAND="$2"
    local BINDING="$3"

    # Get existing bindings
    local key_list
    key_list=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

    # Use Python for robust list handling
    python3 - "$NAME" "$COMMAND" "$BINDING" "$key_list" <<'END'
import ast, sys, subprocess

NAME, COMMAND, BINDING = sys.argv[1:4]
key_list = sys.argv[4]

def do(cmd):
    r = subprocess.run(cmd)
    if r.returncode != 0:
        print("Failed:", cmd)
    return r

# Parse list
if key_list.startswith('@as '):
    key_list = ast.literal_eval(key_list[4:])
else:
    key_list = ast.literal_eval(key_list)
paths = list(key_list)

# See if we already have this shortcut by name
found_path = None
for path in paths:
    getname = subprocess.run([
        "gsettings", "get",
        f"org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:{path}", "name"
    ], capture_output=True, text=True)
    # name is quoted string from gsettings output
    name_value = getname.stdout.strip().strip("'\"")
    if name_value == NAME:
        found_path = path
        break

if found_path is None:
    # Not found; make a new one with next available customN/
    idx = 0
    while True:
        candidate = f"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom{idx}/"
        if candidate not in paths:
            found_path = candidate
            paths.append(found_path)
            break
        idx += 1

# Update/add the entry
do([
    "gsettings", "set",
    f"org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:{found_path}",
    "name", NAME
])
do([
    "gsettings", "set",
    f"org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:{found_path}",
    "command", COMMAND
])
do([
    "gsettings", "set",
    f"org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:{found_path}",
    "binding", BINDING
])

# Update the list only if new
if found_path not in key_list:
    gsettings_list = str(paths).replace("'", '"')
    do([
        "gsettings", "set",
        "org.gnome.settings-daemon.plugins.media-keys",
        "custom-keybindings", gsettings_list
    ])
END
}