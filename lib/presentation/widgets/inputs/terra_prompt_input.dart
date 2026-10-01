import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraPromptInput extends StatelessWidget {
  const TerraPromptInput({
    required this.presentation,
    required this.controller,
    required this.minimumLines,
    required this.maximumLines,
    required this.onChanged,
    required this.onFocusChanged,
    super.key,
  });
  final InputPresentation presentation;
  final TextEditingController controller;
  final int minimumLines;
  final int maximumLines;
  final ValueChanged<String> onChanged;
  final ValueChanged<bool> onFocusChanged;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Focus(
        onFocusChange: onFocusChanged,
        child: TextField(
          controller: controller,
          enabled: presentation.enabled,
          readOnly: presentation.readOnly,
          minLines: minimumLines,
          maxLines: maximumLines,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: presentation.label,
            hintText: presentation.hint,
            errorText: presentation.errorText,
            helperText: presentation.helperText,
            alignLabelWithHint: true,
          ),
        ),
      ),
      if (presentation.countLabel != null)
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 4),
          child: Text(
            presentation.countLabel!,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.end,
          ),
        ),
    ],
  );
}
