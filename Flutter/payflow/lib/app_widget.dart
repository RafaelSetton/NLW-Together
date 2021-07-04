import 'package:flutter/material.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_screen.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Flow",
      theme: ThemeData(primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
