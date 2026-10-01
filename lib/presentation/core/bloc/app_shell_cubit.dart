import 'package:ai_character_chat_mobile/presentation/core/bloc/app_shell_state.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppShellCubit extends Cubit<AppShellState> {
  AppShellCubit({required AppDestination initialDestination})
    : super(AppShellState.initial().select(initialDestination));
  void select(AppDestination destination) => emit(state.select(destination));
}
