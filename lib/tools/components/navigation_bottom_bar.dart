import 'package:flutter/material.dart';

class NavigationBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;

  const NavigationBottomBar(
      {super.key,
      required this.onTap,
      required this.currentIndex,
      this.items = const <BottomNavigationBarItem>[]});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      onTap: onTap,
      items: items,
    );
  }
}
