import 'package:flutter/foundation.dart';

sealed class ContentState<T> {
  const ContentState();
  const factory ContentState.loading() = ContentLoading<T>;
  const factory ContentState.content(T value) = ContentReady<T>;
  const factory ContentState.empty(EmptyPresentation value) = ContentEmpty<T>;
  const factory ContentState.error(ErrorPresentation value) = ContentError<T>;
}

@immutable
class ContentLoading<T> extends ContentState<T> {
  const ContentLoading();
  @override
  bool operator ==(Object other) => other is ContentLoading<T>;
  @override
  int get hashCode => T.hashCode;
}

@immutable
class ContentReady<T> extends ContentState<T> {
  const ContentReady(this.value);
  final T value;
  @override
  bool operator ==(Object other) =>
      other is ContentReady<T> && other.value == value;
  @override
  int get hashCode => value.hashCode;
}

@immutable
class ContentEmpty<T> extends ContentState<T> {
  const ContentEmpty(this.value);
  final EmptyPresentation value;
}

@immutable
class ContentError<T> extends ContentState<T> {
  const ContentError(this.value);
  final ErrorPresentation value;
}

enum ActionState { enabled, disabled, loading }

@immutable
class ActionPresentation {
  const ActionPresentation({
    required this.label,
    required this.semanticLabel,
    required this.state,
  });
  final String label;
  final String semanticLabel;
  final ActionState state;
  bool get canActivate => state == ActionState.enabled;
}

@immutable
class InputPresentation {
  const InputPresentation({
    required this.label,
    required this.hint,
    required this.value,
    required this.errorText,
    required this.helperText,
    required this.countLabel,
    required this.enabled,
    required this.readOnly,
  });
  final String label;
  final String hint;
  final String value;
  final String? errorText;
  final String? helperText;
  final String? countLabel;
  final bool enabled;
  final bool readOnly;
}

enum ImageState { loading, ready, placeholder, error }

@immutable
class ImagePresentation {
  const ImagePresentation({
    required this.assetPath,
    required this.semanticLabel,
    required this.state,
  });
  final String? assetPath;
  final String semanticLabel;
  final ImageState state;
}

@immutable
class EmptyPresentation {
  const EmptyPresentation({
    required this.title,
    required this.message,
    required this.action,
  });
  final String title;
  final String message;
  final ActionPresentation? action;
}

@immutable
class ErrorPresentation {
  const ErrorPresentation({
    required this.title,
    required this.message,
    required this.retry,
  });
  final String title;
  final String message;
  final ActionPresentation? retry;
}
