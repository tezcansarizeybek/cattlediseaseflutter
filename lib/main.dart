import 'package:cattlediseasedetection/view/login_page.dart';
import 'package:cattlediseasedetection/view/main_page.dart';
import 'package:cattlediseasedetection/viewmodel/http_vm.dart';
import 'package:cattlediseasedetection/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var c = Get.put(UserVM());
  var httpVM = Get.put(HttpVM());
  await httpVM.dioSetParams();
  await c.checkLoginStatus();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cattle Disease Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: Get.find<UserVM>().rememberMe.value ? MainPage() : LoginPage(),
    );
  }
}
