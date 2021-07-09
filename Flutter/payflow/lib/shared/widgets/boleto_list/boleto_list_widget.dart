import 'package:flutter/material.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final controller;

  const BoletoListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  Widget body(BuildContext context, List boletos, Widget? _) => Column(
        children: widget.controller.boletos
            .map<Widget>((e) => BoletoTileWidget(boleto: e))
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
