import 'package:flutter/material.dart';

class TerraAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TerraAppBar({
    required this.title,
    required this.focused,
    required this.onBack,
    required this.actions,
    super.key,
  });
  final String title;
  final bool focused;
  final VoidCallback? onBack;
  final List<Widget> actions;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) => AppBar(
    title: Text(title),
    automaticallyImplyLeading: false,
    leading: focused
        ? IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back',
          )
        : null,
    actions: actions,
  );
}
