import 'package:ai_character_chat_mobile/presentation/messages/bloc/messages_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/messages/models/messages_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_avatar_rail.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_conversation_card.dart';
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

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});
  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
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
    destination: AppDestination.messages,
    controller: _scroll,
    child: BlocBuilder<MessagesCubit, ContentState<MessagesPresentation>>(
      builder:
          (BuildContext context, ContentState<MessagesPresentation> state) =>
              ContentStateView<MessagesPresentation>(
                state: state,
                onRetry: () {},
                contentBuilder:
                    (BuildContext context, MessagesPresentation value) =>
                        ListView(
                          controller: _scroll,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 104),
                          children: <Widget>[
                            TerraPageHeader(
                              presentation: value.header,
                              actions: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.notifications_outlined,
                                  ),
                                  tooltip: 'Thông báo',
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
                              filterAvailable: false,
                            ),
                            const SizedBox(height: 24),
                            TerraSectionTitle(
                              presentation: value.onlineSection,
                              onTrailingPressed: null,
                            ),
                            const SizedBox(height: 12),
                            TerraAvatarRail(
                              avatars: value.onlineAvatars,
                              onSelected: (_) {},
                            ),
                            const SizedBox(height: 12),
                            TerraChipGroup(
                              presentations: value.filters,
                              onSelected: (_, __) {},
                            ),
                            const SizedBox(height: 24),
                            TerraSectionTitle(
                              presentation: value.conversationSection,
                              onTrailingPressed: null,
                            ),
                            ...value.conversations.map(
                              (item) => TerraConversationCard(
                                presentation: item,
                                onPressed: () =>
                                    context.push('/conversations/${item.id}'),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TerraCalloutCard(
                              presentation: value.suggestion,
                              onPressed: () {},
                            ),
                          ],
                        ),
              ),
    ),
  );
}
