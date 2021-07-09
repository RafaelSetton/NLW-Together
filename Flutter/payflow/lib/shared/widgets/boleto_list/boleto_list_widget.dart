import 'package:flutter/material.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;

  const BoletoListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  Widget body(BuildContext context, List boletos, Widget? _) => Column(
        children: boletos
            .asMap()
            .entries
            .map<Widget>((entry) => BoletoTileWidget(
                boleto: entry.value,
                index: entry.key,
                controller: widget.controller))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.boletosNotifier,
      builder: body,
    );
  }
}
