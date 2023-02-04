#!/bin/bash

if [ -z "$RIMWORLD_PATH" ]; then
  echo "Error: RIMWORLD_PATH is undefined"
  exit 1
fi
MOD_PATH="$RIMWORLD_PATH/Mods/AHBT"

sed -ri '' "s/Version: [0-9\.]+/Version: $(cat VERSION)/" About/About.xml
rm -rf "$MOD_PATH"
mkdir -p "$MOD_PATH"
git ls-files | grep -Ev 'deploy.sh' | while read file; do
  mkdir -p "$(dirname "$MOD_PATH/$file")"
  cp "$file" "$MOD_PATH/$file"
done
echo "Done"
