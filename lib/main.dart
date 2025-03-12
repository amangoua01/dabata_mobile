import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dabata_mobile/views/static/starting/splash_screen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WebConst.jwt = "";

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale("fr", "FR"),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: Env.defaultFont,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
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
    ),
  );
}
