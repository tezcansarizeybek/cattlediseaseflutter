import 'package:cattlediseasedetection/model/user_input_model.dart';
import 'package:cattlediseasedetection/view/main_page.dart';
import 'package:cattlediseasedetection/view/register_page.dart';
import 'package:cattlediseasedetection/view/widgets/input_widget.dart';
import 'package:cattlediseasedetection/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final UserInput userInput = UserInput();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserVM>(
        init: Get.put(UserVM()),
        builder: (c) => Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: InputWidget(
                        label: "Kullanıcı Adı",
                        controller: userInput.username,
                        required: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: InputWidget(
                        label: "Şifre",
                        obscure: true,
                        controller: userInput.password,
                        required: true),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Beni Hatırla"),
                      Obx(() => Checkbox(
                          value: c.rememberMe.value,
                          onChanged: (value) =>
                              c.rememberMe.value = value ?? false))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: SizedBox(
                      width: 150,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              await c.login(userInput);
                              Get.offAll(() => MainPage());
                            } catch (e) {}
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: const Text("Giriş Yap"),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => RegisterPage(userInput: userInput));
                      },
                      child: const Text("Hesabın Yok Mu?"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
