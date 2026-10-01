import 'package:flutter/material.dart';

class TerraAppScaffold extends StatelessWidget {
  const TerraAppScaffold({
    required this.body,
    required this.appBar,
    required this.bottomNavigationBar,
    required this.floatingActionButton,
    required this.resizeToAvoidBottomInset,
    required this.safeArea,
    super.key,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool resizeToAvoidBottomInset;
  final bool safeArea;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: appBar,
    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    bottomNavigationBar: bottomNavigationBar,
    floatingActionButton: floatingActionButton,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    body: safeArea ? SafeArea(child: body) : body,
  );
}
