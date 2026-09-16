# AI Character Chat Mobile

Flutter mobile client for AI Character Chat.

## Flutter

This project uses FVM with Flutter `3.38.10`.

```bash
fvm install
fvm flutter --version
fvm flutter pub get
```

## Environments

Runtime configuration is split by environment:

- `config/dev.json`
- `config/staging.json`
- `config/prod.json`

## Run

```bash
fvm flutter run --flavor dev -t lib/main_dev.dart --dart-define-from-file config/dev.json
fvm flutter run --flavor staging -t lib/main_staging.dart --dart-define-from-file config/staging.json
fvm flutter run --flavor prod -t lib/main_prod.dart --dart-define-from-file config/prod.json
```

The same commands are also available in `.vscode/tasks.json`.

## Build

```bash
fvm flutter build apk --flavor dev -t lib/main_dev.dart --dart-define-from-file config/dev.json
fvm flutter build apk --flavor staging -t lib/main_staging.dart --dart-define-from-file config/staging.json
fvm flutter build apk --flavor prod -t lib/main_prod.dart --dart-define-from-file config/prod.json
```

## Quality

```bash
fvm flutter analyze
```
