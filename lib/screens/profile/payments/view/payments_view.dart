import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/payments/controller/payments_controller.dart';
import 'package:e_commerce/screens/profile/payments/view/widget/payments_add_title_widget.dart';
import 'package:e_commerce/screens/profile/payments/view/widget/payments_card_widget.dart';
import 'package:e_commerce/screens/profile/payments/view/widget/payments_credit_cart_widget.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsView extends GetView<PaymentsController> {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<PaymentsController>(
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'Payment',
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaymentsAddTitleWidget(),
              const PaymentsCardWidget(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MarginPadding.homeHorPadding,
                  vertical: 40,
                ),
                child: const Text('or check out with'),
              ),
              const PaymentsCreditCartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
