import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppShellState {
  const AppShellState({
    required this.selected,
    required this.reselectionRevisions,
  });
  factory AppShellState.initial() => const AppShellState(
    selected: AppDestination.explore,
    reselectionRevisions: <AppDestination, int>{
      AppDestination.explore: 0,
      AppDestination.messages: 0,
      AppDestination.novels: 0,
      AppDestination.profile: 0,
    },
  );
  final AppDestination selected;
  final Map<AppDestination, int> reselectionRevisions;
  AppShellState select(AppDestination destination) {
    if (destination != selected) {
      return AppShellState(
        selected: destination,
        reselectionRevisions: reselectionRevisions,
      );
    }
    final copy = Map<AppDestination, int>.of(reselectionRevisions);
    copy[destination] = (copy[destination] ?? 0) + 1;
    return AppShellState(
      selected: selected,
      reselectionRevisions: Map<AppDestination, int>.unmodifiable(copy),
    );
  }
}
