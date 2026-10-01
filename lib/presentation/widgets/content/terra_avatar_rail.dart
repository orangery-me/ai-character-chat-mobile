import 'package:ai_character_chat_mobile/presentation/widgets/media/terra_avatar.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraAvatarRail extends StatelessWidget {
  const TerraAvatarRail({
    required this.avatars,
    required this.onSelected,
    super.key,
  });
  final List<AvatarPresentation> avatars;
  final ValueChanged<int> onSelected;
  @override
  Widget build(BuildContext context) => SizedBox(
    height: 76,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: avatars.length,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (BuildContext context, int index) => TerraAvatar(
        presentation: avatars[index],
        size: 56,
        onPressed: () => onSelected(index),
      ),
    ),
  );
}
