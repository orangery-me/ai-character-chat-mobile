import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraTextInput extends StatelessWidget {
  const TerraTextInput({
    required this.presentation,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    required this.onFocusChanged,
    required this.obscureText,
    required this.keyboardType,
    required this.textInputAction,
    super.key,
  });
  final InputPresentation presentation;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<bool> onFocusChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) => Focus(
    onFocusChange: onFocusChanged,
    child: TextField(
      controller: controller,
      enabled: presentation.enabled,
      readOnly: presentation.readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: presentation.label,
        hintText: presentation.hint,
        errorText: presentation.errorText,
        helperText: presentation.helperText,
      ),
    ),
  );
}
