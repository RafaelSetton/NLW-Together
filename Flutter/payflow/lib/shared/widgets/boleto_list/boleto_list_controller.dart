import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>([]);
  List<BoletoModel> get boletos => boletosNotifier.value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    final prefs = await SharedPreferences.getInstance();
    boletosNotifier.value = prefs
            .getStringList("boletos")
            ?.map<BoletoModel>((e) => BoletoModel.fromJson(e))
            .toList() ??
        [];
  }
}
