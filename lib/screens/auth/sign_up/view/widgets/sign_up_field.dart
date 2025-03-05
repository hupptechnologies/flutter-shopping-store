import 'package:flutter/material.dart';

class SignUpField extends StatelessWidget {
  final bool isObscure;
  final TextInputType keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const SignUpField({
    super.key,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isObscure,
      onChanged: (value) => onChanged!(value),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
    );
  }
}
