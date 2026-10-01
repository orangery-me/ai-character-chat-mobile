import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NovelReaderView extends StatelessWidget {
  const NovelReaderView({
    required this.novelId,
    required this.chapterId,
    super.key,
  });
  final String novelId;
  final String chapterId;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: TerraAppBar(
      title: 'Khu vườn ký ức',
      focused: true,
      onBack: context.pop,
      actions: const <Widget>[],
    ),
    body: SafeArea(
      child: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Text('Chương 1', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(
              'Cánh cổng phủ rêu',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Buổi sáng ấy, khu vườn mở cánh cổng lần đầu tiên sau rất nhiều năm. Mùi đất ẩm và những trang sách cũ hòa vào trong gió.\n\nBạn bước qua lối đá nhỏ, biết rằng mỗi lựa chọn từ đây sẽ dẫn tới một ký ức khác.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            const LinearProgressIndicator(value: 0.35),
            const SizedBox(height: 8),
            Text(
              '35% chương',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
