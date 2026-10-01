import 'package:ai_character_chat_mobile/presentation/messages/models/messages_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesCubit extends Cubit<ContentState<MessagesPresentation>> {
  MessagesCubit({required bool usesFixtures})
    : super(
        usesFixtures
            ? const ContentState<MessagesPresentation>.content(
                PhaseTwoFixtureCatalog.messages,
              )
            : const ContentState<MessagesPresentation>.empty(
                PhaseTwoFixtureCatalog.productionEmpty,
              ),
      );
}
