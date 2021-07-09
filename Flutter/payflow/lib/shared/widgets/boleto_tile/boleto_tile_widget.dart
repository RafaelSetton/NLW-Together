import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel boleto;

  const BoletoTileWidget({Key? key, required this.boleto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(border: Border.all()),
      child: ListTile(
        title: Text(boleto.name ?? "", style: TextStyles.titleListTile),
        subtitle: Text(
          "Vence em ${boleto.dueDate}",
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: "R\$ ",
            style: TextStyles.trailingRegular,
            children: [
              TextSpan(
                text: boleto.value!.toStringAsFixed(2),
                style: TextStyles.trailingBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
