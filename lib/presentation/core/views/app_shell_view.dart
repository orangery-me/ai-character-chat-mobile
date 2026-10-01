import 'package:ai_character_chat_mobile/presentation/core/bloc/app_shell_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/character_creation_action.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppShellView extends StatefulWidget {
  const AppShellView({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;
  @override
  State<AppShellView> createState() => _AppShellViewState();
}

class _AppShellViewState extends State<AppShellView> {
  late final AppShellCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = AppShellCubit(
      initialDestination:
          AppDestination.values[widget.navigationShell.currentIndex],
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  void _select(AppDestination destination) {
    _cubit.select(destination);
    widget.navigationShell.goBranch(
      destination.index,
      initialLocation: destination.index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selected = AppDestination.values[widget.navigationShell.currentIndex];
    return BlocProvider<AppShellCubit>.value(
      value: _cubit,
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: TerraBottomNavigation(
          selected: selected,
          creationLabel: 'Tạo mới',
          onSelected: _select,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CharacterCreationAction(
          presentation: const ActionPresentation(
            label: 'Tạo nhân vật',
            semanticLabel: 'Tạo nhân vật mới',
            state: ActionState.enabled,
          ),
          onPressed: () => context.push('/characters/create'),
        ),
      ),
    );
  }
}
