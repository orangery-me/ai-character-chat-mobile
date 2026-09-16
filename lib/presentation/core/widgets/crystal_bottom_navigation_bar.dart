import 'package:ai_character_chat_mobile/presentation/core/bloc/root_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CrystalBottomNavigationBar extends StatelessWidget {
  const CrystalBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (int newIndex) {
            context.read<RootBloc>().add(
                  RootBottomTabChange(newIndex: newIndex),
                );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              activeIcon: Icon(IconlyBold.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              activeIcon: Icon(IconlyBold.profile),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
