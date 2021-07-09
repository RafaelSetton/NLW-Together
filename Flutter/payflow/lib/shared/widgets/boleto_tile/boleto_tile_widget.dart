import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel boleto;
  final int index;
  final BoletoListController controller;

  const BoletoTileWidget({
    Key? key,
    required this.boleto,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(border: Border.all()),
      child: Dismissible(
        key: Key(boleto.barcode ?? ""),
        onDismissed: (_) {
          controller.boletos.removeAt(index);
          controller.boletosNotifier.notifyListeners();
        },
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete, color: AppColors.background),
          alignment: Alignment(-0.9, 0),
        ),
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
      ),
    );
  }
}
