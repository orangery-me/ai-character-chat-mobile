#!/usr/bin/env bash
set -euo pipefail

fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
git diff --exit-code -- '*.g.dart' 'lib/generated/**'
fvm flutter analyze
fvm flutter test
fvm flutter build apk --debug --flavor dev -t lib/main_dev.dart --dart-define-from-file=config/dev.json
