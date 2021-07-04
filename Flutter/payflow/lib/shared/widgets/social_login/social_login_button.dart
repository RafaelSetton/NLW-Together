import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import '../../themes/app_images.dart';
import '../../themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.7,
        decoration: BoxDecoration(
            color: AppColors.shape,
            border: Border.all(color: AppColors.stroke),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
              flex: 25,
              child: Image.asset(AppImages.google),
            ),
            Container(
                width: 0,
                decoration:
                    BoxDecoration(border: Border.all(color: AppColors.stroke))),
            Expanded(
              flex: 75,
              child: Center(
                child: Text(
                  "Entrar com Google",
                  style: TextStyles.buttonGray,
                ),
              ),
            ),
            Expanded(flex: 10, child: Container()),
          ],
        ),
      ),
    );
  }
}
