import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(width: 0, thickness: 2, color: AppColors.stroke);
  }
}
