import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/checkout/controller/checkout_controller.dart';
import 'package:e_commerce/screens/checkout/view/order_complete_view.dart';
import 'package:e_commerce/screens/checkout/view/payment_view.dart';
import 'package:e_commerce/screens/checkout/view/shipping_view.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginPadding.homeHorPadding,
            vertical: MarginPadding.homeTopPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              stepperIconRowWidget(),
              stepperTitleWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    child: ObxValue(
                      (index) {
                        if (index.value == 1) {
                          return const PaymentView();
                        } else if (index.value == 2) {
                          return const OrderCompleteView();
                        }
                        return ShippingView(
                          nextStep: controller.nextStep,
                        );
                      },
                      controller.currentStep,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stepperIconRowWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            stepperIconWidget(ImageConstant.locationIcon, 0),
            dividerWidget(),
            stepperIconWidget(ImageConstant.cardIcon, 1),
            dividerWidget(),
            stepperIconWidget(ImageConstant.doneIcon, 2),
          ],
        ),
      ),
    );
  }

  Widget stepperIconWidget(String icon, int index) {
    return SvgPicture.asset(
      icon,
      color: controller.currentStep.value >= index
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

  Widget stepperTitleWidget() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'STEP ${controller.currentStep.value + 1}',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              controller.stepperTitle[controller.currentStep.value],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
