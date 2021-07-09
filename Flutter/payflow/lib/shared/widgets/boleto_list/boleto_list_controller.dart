import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  static late SharedPreferences _prefs;

  final boletosNotifier = ValueNotifier<List<BoletoModel>>([]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  void set boletos(List<BoletoModel> boletos) {
    boletosNotifier.value = boletos;
    _prefs.setStringList("boletos", boletos.map((e) => e.toJson()).toList());
  }

  static final BoletoListController _instance =
      BoletoListController._privateFactory();

  BoletoListController._privateFactory() {
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      getBoletos();
    });
  }
  factory BoletoListController() => _instance;

  Future<void> getBoletos() async {
    boletosNotifier.value = _prefs
            .getStringList("boletos")
            ?.map<BoletoModel>((e) => BoletoModel.fromJson(e))
            .toList() ??
        [];
  }
}
