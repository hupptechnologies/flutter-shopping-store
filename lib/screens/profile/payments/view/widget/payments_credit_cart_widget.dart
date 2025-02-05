import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/payments/controller/payments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentsCreditCartWidget extends GetView<PaymentsController> {
  const PaymentsCreditCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(controller.creditCardList.length, (index) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: Get.width / (controller.creditCardList.length + 1.5),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.dartGratWithOpaity5,
                  blurRadius: 0.5,
                  spreadRadius: 0.3,
                ),
              ],
            ),
            child: SvgPicture.asset(
              controller.creditCardList[index],
              fit: BoxFit.contain,
            ),
          );
        }),
      ),
    );
  }
}
