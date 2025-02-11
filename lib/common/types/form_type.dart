import 'package:flutter/material.dart';

class FormType {
  TextEditingController controller = TextEditingController();
  String labelText;
  TextInputType? keyboardType;
  bool isRequired = false;

  FormType({
    required this.labelText,
    this.keyboardType,
    this.isRequired = false,
  });
}
