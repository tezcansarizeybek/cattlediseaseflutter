import 'dart:convert';

import 'package:cattlediseasedetection/view/widgets/grid_button_widget.dart';
import 'package:cattlediseasedetection/view/widgets/main_navbar_widget.dart';
import 'package:cattlediseasedetection/view/widgets/profile_draggable_widget.dart';
import 'package:cattlediseasedetection/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
                        title: "Hastalık Tespit Et", func: detectDiseaseDialog),
                    const GridButtonWidget(title: "Yeni Hastalık Ekle"),
                    GridButtonWidget(title: "Profilim", func: openUserInfo),
                    const GridButtonWidget(title: "Önceki Aramalar"),
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

  detectDiseaseDialog() async {
    await Get.dialog(Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text("Fotoğraf Çek"),
            onTap: () async {
              Get.back();
              // Get.to(const CameraPage());
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.camera);
              encodeBase64(image);
            },
          ),
          ListTile(
            title: const Text("Medyadan Seç"),
            onTap: () async {
              Get.back();
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              encodeBase64(image);
            },
          )
        ],
      ),
    ));
  }

  openUserInfo() {
    scrollableController.animateTo(0.5,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  encodeBase64(XFile? image) async {
    if (image != null) {
      var b64 = base64Encode(await image.readAsBytes());
    }
  }
}
