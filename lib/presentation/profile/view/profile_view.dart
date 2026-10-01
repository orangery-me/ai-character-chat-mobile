import 'package:ai_character_chat_mobile/presentation/profile/bloc/profile_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/profile/models/profile_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_character_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_callout_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_chip_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_menu_list.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_metric_grid.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_page_header.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_section_title.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/feedback/content_state_view.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/destination_reselection_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({required this.usesFixtures, super.key});
  final bool usesFixtures;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) => ProfileCubit(usesFixtures: usesFixtures),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DestinationReselectionListener(
      destination: AppDestination.profile,
      controller: _scrollController,
      child: BlocBuilder<ProfileCubit, ContentState<ProfilePresentation>>(
        builder:
            (BuildContext context, ContentState<ProfilePresentation> state) {
              return ContentStateView<ProfilePresentation>(
                state: state,
                onRetry: () {},
                contentBuilder:
                    (BuildContext context, ProfilePresentation value) {
                      return ListView(
                        controller: _scrollController,
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 104),
                        children: <Widget>[
                          TerraPageHeader(
                            presentation: value.header,
                            actions: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.notifications_outlined),
                                tooltip: 'Thông báo',
                              ),
                            ],
                            onAvatarPressed: null,
                          ),
                          const SizedBox(height: 20),
                          TerraMetricGrid(
                            presentations: value.metrics,
                            minimumItemWidth: 112,
                          ),
                          const SizedBox(height: 20),
                          TerraCalloutCard(
                            presentation: value.creatorCallout,
                            onPressed: () {},
                          ),
                          const SizedBox(height: 20),
                          TerraChipGroup(
                            presentations: value.segments,
                            onSelected: (_, __) {},
                          ),
                          const SizedBox(height: 24),
                          TerraSectionTitle(
                            presentation: value.characterSection,
                            onTrailingPressed: () =>
                                context.push('/characters/create'),
                          ),
                          const SizedBox(height: 12),
                          ...value.characters.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TerraCharacterCard(
                                presentation: item,
                                variant: CharacterCardVariant.compact,
                                onSelected: () =>
                                    context.push('/characters/${item.id}'),
                                onPrimaryAction: () =>
                                    context.push('/conversations/${item.id}'),
                                onSecondaryAction: null,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TerraSectionTitle(
                            presentation: value.accountSection,
                            onTrailingPressed: null,
                          ),
                          const SizedBox(height: 12),
                          TerraMenuList(
                            presentations: value.accountItems,
                            onSelected: (_) {},
                          ),
                        ],
                      );
                    },
              );
            },
      ),
    );
  }
}
