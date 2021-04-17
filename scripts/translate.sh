#!/usr/bin/env sh

set -e # Exit on first failed command

# Variables
LOCO_READ_KEY="PT4Az8sqJ_VF22jimP21_fh5gGHFlckZ"

# Get packages
flutter packages get

# Export translations from Loco
curl -s -o "lang/en.yaml" "https://localise.biz/api/export/locale/en-US.yml?format=simple&key=$LOCO_READ_KEY"

# Run build runner
fvm flutter pub run build_runner build --delete-conflicting-outputs