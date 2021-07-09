import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int qtdBoletos;
  const BoletoInfoWidget({Key? key, required this.qtdBoletos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.logomini,
            color: AppColors.background,
            width: 56,
            height: 34,
          ),
          Container(
            height: 40,
            width: 1,
            color: AppColors.stroke,
          ),
          Text.rich(
            TextSpan(
              text: "Você tem ",
              style: TextStyles.captionBackground,
              children: [
                TextSpan(
                  text: "$qtdBoletos boletos\n",
                  style: TextStyles.captionBoldBackground,
                ),
                TextSpan(
                  text: "cadastrados para pagar",
                  style: TextStyles.captionBackground,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
