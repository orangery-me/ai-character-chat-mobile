import 'package:ai_character_chat_mobile/presentation/widgets/feedback/terra_error_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class UnavailableRouteState extends StatelessWidget {
  const UnavailableRouteState({required this.onBack, super.key});
  final VoidCallback onBack;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Không thể mở nội dung')),
    body: Center(
      child: TerraErrorState(
        presentation: const ErrorPresentation(
          title: 'Nội dung không khả dụng',
          message: 'Đường dẫn không hợp lệ hoặc nội dung không còn tồn tại.',
          retry: ActionPresentation(
            label: 'Quay lại',
            semanticLabel: 'Quay lại',
            state: ActionState.enabled,
          ),
        ),
        onRetry: onBack,
      ),
    ),
  );
}
