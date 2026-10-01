import 'package:ai_character_chat_mobile/presentation/profile/models/profile_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ContentState<ProfilePresentation>> {
  ProfileCubit({required bool usesFixtures})
    : super(
        usesFixtures
            ? const ContentState<ProfilePresentation>.content(
                PhaseTwoFixtureCatalog.profile,
              )
            : const ContentState<ProfilePresentation>.empty(
                PhaseTwoFixtureCatalog.productionEmpty,
              ),
      );
}
