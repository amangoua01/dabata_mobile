import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
import 'package:dabata_mobile/views/static/auth/login_sub_page.dart';
import 'package:dabata_mobile/views/static/auth/register_sub_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: Image.asset(
            'assets/images/Logo_Dabata.png',
            height: 60,
          ),
        ),
      ), //const BottomVersionBar(),
      appBar: AppBar(
        title: const Text(Env.appName),
      ),
      body: CustomTabBar(
        color: Colors.white,
        controller: TabController(length: 2, vsync: this),
        tabs: const [
          Tab(text: "Connexion"),
          Tab(text: "Inscription"),
        ],
        children: const [
          LoginSubPage(),
          RegisterSubPage(),
        ],
      ),
    );
  }
}
