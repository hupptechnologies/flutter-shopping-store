import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final List<Map<String, dynamic>> paymentMethodCart = [
    {
      "icon": Icons.money_rounded,
      "label": "Cash",
    },
    {
      "icon": Icons.credit_card_rounded,
      "label": "Credit Card",
    },
    {
      "icon": Icons.more_horiz_outlined,
    },
  ];

  late RxInt selectPaymentMethod = 1.obs;

  void changePaymentMethod(int index) {
    selectPaymentMethod.value = index;
  }
}
