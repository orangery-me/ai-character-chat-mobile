import 'package:flutter/material.dart';

class TerraSkeleton extends StatelessWidget {
  const TerraSkeleton({
    required this.itemCount,
    required this.semanticLabel,
    super.key,
  });

  final int itemCount;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      liveRegion: true,
      child: Column(
        children: List<Widget>.generate(
          itemCount,
          (int index) => Container(
            height: index == 0 ? 160 : 72,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
