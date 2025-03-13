import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/payments/controller/add_payment_controller.dart';
import 'package:e_commerce/screens/profile/payments/view/widget/add_payment_form_widget.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/credit_card_widget.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentView extends GetView<AddPaymentController> {
  const AddPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<AddPaymentController>(
      isLoader: controller.cardService.api.isLoader,
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'Add new card',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => CreditCardWidget(
                    icon: ImageConstant.mastercardIcon,
                    cardNumber: controller.cardNumberDisplay.value,
                    holderName: controller.cardholderDisplay.value,
                    validDate: controller.expiryDateDisplay.value,
                  ),),
                  const AddPaymentFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
