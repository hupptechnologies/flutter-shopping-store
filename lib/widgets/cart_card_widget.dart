import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/data/product/product.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:flutter/material.dart';

class CartCardWidget extends StatelessWidget {
  final ProductDto product;
  final Function(int) toggleSelectingCart;
  final bool isSelected;
  final Function(int, bool) incrementDecrementQuantity;

  const CartCardWidget({
    super.key,
    required this.product,
    required this.toggleSelectingCart,
    required this.isSelected,
    required this.incrementDecrementQuantity,
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
                image: AssetImage(
                  product.image,
                ),
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
                  _buildHeader(),
                  Text('\$ ${product.discountPrice!.toString()}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  sizeColorRowWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(product.name!,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          iconBadgeWidget(),
        ],
      ),
    );
  }

  Widget iconBadgeWidget() {
    return GestureDetector(
      onTap: () => toggleSelectingCart(product.id),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
              isSelected ? AppColors.lightGreen : AppColors.dartGratWithOpaity5,
        ),
        child: const Icon(Icons.check, size: 15, color: Colors.white),
      ),
    );
  }

  Widget sizeColorRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Size: M | Color: white',
            style:
                TextStyle(fontSize: 11, color: AppColors.dartGratWithOpaity5)),
        quantitySelectorWidget(),
      ],
    );
  }

  Widget quantitySelectorWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.dartGratWithOpaity5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          quantityButtonWidget(Icons.remove, false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(product.quantity.toString(),
                style: TextStyle(color: AppColors.dartGratWithOpaity5)),
          ),
          quantityButtonWidget(Icons.add, true),
        ],
      ),
    );
  }

  Widget quantityButtonWidget(IconData icon, bool isIncrement) {
    return InkWell(
      onTap: () => incrementDecrementQuantity(product.id, isIncrement),
      child: Icon(icon, size: 15, color: AppColors.dartGratWithOpaity5),
    );
  }
}
