# AI Character Chat Mobile

Flutter client pinned with FVM to Flutter 3.38.10.

## Setup

```bash
fvm install
fvm flutter pub get
```

Runtime values are explicit per flavor in `config/dev.json`, `config/staging.json`, and `config/prod.json`. These files may contain the Supabase publishable key, but must never contain the Supabase secret key, database credentials, refresh tokens, or signing secrets.

## Run

```bash
fvm flutter run --flavor dev -t lib/main_dev.dart --dart-define-from-file=config/dev.json
fvm flutter run --flavor staging -t lib/main_staging.dart --dart-define-from-file=config/staging.json
fvm flutter run --flavor prod -t lib/main_prod.dart --dart-define-from-file=config/prod.json
```

Android emulator development uses the backend origin declared in `config/dev.json`. Update it explicitly when using a physical device.

## Authentication foundation

- Access tokens live in memory only.
- Refresh tokens use operating-system secure storage.
- Hive contains only non-secret cached profile data.
- A failed refresh is retried once with the same request ID.
- Only definitive authentication rejection clears the refresh token.
- GoRouter redirects splash, login/register, and the protected root from explicit auth state.

## Quality checks

```bash
fvm flutter analyze
fvm flutter test
fvm flutter build apk --debug --flavor dev -t lib/main_dev.dart --dart-define-from-file=config/dev.json
```

Phase 1 does not implement character discovery, character creation, AI chat, or the novel reader.
