import 'package:flutter/material.dart';

enum PaginationPresentation { idle, appending, failed }

class TerraPaginationIndicator extends StatelessWidget {
  const TerraPaginationIndicator({
    required this.presentation,
    required this.semanticLabel,
    required this.onRetry,
    super.key,
  });
  final PaginationPresentation presentation;
  final String semanticLabel;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) => switch (presentation) {
    PaginationPresentation.idle => const SizedBox.shrink(),
    PaginationPresentation.appending => Semantics(
      label: semanticLabel,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(),
      ),
    ),
    PaginationPresentation.failed => Semantics(
      label: semanticLabel,
      child: TextButton.icon(
        onPressed: onRetry,
        icon: const Icon(Icons.refresh),
        label: Text(semanticLabel),
      ),
    ),
  };
}
