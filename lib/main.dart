import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/views/static/starting/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: const SplashScreenPage(),
    ),
  );
}
