import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpVM extends GetxController {
  String baseAddress = "192.168.1.32:5000";
  var dio = Dio();

  dioSetParams() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var bA = prefs.getString("baseAddress") ?? "";
    print(bA);
    if (bA != "") {
      baseAddress = bA;
    }
    if (baseAddress.startsWith(RegExp(
        "(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])"))) {
      baseAddress = "http://$baseAddress";
    }
    dio.options.baseUrl = baseAddress;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
  }

  get(String addr) async {
    dio;
    try {
      var response = await dio.get(addr);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        Get.snackbar("Hata", "${response.statusCode}");
        throw Exception(response.statusCode);
      }
    } catch (e) {
      Get.snackbar("Hata", "$e");
      throw Exception(e);
    }
  }

  post(String addr, data) async {
    try {
      var response = await dio.post(addr, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        Get.snackbar("Hata", "${response.statusCode}");
        throw Exception(response.statusCode);
      }
    } catch (e) {
      Get.snackbar("Hata", "$e");
      throw Exception(e);
    }
  }

  put(String addr, data) async {
    try {
      var response = await dio.put(addr, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        Get.snackbar("Hata", "${response.statusCode}");
        throw Exception(response.statusCode);
      }
    } catch (e) {
      Get.snackbar("Hata", "$e");
      throw Exception(e);
    }
  }

  delete(String addr, data) async {
    try {
      var response = await dio.delete(addr, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        Get.snackbar("Hata", "${response.statusCode}");
        throw Exception(response.statusCode);
      }
    } catch (e) {
      Get.snackbar("Hata", "$e");
      throw Exception(e);
    }
  }
}
