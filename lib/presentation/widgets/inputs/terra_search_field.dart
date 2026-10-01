import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraSearchField extends StatelessWidget {
  const TerraSearchField({
    required this.presentation,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    required this.onClear,
    required this.onFilter,
    required this.filterAvailable,
    super.key,
  });
  final InputPresentation presentation;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onClear;
  final VoidCallback onFilter;
  final bool filterAvailable;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Semantics(
        label: presentation.label,
        textField: true,
        enabled: presentation.enabled,
        child: SearchBar(
          controller: controller,
          enabled: presentation.enabled,
          hintText: presentation.hint,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            if (presentation.value.isNotEmpty)
              IconButton(
                onPressed: onClear,
                icon: const Icon(Icons.close),
                tooltip: 'Xóa tìm kiếm',
              ),
            if (filterAvailable)
              IconButton(
                onPressed: onFilter,
                icon: const Icon(Icons.tune),
                tooltip: 'Bộ lọc',
              ),
          ],
        ),
      ),
      if (presentation.errorText != null)
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 6),
          child: Text(
            presentation.errorText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        )
      else if (presentation.helperText != null)
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 6),
          child: Text(
            presentation.helperText!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
    ],
  );
}
