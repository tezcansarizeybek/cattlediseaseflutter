import 'package:camera_camera/camera_camera.dart';
import 'package:cattlediseasedetection/viewmodel/photo_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disease Detection"),
        centerTitle: true,
      ),
      body: GetBuilder<PhotoVM>(
        initState: (state){
          Get.put(PhotoVM());
        },
        builder: (c) {
                return CameraCamera(
                    onFile: (file) => print(file)
                );
        },
      ),
    );
  }
}