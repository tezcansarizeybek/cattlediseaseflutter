import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {Key? key,
      required this.label,
      this.controller,
      this.obscure = false,
      this.required = false,
      this.borderRadius})
      : super(key: key);

  final String label;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final bool obscure;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => required
          ? (value ?? "").isEmpty
              ? "Lütfen Bu Alanı Doldurunuz"
              : null
          : null,
      decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(20))),
      obscureText: obscure,
    );
  }
}
