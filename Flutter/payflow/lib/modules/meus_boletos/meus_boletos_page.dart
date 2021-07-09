import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          child: Stack(
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: AppColors.primary,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boletos, __) => AnimatedCard(
                    child: BoletoInfoWidget(qtdBoletos: boletos.length),
                    direction: AnimatedCardDirection.top,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Meus boletos",
            style: TextStyles.titleBoldHeading,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(24),
          child: Divider(
            color: AppColors.stroke,
            thickness: 1,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: RefreshIndicator(
              onRefresh: () async => setState(() {}),
              child: SingleChildScrollView(
                child: BoletoListWidget(controller: controller),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
