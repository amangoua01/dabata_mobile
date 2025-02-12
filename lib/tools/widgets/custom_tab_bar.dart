import 'package:dabata_mobile/test_vct.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tab_container/tab_container.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget>? children;
  final TabController controller;

  const CustomTabBar({
    super.key,
    this.children,
    required this.tabs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestVct>(
        init: TestVct(),
        builder: (ctl) {
          return Scaffold(
            body: TabContainer(
              controller: controller,
              tabBorderRadius: const BorderRadius.all(Radius.circular(12.0)),
              tabEdge: TabEdge.top,
              curve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                animation =
                    CurvedAnimation(curve: Curves.easeIn, parent: animation);
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
              colors: const <Color>[
                Color.fromARGB(255, 238, 238, 238),
                Color.fromARGB(255, 238, 238, 238),
                Color.fromARGB(255, 238, 238, 238),
                Color.fromARGB(255, 238, 238, 238),
              ],
              tabs: tabs,
              children: children,
            ),
          );
        });
  }
}
