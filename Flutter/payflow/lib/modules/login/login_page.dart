import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import 'login_controller.dart';
import '../../shared/themes/app_images.dart';
import '../../shared/widgets/social_login/social_login_button.dart';
import '../../shared/themes/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: size.height * 0.36,
              width: size.width,
            ),
            Positioned(
              child: Image.asset(
                AppImages.person,
                height: size.height * 0.4,
              ),
              left: 0,
              right: 0,
              top: 45,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: size.height * 0.1,
              child: Column(
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.2, vertical: 40),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SocialLoginButton(
                    onTap: () => controller.googleSignIn(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
