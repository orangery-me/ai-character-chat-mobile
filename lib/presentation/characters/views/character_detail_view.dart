import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_character_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_app_bar.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({required this.characterId, super.key});
  final String characterId;
  @override
  Widget build(BuildContext context) {
    final character = PhaseTwoFixtureCatalog.characters.firstWhere(
      (item) => item.id == characterId,
      orElse: () => PhaseTwoFixtureCatalog.featuredCharacter,
    );
    return TerraAppScaffold(
      appBar: TerraAppBar(
        title: character.name,
        focused: true,
        onBack: context.pop,
        actions: const <Widget>[],
      ),
      bottomNavigationBar: null,
      floatingActionButton: null,
      resizeToAvoidBottomInset: true,
      safeArea: true,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TerraCharacterCard(
            presentation: character,
            variant: CharacterCardVariant.featured,
            onSelected: () {},
            onPrimaryAction: () =>
                context.push('/conversations/${character.id}'),
            onSecondaryAction: () {},
          ),
          const SizedBox(height: 16),
          Text(
            'Về ${character.name}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(character.description),
        ],
      ),
    );
  }
}
