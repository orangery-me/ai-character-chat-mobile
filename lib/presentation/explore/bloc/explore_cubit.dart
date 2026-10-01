import 'package:ai_character_chat_mobile/presentation/explore/models/explore_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ContentState<ExplorePresentation>> {
  ExploreCubit({required bool usesFixtures})
    : super(
        usesFixtures
            ? const ContentState<ExplorePresentation>.content(
                PhaseTwoFixtureCatalog.explore,
              )
            : const ContentState<ExplorePresentation>.empty(
                PhaseTwoFixtureCatalog.productionEmpty,
              ),
      );
}
