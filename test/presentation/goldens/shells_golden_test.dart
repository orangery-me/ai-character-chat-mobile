import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/characters/views/character_creation_view.dart';
import 'package:ai_character_chat_mobile/presentation/characters/views/character_detail_view.dart';
import 'package:ai_character_chat_mobile/presentation/chat/views/chat_view.dart';
import 'package:ai_character_chat_mobile/presentation/core/bloc/app_shell_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/presentation/explore/bloc/explore_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/explore/views/explore_view.dart';
import 'package:ai_character_chat_mobile/presentation/messages/bloc/messages_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/messages/views/messages_view.dart';
import 'package:ai_character_chat_mobile/presentation/novel_reader/views/novel_reader_view.dart';
import 'package:ai_character_chat_mobile/presentation/novels/bloc/novels_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/novels/views/novels_view.dart';
import 'package:ai_character_chat_mobile/presentation/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_support/terra_test_app.dart';

void main() {
  testWidgets('eight representative shells use the Terra light theme', (
    WidgetTester tester,
  ) async {
    await loadTerraFonts(tester);
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final shells = <String, Widget Function()>{
      'explore_shell.png': () => MultiBlocProvider(
        providers: [
          BlocProvider<AppShellCubit>(
            create: (_) =>
                AppShellCubit(initialDestination: AppDestination.explore),
          ),
          BlocProvider<ExploreCubit>(
            create: (_) => ExploreCubit(usesFixtures: true),
          ),
        ],
        child: const ExploreView(),
      ),
      'messages_shell.png': () => MultiBlocProvider(
        providers: [
          BlocProvider<AppShellCubit>(
            create: (_) =>
                AppShellCubit(initialDestination: AppDestination.messages),
          ),
          BlocProvider<MessagesCubit>(
            create: (_) => MessagesCubit(usesFixtures: true),
          ),
        ],
        child: const MessagesView(),
      ),
      'novels_shell.png': () => MultiBlocProvider(
        providers: [
          BlocProvider<AppShellCubit>(
            create: (_) =>
                AppShellCubit(initialDestination: AppDestination.novels),
          ),
          BlocProvider<NovelsCubit>(
            create: (_) => NovelsCubit(usesFixtures: true),
          ),
        ],
        child: const NovelsView(),
      ),
      'profile_shell.png': () => BlocProvider<AppShellCubit>(
        create: (_) =>
            AppShellCubit(initialDestination: AppDestination.profile),
        child: const ProfilePage(usesFixtures: true),
      ),
      'creation_shell.png': () => const CharacterCreationPage(),
      'character_detail_shell.png': () =>
          const CharacterDetailView(characterId: 'an'),
      'chat_shell.png': () => const ChatView(conversationId: 'an'),
      'reader_shell.png': () => const NovelReaderView(
        novelId: 'memory-garden',
        chapterId: 'chapter-1',
      ),
    };

    for (final entry in shells.entries) {
      await tester.pumpWidget(
        MaterialApp(
          theme: terraLightTheme,
          home: Scaffold(body: entry.value()),
        ),
      );
      await precacheTerraPreviewImages(tester);
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Scaffold).first,
        matchesGoldenFile('goldens/${entry.key}'),
      );
    }
  });
}
