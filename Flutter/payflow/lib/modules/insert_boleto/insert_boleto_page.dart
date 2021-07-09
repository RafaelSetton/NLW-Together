import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/widgets/label_buttons_set/label_buttons_set.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );
  final vencimentoInputTextController =
      MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();
  final nameInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 40),
                child: Text(
                  "Preencha os dados do boleto",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: controller.formKey,
                onChanged: () => controller.onChange(
                  name: nameInputTextController.text,
                  value: moneyInputTextController.numberValue,
                  barcode: barcodeInputTextController.text,
                  dueDate: vencimentoInputTextController.text,
                ),
                child: Column(
                  children: [
                    InputTextWidget(
                        label: "Nome do boleto",
                        icon: Icons.description_outlined,
                        validator: controller.validateName,
                        controller: nameInputTextController),
                    InputTextWidget(
                      label: "Vencimento",
                      icon: FontAwesomeIcons.timesCircle,
                      controller: vencimentoInputTextController,
                      validator: controller.validateVencimento,
                    ),
                    InputTextWidget(
                      label: "Valor",
                      icon: FontAwesomeIcons.wallet,
                      controller: moneyInputTextController,
                      validator: (_) => controller
                          .validateValor(moneyInputTextController.numberValue),
                    ),
                    InputTextWidget(
                      label: "Código",
                      icon: FontAwesomeIcons.barcode,
                      controller: barcodeInputTextController,
                      validator: controller.validateCodigo,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: LabelButtonsSet(
        primaryLabel: "Cancelar",
        secondaryLabel: "Cadastrar",
        primaryOnpressed: () => Navigator.pop(context),
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
