import 'package:cattlediseasedetection/model/user_input_model.dart';
import 'package:cattlediseasedetection/view/widgets/input_widget.dart';
import 'package:cattlediseasedetection/viewmodel/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key, required this.userInput}) : super(key: key);

  final UserInput userInput;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: InputWidget(
                    label: "E-Posta",
                    controller: userInput.email,
                    required: true),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: InputWidget(
                    label: "Kullanıcı Adı",
                    controller: userInput.username,
                    required: true),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: InputWidget(
                    label: "Şifre",
                    obscure: true,
                    controller: userInput.password,
                    required: true),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: InputWidget(
                    label: "Şifre Tekrar",
                    obscure: true,
                    controller: userInput.password,
                    required: true),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: InputWidget(
                  label: "Telefon",
                  controller: userInput.phone,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: InputWidget(
                  label: "Adres",
                  controller: userInput.address,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await Get.find<UserVM>().register(userInput);
                        Get.back();
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: const Text("Kayıt Ol"),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
