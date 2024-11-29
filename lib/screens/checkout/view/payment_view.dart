import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/screens/checkout/controller/payment_controller.dart';
import 'package:e_commerce/widgets/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        paymentMethodSelectingWidget(),
        const SizedBox(height: 50),
        const CreditCardWidget(
          icon: ImageConstant.visaIcon,
          cardNumber: 4364134589328378,
          holderName: 'Sunie Pham',
          validDate: '02/2026',
        ),
      ],
    );
  }

  Widget paymentMethodSelectingWidget() {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.paymentMethodCart.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> item = entry.value;

          EdgeInsetsGeometry padding = EdgeInsets.only(
            left: index == 0 ? 0 : 5,
            right: index == controller.paymentMethodCart.length - 1 ? 0 : 5,
          );

          return Expanded(
            child: Padding(
              padding: padding,
              child: ObxValue<RxInt>(
                (selectedIndex) => GestureDetector(
                  onTap: () => controller.changePaymentMethod(index),
                  child: _buildContainer(
                    icon: item["icon"],
                    label: item["label"],
                    isSelected: selectedIndex.value == index,
                  ),
                ),
                controller.selectPaymentMethod,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContainer({
    required String icon,
    required String? label,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? AppColors.darkGray : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            offset: const Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SvgPicture.asset(
              icon,
              color: isSelected ? Colors.white : AppColors.dartGratWithOpaity5,
            ),
          ),
          if (label != null) ...[
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected ? Colors.white : AppColors.dartGratWithOpaity5,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
