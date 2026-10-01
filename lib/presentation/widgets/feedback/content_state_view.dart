import 'package:ai_character_chat_mobile/presentation/widgets/feedback/terra_empty_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/feedback/terra_error_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/feedback/terra_skeleton.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class ContentStateView<T> extends StatelessWidget {
  const ContentStateView({
    required this.state,
    required this.contentBuilder,
    required this.onRetry,
    super.key,
  });
  final ContentState<T> state;
  final Widget Function(BuildContext context, T value) contentBuilder;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) => switch (state) {
    ContentLoading<T>() => const TerraSkeleton(
      itemCount: 4,
      semanticLabel: 'Đang tải',
    ),
    ContentReady<T>(value: final T value) => contentBuilder(context, value),
    ContentEmpty<T>(value: final EmptyPresentation value) => TerraEmptyState(
      presentation: value,
      onAction: null,
    ),
    ContentError<T>(value: final ErrorPresentation value) => TerraErrorState(
      presentation: value,
      onRetry: onRetry,
    ),
  };
}
