import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/dto/variant_dto.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/color_widget.dart';
import 'package:e_commerce/widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProductDetailsColorOrSize extends GetView<ProductDetailController> {
  const ProductDetailsColorOrSize({super.key});

  @override
  Widget build(BuildContext context) {
    final addToCartReq = controller.addToCartReq;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["Color", "Size"]
                .map(
                  (name) => Text(
                    name,
                    style: TextStyle(
                      color: AppColors.darkGray.withOpacityValue(0.8),
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Obx(
                () => _buildVariantSection(
                  alignment: Alignment.centerLeft,
                  items: addToCartReq.filteredColors,
                  isSelected: (variant) =>
                      addToCartReq.selectedColor.value == variant.color,
                  onTap: (variant) => addToCartReq.setColor(variant.color),
                  builder: (variant, isSelected) {
                    return ColorWidget(
                      color: variant.color,
                      isSelected: isSelected,
                    );
                  },
                ),
              ),
              Obx(
                () => _buildVariantSection(
                  alignment: Alignment.centerRight,
                  items: addToCartReq.filteredSizes,
                  isSelected: (variant) =>
                      addToCartReq.selectedSize.value == variant.size,
                  onTap: (variant) => addToCartReq.setSize(variant.size),
                  builder: (variant, isSelected) {
                    return SizeWidget(
                      size: variant.size,
                      isSelected: isSelected,
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildVariantSection({
    required Alignment alignment,
    required List<VariantDto> items,
    required bool Function(VariantDto) isSelected,
    required void Function(VariantDto) onTap,
    required Widget Function(VariantDto, bool) builder,
  }) {
    return Expanded(
      child: items.isEmpty
          ? const SizedBox()
          : Align(
              alignment: alignment,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: items
                    .map((variant) => GestureDetector(
                          onTap: () => onTap(variant),
                          child: builder(variant, isSelected(variant)),
                        ))
                    .toList(),
              ),
            ),
    );
  }
}
