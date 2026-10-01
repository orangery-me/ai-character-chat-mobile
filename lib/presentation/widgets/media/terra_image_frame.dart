import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraImageFrame extends StatelessWidget {
  const TerraImageFrame({
    required this.presentation,
    required this.aspectRatio,
    required this.borderRadius,
    required this.onRetry,
    super.key,
  });
  final ImagePresentation presentation;
  final double aspectRatio;
  final BorderRadius borderRadius;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) => Semantics(
    label: presentation.semanticLabel,
    image: true,
    child: AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
          ),
          child: switch (presentation.state) {
            ImageState.loading => const Center(
              child: CircularProgressIndicator(),
            ),
            ImageState.ready => Image.asset(
              presentation.assetPath!,
              fit: BoxFit.cover,
              errorBuilder:
                  (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) => const Center(child: Icon(Icons.broken_image_outlined)),
            ),
            ImageState.placeholder => const Center(
              child: Icon(Icons.image_outlined, size: 40),
            ),
            ImageState.error => Center(
              child: IconButton(
                onPressed: onRetry,
                icon: const Icon(Icons.broken_image_outlined),
                tooltip: presentation.semanticLabel,
              ),
            ),
          },
        ),
      ),
    ),
  );
}
