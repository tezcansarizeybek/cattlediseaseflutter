import 'package:cattlediseasedetection/model/user_input_model.dart';
import 'package:cattlediseasedetection/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserVM extends GetxController {
  var rememberMe = false.obs;
  var user = User(email: "", username: "", password: "").obs;

  checkLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    rememberMe.value = preferences.getBool("rememberMe") ?? false;
    update([1]);
  }

  login(UserInput userInput) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      // preferences.setBool("rememberMe", rememberMe.value);
      // if (rememberMe.value) {
      //   preferences.setString("username", userInput.username.text);
      //   preferences.setString("password", userInput.password.text);
      // } else {
      //   preferences.setString("username", "");
      //   preferences.setString("password", "");
      // }
    } catch (e) {
      rememberMe.value = false;
      preferences.setBool("rememberMe", rememberMe.value);
      Get.snackbar("Giriş Yapılamadı", "Bilinmeyen Hata",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  register(UserInput userInput) async {}
}
