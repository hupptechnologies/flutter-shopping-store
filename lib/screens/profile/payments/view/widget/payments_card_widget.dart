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
    return Obx(
      () => CarouselSlider(
        items: controller.cardList.isEmpty
            ? [
                const CreditCardWidget(
                  icon: ImageConstant.visaIcon,
                  cardNumber: 'xxxxxxxxxxxxxxxx',
                  holderName: 'xxxxx xxxxx',
                  validDate: 'MM/YY',
                )
              ]
            : controller.cardList.map((card) {
                return GestureDetector(
                  onTap: () => controller.gotoCard(id: card.id),
                  child: CreditCardWidget(
                    icon: ImageConstant.visaIcon,
                    cardNumber: card.cardNumber!,
                    holderName: card.cardholderName!,
                    validDate: card.expirationDate!,
                  ),
                );
              }).toList(),
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          viewportFraction: 0.9,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}
