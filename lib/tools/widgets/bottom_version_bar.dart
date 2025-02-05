import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:flutter/material.dart';

class BottomVersionBar extends StatelessWidget {
  const BottomVersionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: Center(
        child: Text(
          "Version ${Env.appVersion}",
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }
}
