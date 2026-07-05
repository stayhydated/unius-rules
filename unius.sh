#!/usr/bin/env sh

RULES_FILE="99-unius.rules"
FILE_PATH="/etc/udev/rules.d/$RULES_FILE"

script_dir="$(cd "$(dirname "$0")" && pwd)"
rules_file="$script_dir/data/$RULES_FILE"

if [ ! -f "$rules_file" ]; then
    echo "Error: Rules file not found at $rules_file"
    exit 1
fi

sudo tee "$FILE_PATH" < "$rules_file" > /dev/null

sudo udevadm control --reload-rules
sudo udevadm trigger

bat "$FILE_PATH"
