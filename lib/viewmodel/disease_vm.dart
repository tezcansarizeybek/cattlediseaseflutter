import 'dart:convert';

import 'package:cattlediseasedetection/model/disease_model.dart';
import 'package:cattlediseasedetection/view/disease_detected_page.dart';
import 'package:cattlediseasedetection/viewmodel/http_vm.dart';
import 'package:cattlediseasedetection/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DiseaseVM extends GetxController {
  var disease = DiseaseModel(result: "").obs;

  detectDisease(img) async {
    disease.value = DiseaseModel(result: "");
    var result = await Get.find<HttpVM>().post('/detect', {'image': img});
    disease.value = DiseaseModel.fromJson(result);
  }

  encodeBase64(XFile? image) async {
    if (image != null) {
      var b64 = base64Encode(await image.readAsBytes());
      return b64;
    }
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
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.camera);
              var img = await encodeBase64(image);
              await detectDisease(img);
              if (disease.value.result != "") {
                Get.find<UserVM>().user.value.requestCount += 1;
                await Get.find<HttpVM>().post("/updateCount", {
                  "username": Get.find<UserVM>().user.value.username,
                  "totalCount": Get.find<UserVM>().user.value.requestCount
                });
                Get.to(() => const DiseaseDetectedPage());
              }
            },
          ),
          ListTile(
            title: const Text("Medyadan Seç"),
            onTap: () async {
              Get.back();
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              var img = await encodeBase64(image);
              await detectDisease(img);
              if (disease.value.result != "") {
                Get.find<UserVM>().user.value.requestCount += 1;
                await Get.find<HttpVM>().post("/updateCount", {
                  "username": Get.find<UserVM>().user.value.username,
                  "totalCount": Get.find<UserVM>().user.value.requestCount
                });
                Get.to(() => const DiseaseDetectedPage());
              }
            },
          )
        ],
      ),
    ));
  }
}
