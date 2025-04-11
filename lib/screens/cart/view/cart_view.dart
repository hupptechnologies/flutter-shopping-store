import 'package:e_commerce/screens/cart/controller/cart_controller.dart';
import 'package:e_commerce/screens/cart/view/widgets/cart_checkout.dart';
import 'package:e_commerce/screens/cart/view/widgets/cart_list.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<CartController>(
      isLoader: controller.cartService.api.isLoader,
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          title: 'Your cart',
          centerTitle: true,
          result: true,
        ),
        body: RefreshIndicator(
          onRefresh: controller.fetchAllCarts,
          child: const SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CartList(),
                CartCheckout(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
