import 'package:flutter/material.dart';

class SettingsSubPage extends StatelessWidget {
  const SettingsSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          bottom: const TabBar(tabs: [
            Tab(text: "Info"),
            Tab(text: "Cartes"),
          ]),
        ),
        body: const TabBarView(children: [
          Center(child: Text("Info")),
          Center(child: Text("Cartes")),
        ]),
      ),
    );
  }
}
