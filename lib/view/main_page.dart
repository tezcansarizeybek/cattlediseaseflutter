import 'package:cattlediseasedetection/view/widgets/grid_button_widget.dart';
import 'package:cattlediseasedetection/view/widgets/main_navbar_widget.dart';
import 'package:cattlediseasedetection/view/widgets/profile_draggable_widget.dart';
import 'package:cattlediseasedetection/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  DraggableScrollableController scrollableController =
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
                    GridButtonWidget(title: "Hastalık Tespit Et"),
                    GridButtonWidget(title: "Yeni Hastalık Ekle"),
                    GridButtonWidget(title: "Profilim", func: openUserInfo),
                    GridButtonWidget(title: "Önceki Aramalar"),
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
}
