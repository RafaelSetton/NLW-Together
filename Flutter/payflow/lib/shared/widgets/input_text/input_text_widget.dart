import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            initialValue: initialValue,
            style: TextStyles.input,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              labelStyle: TextStyles.input,
              border: InputBorder.none,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(icon, color: AppColors.primary),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: AppColors.stroke,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: AppColors.stroke,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
