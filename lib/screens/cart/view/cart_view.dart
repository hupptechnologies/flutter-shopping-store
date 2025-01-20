import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/data/product/product.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/cart_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const BackButtonAppbarTitle(title: 'Your cart', centerTitle: true),
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              cartListWidget(),
              proceedToCheckoutWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget cartListWidget() {
    return Expanded(
      child: SingleChildScrollView(
        child: Obx(
          () => ListView.builder(
              itemCount: controller.carts.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: MarginPadding.homeHorPadding,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final ProductDto item = controller.carts[index];
                final bool isSelected =
                    controller.selectingCart.contains(item.id);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CartCardWidget(
                    product: controller.carts[index],
                    toggleSelectingCart: controller.toggleSelectingCart,
                    isSelected: isSelected,
                    incrementDecrementQuantity:
                        controller.incrementDecrementQuantity,
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget proceedToCheckoutWidget() {
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
      child: Column(
        children: [
          Obx(
            () => titleWithPriceWidget(
                title: 'Product Price',
                price: '\$ ${controller.productPrice.value.toString()}'),
          ),
          const Divider(),
          titleWithPriceWidget(title: 'Shipping', price: 'Freeship'),
          const Divider(),
          Obx(
            () => titleWithPriceWidget(
              title: 'SubTotal',
              price: '\$ ${controller.productPrice.value.toString()}',
              isTotalWidget: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Obx(
              () => ButtonWidget(
                title: 'Proceed to checkout',
                onPressed: controller.proceedToCheckout,
                isDisable: controller.selectingCart.isEmpty,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWithPriceWidget({
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
