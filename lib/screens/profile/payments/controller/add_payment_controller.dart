import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentController extends GetxController {
  final TextEditingController cardholderName = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expiresDate = TextEditingController();
  final TextEditingController cvv = TextEditingController();

  void addCard() {
    Get.back();
  }
}
