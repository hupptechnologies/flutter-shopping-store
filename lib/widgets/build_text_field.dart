import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final bool isObscure;
  final TextInputType keyboardType;
  const BuildTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
