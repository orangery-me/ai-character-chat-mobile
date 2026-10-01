import 'package:ai_character_chat_mobile/presentation/characters/models/character_creation_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCreationCubit extends Cubit<CharacterCreationPresentation> {
  CharacterCreationCubit()
    : super(PhaseTwoFixtureCatalog.characterCreation);
  void preview() {}
}
