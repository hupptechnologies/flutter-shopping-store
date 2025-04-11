import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/utils/helper.dart';
import 'package:e_commerce/dto/cart_dto.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/cart/view/widgets/cart_card_size_color_quantity.dart';
import 'package:e_commerce/screens/cart/view/widgets/cart_card_title_select.dart';
import 'package:flutter/material.dart';

class CartCardDetail extends StatelessWidget {
  final CartDto cart;

  const CartCardDetail({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacityValue(0.08),
            offset: const Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(20)),
              color: AppColors.lightGray,
              image: DecorationImage(
                image: Helper.getImageProvider(cart.product.getImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CartCardTitleSelect(
                    id: cart.id,
                    isSelected: cart.isSelected,
                    productName: cart.product.name,
                  ),
                  Text(
                    cart.price.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CartCardSizeColorQuantity(
                    id: cart.id,
                    quantity: cart.quantity,
                    variant: cart.variant,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
