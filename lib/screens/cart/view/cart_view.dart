import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/data/product/product.dart';
import 'package:e_commerce/screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/cart_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginPadding.homeHorPadding,
            vertical: MarginPadding.homeTopPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              backButtonOrTitle(),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.carts.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final ProductDto item = controller.carts[index];
                          final bool isSelected =
                              controller.selectingCart.contains(item.id);
                          print('isSelected, $isSelected');
                          print(
                              'controller.selectingCart, ${controller.selectingCart}');
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CartCardWidget(
                              product: controller.carts[index],
                              toggleSelectingCart:
                                  controller.toggleSelectingCart,
                              isSelected: isSelected,
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget backButtonOrTitle() {
    return const Stack(
      children: [
        BuildBackButton(),
        Padding(
          padding: EdgeInsets.only(top: 7),
          child: Center(
            child: Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
