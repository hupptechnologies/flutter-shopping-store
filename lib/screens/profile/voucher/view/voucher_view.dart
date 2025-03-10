import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/voucher/controller/voucher_controller.dart';
import 'package:e_commerce/screens/profile/voucher/view/widget/voucher_ticker_card_widget.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherView extends GetView<VoucherController> {
  const VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<VoucherController>(
      isLoader: controller.voucherService.api.isLoader,
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'Vouchers',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: Obx(() {
              if (controller.vouchers.isEmpty) {
                return const Center(
                  child: Text(
                    "No voucher found",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                );
              }
              return ListView.builder(
                itemCount: controller.vouchers.length,
                itemBuilder: (context, index) {
                  final item = controller.vouchers[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: VoucherTickerCardWidget(voucherDto: item),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
