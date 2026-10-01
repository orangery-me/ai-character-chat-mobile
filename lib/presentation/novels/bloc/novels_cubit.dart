import 'package:ai_character_chat_mobile/presentation/novels/models/novels_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NovelsCubit extends Cubit<ContentState<NovelsPresentation>> {
  NovelsCubit({required bool usesFixtures})
    : super(
        usesFixtures
            ? const ContentState<NovelsPresentation>.content(
                PhaseTwoFixtureCatalog.novelsPresentation,
              )
            : const ContentState<NovelsPresentation>.empty(
                PhaseTwoFixtureCatalog.productionEmpty,
              ),
      );
}
