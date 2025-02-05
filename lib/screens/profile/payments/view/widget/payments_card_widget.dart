import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/screens/profile/payments/controller/payments_controller.dart';
import 'package:e_commerce/widgets/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsCardWidget extends GetView<PaymentsController> {
  const PaymentsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(3, (index) {
        return const CreditCardWidget(
          icon: ImageConstant.visaIcon,
          cardNumber: 4364134589328378,
          holderName: 'Sunie Pham',
          validDate: '02/2026',
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        viewportFraction: 0.9,
        enableInfiniteScroll: false,
      ),
    );
  }
}
