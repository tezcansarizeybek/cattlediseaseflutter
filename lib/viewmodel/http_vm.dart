import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpVM extends GetxController {
  String baseAddress = "";

  dioSetParams() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var bA = prefs.getString("baseAddress");
    if (bA != null) {
      if (bA != "") {
        baseAddress = bA;
      }
    }
    var dio = Dio();
    dio.options.baseUrl = baseAddress;
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
  }

  get(String addr) async {
    var dio = Dio();
    try {
      var response = await dio.get(addr);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  post(String addr, data) async {
    var dio = Dio();
    try {
      var response = await dio.post(addr, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  put(String addr, data) async {
    var dio = Dio();
    try {
      var response = await dio.put(addr, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  delete(String addr, data) async {
    var dio = Dio();
    try {
      var response = await dio.delete(addr, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
