import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

class CustomTabBar extends StatelessWidget {
  final List<Color>? colors;
  final List<Widget> tabs;
  final List<Widget>? children;
  final TabController controller;

  const CustomTabBar({
    super.key,
    this.colors,
    this.children,
    required this.tabs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TabContainer(
      tabExtent: 60,
      controller: controller,
      borderRadius: const BorderRadius.all(Radius.circular(0.0)),
      tabBorderRadius: const BorderRadius.all(Radius.circular(20.0)),
      tabEdge: TabEdge.top,
      curve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
        return SlideTransition(
          position: Tween(
            begin: const Offset(0.2, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      tabs: tabs,
      colors: colors,
      color: Colors.grey.shade200,
      children: children,
    );
  }
}
