import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_primary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraBottomSheet extends StatelessWidget {
  const TerraBottomSheet({
    required this.title,
    required this.content,
    required this.primaryAction,
    required this.dismissible,
    required this.onPrimary,
    super.key,
  });

  final String title;
  final Widget content;
  final ActionPresentation? primaryAction;
  final bool dismissible;
  final VoidCallback? onPrimary;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: dismissible,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            16,
            20,
            20 + MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.85,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  content,
                  if (primaryAction != null && onPrimary != null) ...<Widget>[
                    const SizedBox(height: 20),
                    TerraPrimaryButton(
                      presentation: primaryAction!,
                      onPressed: onPrimary!,
                      expand: true,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
