import 'package:ai_character_chat_mobile/common/theme/terra_layout.dart';
import 'package:ai_character_chat_mobile/presentation/core/bloc/app_shell_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/core/bloc/app_shell_state.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationReselectionListener extends StatelessWidget {
  const DestinationReselectionListener({
    required this.destination,
    required this.controller,
    required this.child,
    super.key,
  });
  final AppDestination destination;
  final ScrollController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppShellCubit, AppShellState>(
      listenWhen: (previous, current) =>
          previous.reselectionRevisions[destination] !=
          current.reselectionRevisions[destination],
      listener: (BuildContext context, AppShellState state) {
        if (!controller.hasClients) return;
        if (MediaQuery.disableAnimationsOf(context)) {
          controller.jumpTo(0);
        } else {
          controller.animateTo(
            0,
            duration: TerraMotion.surface,
            curve: Curves.easeOutCubic,
          );
        }
      },
      child: child,
    );
  }
}
