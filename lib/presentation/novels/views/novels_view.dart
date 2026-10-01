import 'package:ai_character_chat_mobile/presentation/novels/bloc/novels_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/novels/models/novels_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_novel_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_avatar_rail.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_callout_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_chip_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_page_header.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_section_title.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/feedback/content_state_view.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/inputs/terra_search_field.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/destination_reselection_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NovelsView extends StatefulWidget {
  const NovelsView({super.key});
  @override
  State<NovelsView> createState() => _NovelsViewState();
}

class _NovelsViewState extends State<NovelsView> {
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
    destination: AppDestination.novels,
    controller: _scroll,
    child: BlocBuilder<NovelsCubit, ContentState<NovelsPresentation>>(
      builder: (BuildContext context, ContentState<NovelsPresentation> state) =>
          ContentStateView<NovelsPresentation>(
            state: state,
            onRetry: () {},
            contentBuilder: (BuildContext context, NovelsPresentation value) =>
                ListView(
                  controller: _scroll,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 104),
                  children: <Widget>[
                    TerraPageHeader(
                      presentation: value.header,
                      actions: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_border),
                          tooltip: 'Đã lưu',
                        ),
                      ],
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
                      presentations: value.categories,
                      onSelected: (_, __) {},
                    ),
                    const SizedBox(height: 24),
                    TerraSectionTitle(
                      presentation: value.featuredSection,
                      onTrailingPressed: null,
                    ),
                    const SizedBox(height: 12),
                    TerraNovelCard(
                      presentation: value.featured,
                      variant: NovelCardVariant.featured,
                      onSelected: () => context.push(
                        '/novels/${value.featured.id}/chapters/chapter-1',
                      ),
                      onSecondaryAction: () {},
                    ),
                    const SizedBox(height: 20),
                    TerraSectionTitle(
                      presentation: value.storyCharacterSection,
                      onTrailingPressed: null,
                    ),
                    const SizedBox(height: 8),
                    TerraAvatarRail(
                      avatars: value.storyCharacters,
                      onSelected: (_) {},
                    ),
                    const SizedBox(height: 20),
                    TerraCalloutCard(
                      presentation: value.roleplayCallout,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 28),
                    TerraSectionTitle(
                      presentation: value.trendingSection,
                      onTrailingPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    ...value.trending.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: TerraNovelCard(
                          presentation: item,
                          variant: NovelCardVariant.compact,
                          onSelected: () => context.push(
                            '/novels/${item.id}/chapters/chapter-1',
                          ),
                          onSecondaryAction: null,
                        ),
                      ),
                    ),
                  ],
                ),
          ),
    ),
  );
}
