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
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                      child: const Center(
                          child: Text(
                        "Hastalık Tespit Et",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                      child: const Center(
                          child: Text(
                        "Yeni Hastalık Ekle",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    InkWell(
                      onTap: () => openUserInfo(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).cardColor,
                        ),
                        child: const Center(
                            child: Text(
                          "Profilim",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                      child: const Center(
                          child: Text(
                        "Önceki Aramalar",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
                    )
                  ],
                )),
              ]),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: AppBarTheme.of(context).toolbarHeight,
                  decoration:
                      BoxDecoration(color: Theme.of(context).backgroundColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: () {
                            openUserInfo();
                          },
                          icon: const Icon(
                            Icons.person,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: DraggableScrollableSheet(
                  initialChildSize: 0,
                  minChildSize: 0,
                  maxChildSize: 0.7,
                  controller: scrollableController,
                  builder: (_, controller) {
                    return LayoutBuilder(builder: (_, box) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: GetBuilder<UserVM>(
                            id: 1,
                            builder: (context) {
                              return ListView(
                                  controller: controller,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          "Kullanıcı Adı: ${c.user.value.username}"),
                                    ),
                                    ListTile(
                                      title: Text(
                                          "Yapılan İstek Sayısı: ${c.user.value.requestCount}"),
                                    ),
                                    ListTile(
                                      title: Text(
                                          "Kalan İstek Sayısı: ${c.user.value.remainingRequest}"),
                                    )
                                  ]);
                            }),
                      );
                    });
                  },
                ),
              )
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
