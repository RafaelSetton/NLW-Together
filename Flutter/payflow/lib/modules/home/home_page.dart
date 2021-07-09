import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      MeusBoletosPage(key: UniqueKey()),
      ExtractPage(key: UniqueKey()),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(TextSpan(
                text: "Olá, ",
                style: TextStyles.titleRegular,
                children: [
                  TextSpan(
                      text: widget.user.name,
                      style: TextStyles.titleBoldBackground),
                  TextSpan(text: "!", style: TextStyles.titleRegular),
                ],
              )),
              subtitle: Text("Mantenha suas contas em dia!",
                  style: TextStyles.captionShape),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.user.photoURL)),
                ),
              ),
              // Logout
              leading: IconButton(
                onPressed: () {
                  AuthController().setUser(context, null);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 36,
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
              icon: Icon(
                Icons.home,
                color: currentPage == 0 ? AppColors.primary : AppColors.body,
              ),
            ),
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, "/scanner");
                  setState(() {});
                },
                icon: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
              icon: Icon(
                Icons.description_outlined,
                color: currentPage == 1 ? AppColors.primary : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
