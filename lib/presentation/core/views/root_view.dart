import 'package:ai_character_chat_mobile/di/di.dart';
import 'package:ai_character_chat_mobile/presentation/core/widgets/crystal_bottom_navigation_bar.dart';
import 'package:ai_character_chat_mobile/presentation/home/bloc/chat/chat_bloc.dart';
import 'package:ai_character_chat_mobile/presentation/home/widgets/bubble_chat/chat_bubble_floating.dart';
import 'package:ai_character_chat_mobile/presentation/home/widgets/bubble_chat/chat_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_character_chat_mobile/presentation/core/bloc/root_bloc.dart';
import 'package:ai_character_chat_mobile/presentation/core/widgets/slide_lazy_indexed_stack.dart';
import 'package:ai_character_chat_mobile/presentation/home/home.dart';
import 'package:ai_character_chat_mobile/presentation/profile/profile.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RootBloc()),
        BlocProvider(create: (_) => getIt<ChatBloc>()),
      ],
      child: _RootView(),
    );
  }
}

class _RootView extends StatefulWidget {
  @override
  State<_RootView> createState() => _RootViewState();
}

class _RootViewState extends State<_RootView> {
  bool showPopup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          BlocBuilder<RootBloc, RootState>(
            builder: (context, state) {
              return SlideIndexedStack(
                index: state.currentIndex,
                children: [
                  const HomePage(),
                  const ProfilePage(),
                ],
              );
            },
            buildWhen: (previous, current) {
              return previous.currentIndex != current.currentIndex;
            },
          ),
          if (showPopup)
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => setState(() => showPopup = false),
                child: const SizedBox.shrink(),
              ),
            ),
          if (showPopup)
            ChatPopup(
              onClose: () => setState(() => showPopup = false),
            ),
          FloatingChatBubble(
            isOpen: showPopup,
            onTap: () => setState(() => showPopup = !showPopup),
          ),
        ],
      ),
      bottomNavigationBar: const CrystalBottomNavigationBar(),
    );
  }
}
