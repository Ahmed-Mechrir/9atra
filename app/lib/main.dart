import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/colors.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Open Sans',
        primarySwatch: Colors.pink,
        // backgroundColor: Colors.red,
        splashColor: AppColors.red_color,
        highlightColor: AppColors.white_color,
        scaffoldBackgroundColor: AppColors.white_bg_color,
      ),
      localizationsDelegates: const [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        // FormBuilderLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}
