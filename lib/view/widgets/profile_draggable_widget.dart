import 'package:cattlediseasedetection/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDraggableWidget extends StatelessWidget {
  const ProfileDraggableWidget({Key? key, required this.scrollableController})
      : super(key: key);
  final DraggableScrollableController scrollableController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                color: Theme.of(context).colorScheme.background,
              ),
              child: GetBuilder<UserVM>(
                  id: 1,
                  builder: (c) {
                    return ListView(controller: controller, children: [
                      ListTile(
                        title: Obx(() =>
                            Text("Kullanıcı Adı: ${c.user.value.username}")),
                      ),
                      ListTile(
                        title: Obx(
                          () => Text(
                              "Yapılan İstek Sayısı: ${c.user.value.requestCount}"),
                        ),
                      ),
                      ListTile(
                        title: Obx(
                          () => Text(
                              "Kalan İstek Sayısı: ${c.user.value.totalRequest - c.user.value.requestCount}"),
                        ),
                      )
                    ]);
                  }),
            );
          });
        },
      ),
    );
  }
}
