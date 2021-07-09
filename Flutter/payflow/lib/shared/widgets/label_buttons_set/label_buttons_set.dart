import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider/vertical_divider.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class LabelButtonsSet extends StatelessWidget {
  final String primaryLabel, secondaryLabel;
  final VoidCallback primaryOnpressed, secondaryOnPressed;
  final bool enablePrimaryColor, enableSecondaryColor;

  const LabelButtonsSet({
    Key? key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnpressed,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.shape,
        border: Border(top: BorderSide(color: AppColors.stroke)),
      ),
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnpressed,
              style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
            ),
          ),
          VerticalDividerWidget(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              onPressed: secondaryOnPressed,
              style: enableSecondaryColor ? TextStyles.buttonPrimary : null,
            ),
          ),
        ],
      ),
    );
  }
}
