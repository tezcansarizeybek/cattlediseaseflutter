import 'package:cattlediseasedetection/model/user_model.dart';
import 'package:cattlediseasedetection/view/login_page.dart';
import 'package:cattlediseasedetection/view/widgets/grid_button_widget.dart';
import 'package:cattlediseasedetection/view/widgets/main_navbar_widget.dart';
import 'package:cattlediseasedetection/view/widgets/profile_draggable_widget.dart';
import 'package:cattlediseasedetection/viewmodel/disease_vm.dart';
import 'package:cattlediseasedetection/viewmodel/http_vm.dart';
import 'package:cattlediseasedetection/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final DraggableScrollableController scrollableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        scrollableController.animateTo(0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Anasayfa"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  Get.find<UserVM>().rememberMe.value = false;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString("username", "");
                  await prefs.setString("password", "");
                  await prefs.setBool("rememberMe", false);
                  Get.find<UserVM>().user.value = User(username: "");
                  Get.offAll(() => LoginPage());
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: GetBuilder<UserVM>(builder: (c) {
          return Stack(
            children: [
              Column(children: [
                Expanded(
                    child: GridView.extent(
                  maxCrossAxisExtent: 150,
                  children: [
                    GridButtonWidget(
                        title: "Hastalık Tespit Et",
                        func: () async {
                          await Get.find<DiseaseVM>().detectDiseaseDialog();
                        }),
                    GridButtonWidget(title: "Profilim", func: openUserInfo),
                    GridButtonWidget(title: "Adres Ayarla", func: setIP),
                    GridButtonWidget(
                        title: "Karanlık Mod",
                        func: () => Get.changeThemeMode(
                            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark)),
                  ],
                )),
              ]),
              MainNavbarWidget(profileFunc: openUserInfo),
              ProfileDraggableWidget(scrollableController: scrollableController)
            ],
          );
        }),
      ),
    );
  }

  openUserInfo() {
    scrollableController.animateTo(0.5,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  setIP() async {
    TextEditingController ipCtrl = TextEditingController();
    await Get.dialog(Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: ipCtrl,
              decoration: const InputDecoration(label: Text("Adres Giriniz")),
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('baseAddress', ipCtrl.text);
                  await Get.find<HttpVM>().dioSetParams();
                  Get.back();
                },
                child: const Text("Onayla"))
          ],
        ),
      ),
    ));
  }
}
