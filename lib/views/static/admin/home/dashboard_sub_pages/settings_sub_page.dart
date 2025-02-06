import 'package:flutter/material.dart';

class SettingsSubPage extends StatelessWidget {
  const SettingsSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: const [
          Text("Settings Sub Page"),
        ],
      ),
    );
  }
}
