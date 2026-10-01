import 'package:ai_character_chat_mobile/presentation/explore/bloc/explore_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/explore/models/explore_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_character_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_character_rail.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_callout_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_chip_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_page_header.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_section_title.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/feedback/content_state_view.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/inputs/terra_search_field.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/destination_reselection_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});
  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final _scroll = ScrollController();
  final _search = TextEditingController();
  @override
  void dispose() {
    _scroll.dispose();
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DestinationReselectionListener(
    destination: AppDestination.explore,
    controller: _scroll,
    child: BlocBuilder<ExploreCubit, ContentState<ExplorePresentation>>(
      builder:
          (
            BuildContext context,
            ContentState<ExplorePresentation> state,
          ) => ContentStateView<ExplorePresentation>(
            state: state,
            onRetry: () {},
            contentBuilder: (BuildContext context, ExplorePresentation value) =>
                ListView(
                  controller: _scroll,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 104),
                  children: <Widget>[
                    TerraPageHeader(
                      presentation: value.header,
                      actions: const <Widget>[],
                      onAvatarPressed: null,
                    ),
                    const SizedBox(height: 16),
                    TerraSearchField(
                      presentation: value.search,
                      controller: _search,
                      onChanged: (_) {},
                      onSubmitted: (_) {},
                      onClear: _search.clear,
                      onFilter: () {},
                      filterAvailable: true,
                    ),
                    const SizedBox(height: 12),
                    TerraChipGroup(
                      presentations: value.filters,
                      onSelected: (_, __) {},
                    ),
                    const SizedBox(height: 24),
                    TerraSectionTitle(
                      presentation: value.featuredSection,
                      onTrailingPressed: null,
                    ),
                    const SizedBox(height: 12),
                    TerraCharacterCard(
                      presentation: value.featured,
                      variant: CharacterCardVariant.featured,
                      onSelected: () =>
                          context.push('/characters/${value.featured.id}'),
                      onPrimaryAction: () =>
                          context.push('/conversations/${value.featured.id}'),
                      onSecondaryAction: () {},
                    ),
                    const SizedBox(height: 28),
                    TerraCharacterRail(
                      presentation: CharacterRailPresentation(
                        section: value.recommendedSection,
                        characters: value.recommended,
                      ),
                      onCharacterSelected: (String id) =>
                          context.push('/characters/$id'),
                      onPrimaryAction: (String id) =>
                          context.push('/conversations/$id'),
                      onSecondaryAction: null,
                      onTrailingPressed: null,
                    ),
                    const SizedBox(height: 24),
                    TerraCalloutCard(
                      presentation: value.creationCallout,
                      onPressed: () => context.push('/characters/create'),
                    ),
                    const SizedBox(height: 28),
                    TerraCharacterRail(
                      presentation: CharacterRailPresentation(
                        section: value.popularSection,
                        characters: value.popular,
                      ),
                      onCharacterSelected: (String id) =>
                          context.push('/characters/$id'),
                      onPrimaryAction: (String id) =>
                          context.push('/conversations/$id'),
                      onSecondaryAction: null,
                      onTrailingPressed: () {},
                    ),
                  ],
                ),
          ),
    ),
  );
}
