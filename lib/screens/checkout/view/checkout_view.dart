import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/checkout/controller/checkout_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbarTitle(
        title: 'Check out',
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            stepperIconRowWidget(),
          ],
        ),
      ),
    );
  }

  Widget stepperIconRowWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            stepperIconWidget(Icons.location_on, 0),
            dividerWidget(),
            stepperIconWidget(Icons.payment_rounded, 1),
            dividerWidget(),
            stepperIconWidget(Icons.check_circle_rounded, 2),
          ],
        ),
      ),
    );
  }

  Widget stepperIconWidget(IconData icon, int index) {
    return Icon(
      icon,
      color: controller.currentStep.value == index
          ? Colors.black
          : AppColors.dartGratWithOpaity5,
    );
  }

  Widget dividerWidget() {
    return Expanded(
      child: Container(
        height: 1,
        color: AppColors.dartGratWithOpaity5,
        margin: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
