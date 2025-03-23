import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/bottom_version_bar.dart';
import 'package:dabata_mobile/views/controllers/starting/splash_screen_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashScreenPageVctl(),
      builder: (ctl) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          bottomNavigationBar: const BottomVersionBar(),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Image.asset(
                'assets/images/Logo_Dabata.png',
                width: 200,
              ),
            ),
          ),
        );
      },
    );
  }
}
