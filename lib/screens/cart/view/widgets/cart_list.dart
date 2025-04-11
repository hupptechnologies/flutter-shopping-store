import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/dto/cart_dto.dart';
import 'package:e_commerce/screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/screens/cart/view/widgets/cart_card_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CartList extends GetView<CartController> {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Obx(() {
          final carts = controller.yourCartDto.value?.carts ?? [];

          if (carts.isEmpty) {
            return const Center(
              child: Text(
                "Record Not Found",
              ),
            );
          }

          return ListView.builder(
              itemCount: carts.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: MarginPadding.homeHorPadding,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final CartDto item = carts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CartCardDetail(cart: item),
                );
              });
        }),
      ),
    );
  }
}
