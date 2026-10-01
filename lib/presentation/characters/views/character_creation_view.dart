import 'package:ai_character_chat_mobile/presentation/characters/bloc/character_creation_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/characters/models/character_creation_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_primary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_action_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_chip_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_numbered_section.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/inputs/terra_prompt_input.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/inputs/terra_text_input.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/media/terra_image_frame.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_app_bar.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CharacterCreationPage extends StatelessWidget {
  const CharacterCreationPage({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider<CharacterCreationCubit>(
    create: (_) => CharacterCreationCubit(),
    child: const CharacterCreationView(),
  );
}

class CharacterCreationView extends StatefulWidget {
  const CharacterCreationView({super.key});
  @override
  State<CharacterCreationView> createState() => _CharacterCreationViewState();
}

class _CharacterCreationViewState extends State<CharacterCreationView> {
  final _name = TextEditingController();
  final _role = TextEditingController();
  final _prompt = TextEditingController();
  final _greeting = TextEditingController();
  @override
  void dispose() {
    _name.dispose();
    _role.dispose();
    _prompt.dispose();
    _greeting.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CharacterCreationCubit, CharacterCreationPresentation>(
        builder: (BuildContext context, CharacterCreationPresentation value) =>
            TerraAppScaffold(
              appBar: TerraAppBar(
                title: 'Tạo nhân vật AI mới',
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
                  Text(
                    value.notice,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  TerraNumberedSection(
                    presentation: value.imageSection,
                    child: Column(
                      children: <Widget>[
                        TerraImageFrame(
                          presentation: value.image,
                          aspectRatio: 16 / 9,
                          borderRadius: BorderRadius.circular(12),
                          onRetry: null,
                        ),
                        const SizedBox(height: 12),
                        TerraActionGroup(
                          primary: value.generateImage,
                          secondary: value.uploadImage,
                          onPrimaryPressed: () {},
                          onSecondaryPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TerraNumberedSection(
                    presentation: value.basicSection,
                    child: Column(
                      children: <Widget>[
                        TerraTextInput(
                          presentation: value.name,
                          controller: _name,
                          onChanged: (_) {},
                          onSubmitted: (_) {},
                          onFocusChanged: (_) {},
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        TerraTextInput(
                          presentation: value.role,
                          controller: _role,
                          onChanged: (_) {},
                          onSubmitted: (_) {},
                          onFocusChanged: (_) {},
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TerraNumberedSection(
                    presentation: value.personalitySection,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          value.relationshipLabel,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: 8),
                        TerraChipGroup(
                          presentations: value.relationships,
                          onSelected: (_, __) {},
                        ),
                        const SizedBox(height: 16),
                        Text(
                          value.personalityLabel,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: 8),
                        TerraChipGroup(
                          presentations: value.personalities,
                          onSelected: (_, __) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TerraNumberedSection(
                    presentation: value.contextSection,
                    child: Column(
                      children: <Widget>[
                        TerraPromptInput(
                          presentation: value.prompt,
                          controller: _prompt,
                          minimumLines: 5,
                          maximumLines: 8,
                          onChanged: (_) {},
                          onFocusChanged: (_) {},
                        ),
                        const SizedBox(height: 12),
                        TerraPromptInput(
                          presentation: value.greeting,
                          controller: _greeting,
                          minimumLines: 3,
                          maximumLines: 5,
                          onChanged: (_) {},
                          onFocusChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TerraPrimaryButton(
                    presentation: value.submit,
                    onPressed: context.read<CharacterCreationCubit>().preview,
                    expand: true,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
      );
}
