import 'package:flutter/material.dart';

class Historique extends StatelessWidget {
  const Historique({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Historique"),
          bottom: const TabBar(tabs: [
            Tab(text: "En cours"),
            Tab(text: "Soldés"),
            Tab(text: "Toutes"),
          ]),
        ),
        body: const TabBarView(children: [
          Center(child: Text("En cours")),
          Center(child: Text("Soldés")),
          Center(child: Text("Toutes")),
        ]),
      ),
    );
  }
}
