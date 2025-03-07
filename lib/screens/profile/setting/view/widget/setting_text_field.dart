import 'package:flutter/material.dart';

class SettingTextField extends StatelessWidget {
  final bool isObscure;
  final TextInputType keyboardType;
  final String? value;
  final TextEditingController? controller;
  final String label;
  final Widget? prefixIcon;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const SettingTextField({
    super.key,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    required this.label,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.errorText,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(value),
      controller: controller,
      validator: validator,
      initialValue: value,
      keyboardType: keyboardType,
      obscureText: isObscure,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
    );
  }
}
