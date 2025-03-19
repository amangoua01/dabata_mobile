import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/views/static/starting/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/* void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //WebConst.jwt = "";

  String? storedJwt = await Cache.getString("jwt");
  if (storedJwt != null) {
    WebConst.jwt = storedJwt;
  }

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
        builder: EasyLoading.init(),
      ),
    ),
  );
} */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String? storedJwt = await Cache.getString("jwt");
  if (storedJwt != null) {
    WebConst.jwt = storedJwt;
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    // Ajout de l'observateur du cycle de vie
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Suppression de l'observateur pour éviter les fuites de mémoire
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Lorsque l'application passe en arrière-plan,
      // réinitialiser les dépendances GetX et vider le cache
      Cache.clear();
      Get.deleteAll(force: true);
    } else if (state == AppLifecycleState.inactive) {
      // Lorsque l'application est inactive, vider le cache
      Cache.clear();
      Get.deleteAll(force: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
          primaryColor: AppColors.primary,
          primarySwatch: Colors.deepOrange,
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
        builder: EasyLoading.init(),
      ),
    );
  }
}
