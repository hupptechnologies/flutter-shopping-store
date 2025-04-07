import 'package:e_commerce/common/constant/app_colors.dart';
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
              _buildVariantSection(
                alignment: Alignment.centerLeft,
                items: () => controller.productDto.value?.getColors ?? [],
                itemBuilder: (variant) => ColorWidget(
                  color: variant.color,
                  isSelected: false,
                ),
              ),
              _buildVariantSection(
                alignment: Alignment.centerRight,
                items: () => controller.productDto.value?.getSizes ?? [],
                itemBuilder: (variant) => SizeWidget(
                  size: variant.size,
                  isSelected: false,
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
    required List<dynamic> Function() items,
    required Widget Function(dynamic) itemBuilder,
  }) {
    return Expanded(
      child: Obx(() {
        final data = items();
        if (data.isEmpty) return const SizedBox();

        return Align(
          alignment: alignment,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: data.map(itemBuilder).toList(),
          ),
        );
      }),
    );
  }
}
