import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/label_buttons_set/label_buttons_Set.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode)
        Navigator.pushReplacementNamed(context, "/insert_boleto",
            arguments: controller.status.barcode);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget imageBuilder(
      BuildContext context, BarcodeScannerStatus status, Widget? wid) {
    if (status.showCamera) {
      return Container(
        child: controller.cameraController!.buildPreview(),
      );
    }
    return Container();
  }

  Widget bottomSheetBuilder(
      BuildContext context, BarcodeScannerStatus status, Widget? wid) {
    if (status.hasError) {
      return BottomSheetWidget(
        primaryLabel: "Escanear novamente",
        secondaryLabel: "Digitar código",
        primaryOnpressed: controller.scanWithCamera,
        secondaryOnPressed: () {},
        title: "Não foi possível identificar um código de barras",
        subtitle: "Tente escanear novamente ou digite o código do seu boleto",
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: controller.statusNotifier,
            builder: imageBuilder,
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: BackButton(color: AppColors.background),
                centerTitle: true,
                title: Text(
                  "Escaneie o código de barras do boleto",
                  style: TextStyles.buttonBackground,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(color: Colors.black.withOpacity(0.5))),
                  Expanded(
                      child: Container(color: Colors.transparent), flex: 2),
                  Expanded(
                      child: Container(color: Colors.black.withOpacity(0.5))),
                ],
              ),
              bottomNavigationBar: LabelButtonsSet(
                primaryLabel: "Inserir código do boleto",
                secondaryLabel: "Escolher da galeria",
                primaryOnpressed: () =>
                    Navigator.pushReplacementNamed(context, "/insert_boleto"),
                secondaryOnPressed: controller.scanWithImagePicker,
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller.statusNotifier,
            builder: bottomSheetBuilder,
          ),
        ],
      ),
    );
  }
}
