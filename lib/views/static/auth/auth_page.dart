import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:dabata_mobile/tools/widgets/bottom_version_bar.dart';
import 'package:dabata_mobile/views/static/auth/login_sub_page.dart';
import 'package:dabata_mobile/views/static/auth/register_sub_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: const BottomVersionBar(),
        appBar: AppBar(
          title: const Text(Env.appName),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Connexion"),
              Tab(text: "Inscription"),
            ],
          ),
        ),
        body: const TabBarView(children: [
          LoginSubPage(),
          RegisterSubPage(),
        ]),
      ),
    );
  }
}
