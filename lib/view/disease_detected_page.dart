import 'dart:convert';

import 'package:cattlediseasedetection/viewmodel/disease_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseDetectedPage extends StatelessWidget {
  const DiseaseDetectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.find<DiseaseVM>().disease.value.result),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.memory(
                    base64Decode(Get.find<DiseaseVM>().disease.value.image ??
                        "R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="),
                  ),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                        Get.find<DiseaseVM>().disease.value.description ?? "",
                        textAlign: TextAlign.justify)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
