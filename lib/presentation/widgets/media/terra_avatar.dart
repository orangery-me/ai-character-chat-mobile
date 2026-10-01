import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraAvatar extends StatelessWidget {
  const TerraAvatar({
    required this.presentation,
    required this.size,
    required this.onPressed,
    super.key,
  });
  final AvatarPresentation presentation;
  final double size;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TerraColors>()!;
    final statusColor = switch (presentation.statusIntent) {
      StatusIntent.online => colors.online,
      StatusIntent.warning => colors.warning,
      StatusIntent.unread => colors.terracotta,
      StatusIntent.neutral => colors.textMuted,
    };
    final avatar = Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        CircleAvatar(
          radius: size / 2,
          backgroundColor: colors.primaryContainer,
          foregroundImage:
              presentation.image.state == ImageState.ready &&
                  presentation.image.assetPath != null
              ? AssetImage(presentation.image.assetPath!)
              : null,
          child: Text(presentation.initials),
        ),
        if (presentation.showStatus)
          Positioned(
            right: 0,
            bottom: 0,
            child: Semantics(
              label: presentation.statusLabel,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.surfaceContainerLowest,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
    return Semantics(
      label: presentation.semanticLabel,
      button: onPressed != null,
      child: SizedBox(
        width: size < 48 ? 48 : size,
        height: size < 48 ? 48 : size,
        child: Center(
          child: onPressed == null
              ? avatar
              : InkWell(
                  onTap: onPressed,
                  customBorder: const CircleBorder(),
                  child: avatar,
                ),
        ),
      ),
    );
  }
}
