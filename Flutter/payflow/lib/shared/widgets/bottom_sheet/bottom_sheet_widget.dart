import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/label_buttons_set/label_buttons_Set.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel, secondaryLabel;
  final VoidCallback primaryOnpressed, secondaryOnPressed;
  final String title, subtitle;
  final bool enablePrimaryColor;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnpressed,
    required this.secondaryOnPressed,
    required this.title,
    required this.subtitle,
    this.enablePrimaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.black.withOpacity(0.5),
            )),
            Container(
              color: AppColors.background,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Text.rich(
                      TextSpan(
                          text: title,
                          style: TextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                              text: "\n$subtitle",
                              style: TextStyles.buttonHeading,
                            )
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(height: 0, thickness: 2),
                  LabelButtonsSet(
                    enablePrimaryColor: true,
                    primaryLabel: primaryLabel,
                    primaryOnpressed: primaryOnpressed,
                    secondaryLabel: secondaryLabel,
                    secondaryOnPressed: secondaryOnPressed,
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
