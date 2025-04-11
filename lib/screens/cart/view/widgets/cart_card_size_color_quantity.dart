import 'package:colornames/colornames.dart';
import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/dto/variant_dto.dart';
import 'package:e_commerce/screens/cart/view/widgets/cart_card_quantity_button.dart';
import 'package:flutter/material.dart';

class CartCardSizeColorQuantity extends StatelessWidget {
  final int id;
  final int quantity;
  final VariantDto variant;
  const CartCardSizeColorQuantity({
    super.key,
    required this.id,
    required this.quantity,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    final color = ColorNames.guess(AppColors.hexToColor(variant.color) ?? Colors.black);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Size: ${variant.size} | Color: $color',
              style: TextStyle(
                fontSize: 11,
                color: AppColors.dartGratWithOpaity5,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.dartGratWithOpaity5),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Row(
            children: [
              CartCardQuantityButton(
                isIncrement: false,
                id: id,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  quantity.toString(),
                  style: TextStyle(
                    color: AppColors.dartGratWithOpaity5,
                  ),
                ),
              ),
              CartCardQuantityButton(
                isIncrement: true,
                id: id,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
