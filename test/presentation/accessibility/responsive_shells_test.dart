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

void main() {
  testWidgets(
    'eight representative shells fit the target viewport and text-scale matrix',
    (WidgetTester tester) async {
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final shellFactories = <Widget Function()>[
        () => MultiBlocProvider(
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
        () => MultiBlocProvider(
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
        () => MultiBlocProvider(
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
        () => BlocProvider<AppShellCubit>(
          create: (_) =>
              AppShellCubit(initialDestination: AppDestination.profile),
          child: const ProfilePage(usesFixtures: true),
        ),
        () => const CharacterCreationPage(),
        () => const CharacterDetailView(characterId: 'an'),
        () => const ChatView(conversationId: 'an'),
        () => const NovelReaderView(
          novelId: 'memory-garden',
          chapterId: 'chapter-1',
        ),
      ];
      const sizes = <Size>[Size(320, 568), Size(390, 844), Size(412, 915)];
      const scales = <double>[1, 2];

      for (final size in sizes) {
        tester.view.physicalSize = size;
        for (final scale in scales) {
          for (
            int shellIndex = 0;
            shellIndex < shellFactories.length;
            shellIndex++
          ) {
            final createShell = shellFactories[shellIndex];
            await tester.pumpWidget(
              MaterialApp(
                theme: terraLightTheme,
                builder: (BuildContext context, Widget? child) => MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.linear(scale)),
                  child: child!,
                ),
                home: Scaffold(body: createShell()),
              ),
            );
            await tester.pump();
            expect(
              tester.takeException(),
              isNull,
              reason: 'Shell $shellIndex failed at $size with ${scale}x text.',
            );
          }
        }
      }
    },
  );
}
