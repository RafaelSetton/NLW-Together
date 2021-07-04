import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import '../../shared/auth/auth_controller.dart';
import '../../shared/themes/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.loadUser(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(
            child: Image.asset(AppImages.union),
          ),
          Center(
            child: Image.asset(AppImages.logoFull),
          ),
        ],
      ),
    );
  }
}
