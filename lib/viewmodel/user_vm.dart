import 'package:cattlediseasedetection/model/user_input_model.dart';
import 'package:cattlediseasedetection/model/user_model.dart';
import 'package:cattlediseasedetection/view/login_page.dart';
import 'package:cattlediseasedetection/view/main_page.dart';
import 'package:cattlediseasedetection/viewmodel/http_vm.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserVM extends GetxController {
  var rememberMe = false.obs;
  var user = User(username: "").obs;

  checkLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    rememberMe.value = preferences.getBool("rememberMe") ?? false;
    update([1]);
  }

  login(username, password, [inMainPage = false]) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      var response = await Get.find<HttpVM>()
          .post("/login", {"username": username, "password": password});
      print(response);
      if (response["result"].length > 0) {
        user.value = User(
            uuid: response["result"][0][0],
            username: response["result"][0][1],
            password: response["result"][0][2],
            totalRequest: response["result"][0][3],
            requestCount: response["result"][0][4]);
        preferences.setBool("rememberMe", rememberMe.value);
        if (rememberMe.value) {
          preferences.setString("username", user.value.username);
          preferences.setString("password", user.value.password ?? "");
        } else {
          preferences.setString("username", "");
          preferences.setString("password", "");
        }
        if (!inMainPage) {
          Get.offAll(() => MainPage());
        }
      } else {
        rememberMe.value = false;
        preferences.setBool("rememberMe", rememberMe.value);
        if (!inMainPage) {
          Get.snackbar("Giriş Yapılamadı", "Kullanıcı adı veya şifre yanlış!",
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      rememberMe.value = false;
      preferences.setBool("rememberMe", rememberMe.value);
      Get.snackbar("Giriş Yapılamadı", "$e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  register(UserInput userInput) async {
    try {
      var response = await Get.find<HttpVM>().post("/register", {
        "username": userInput.username.text,
        "password": userInput.password.text
      });
      if (response["result"] != "OK") {
        Get.snackbar("Böyle bir kullanıcı mevcut", "");
      } else {
        Get.offAll(() => LoginPage());
      }
    } catch (e) {
      Get.snackbar("Kayıt Yapılamadı", "$e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
