import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCheckout extends GetView<CartController> {
  const CartCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MarginPadding.homeTopPadding,
        horizontal: MarginPadding.homeHorPadding,
      ),
      margin: EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacityValue(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Obx(() {
        final cart = controller.yourCartDto.value?.calculate;
        final isDisable = controller.yourCartDto.value?.isCheckOut ?? false;
        return Column(
          children: [
            _titleWithPriceWidget(
              title: "Product Price",
              price: cart?.productPrice.toString() ?? "0",
            ),
            const Divider(),
            _titleWithPriceWidget(
              title: "Shipping",
              price: (cart?.shipping ?? 0) > 0
                  ? cart!.shipping.toString()
                  : 'Freeship',
            ),
            const Divider(),
            _titleWithPriceWidget(
              title: "SubTotal",
              price: cart?.total.toString() ?? "0",
              isTotalWidget: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ButtonWidget(
                title: 'Proceed to checkout',
                onPressed: controller.proceedToCheckout,
                isDisable: !isDisable,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _titleWithPriceWidget({
    required String title,
    required String price,
    bool isTotalWidget = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: !isTotalWidget ? AppColors.dartGratWithOpaity5 : null,
              fontSize: 14,
              fontWeight: isTotalWidget ? FontWeight.bold : null,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: isTotalWidget ? 18 : 14,
              fontWeight: isTotalWidget ? FontWeight.bold : null,
            ),
          )
        ],
      ),
    );
  }
}
