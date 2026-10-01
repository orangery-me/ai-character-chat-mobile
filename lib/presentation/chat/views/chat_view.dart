import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_chat_bubble.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/inputs/terra_prompt_input.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatView extends StatefulWidget {
  const ChatView({required this.conversationId, super.key});
  final String conversationId;
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _input = TextEditingController();
  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const input = InputPresentation(
      label: 'Tin nhắn',
      hint: 'Nhập tin nhắn xem trước',
      value: '',
      errorText: null,
      helperText: 'Chưa kết nối tính năng gửi',
      countLabel: null,
      enabled: true,
      readOnly: false,
    );
    const messages = <ChatBubblePresentation>[
      ChatBubblePresentation(
        message: 'Chào bạn, hôm nay mình cùng viết một câu chuyện nhé?',
        timeLabel: '09:40',
        speaker: ChatSpeaker.character,
        speakerLabel: 'An',
      ),
      ChatBubblePresentation(
        message: 'Mình muốn bắt đầu từ một khu vườn bí mật.',
        timeLabel: '09:41',
        speaker: ChatSpeaker.member,
        speakerLabel: 'Bạn',
      ),
    ];
    return Scaffold(
      appBar: TerraAppBar(
        title: 'Trò chuyện',
        focused: true,
        onBack: context.pop,
        actions: const <Widget>[],
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: messages
                    .map((item) => TerraChatBubble(presentation: item))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TerraPromptInput(
                presentation: input,
                controller: _input,
                minimumLines: 1,
                maximumLines: 4,
                onChanged: (_) {},
                onFocusChanged: (_) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
