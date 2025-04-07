import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_back_or_favorite_button.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_image_change_circle.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_images.dart';
import 'package:e_commerce/widgets/accordion_text_icon.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/color_widget.dart';
import 'package:e_commerce/widgets/description_accordion.dart';
import 'package:e_commerce/widgets/favorite_widget.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:e_commerce/widgets/review_widget.dart';
import 'package:e_commerce/widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const ProductDetailImages(),
          const ProductDetailBackOrFavoriteButton(),
          const ProductDetailImageChangeCircle(),
          scrollableSheet()
        ],
      ),
    );
  }

  Widget backButtonAndFavorite() {
    return Padding(
      padding: EdgeInsets.only(
        top: MarginPadding.homeTopPadding * 2.5,
        left: MarginPadding.homeHorPadding,
        right: MarginPadding.homeHorPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BuildBackButton(),
          Obx(
            () => FavoriteWidget(
              isFavorite: controller.prodcut.isFavorite,
              isBoxShadow: true,
              onPressed: controller.toggleFavorite,
            ),
          ),
        ],
      ),
    );
  }

  Widget scrollableSheet() {
    return DraggableScrollableSheet(
      controller: controller.draggableScrollableController,
      initialChildSize: 0.48,
      maxChildSize: 0.6,
      minChildSize: 0.48,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacityValue(0.2),
                blurRadius: 4,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MarginPadding.homeHorPadding,
                        ),
                        child: Column(
                          children: [
                            titleOrPriceWidget(),
                            ratingWidget(),
                            const Divider(),
                            colorOrSizeWidget(),
                            const Divider(),
                            const DescriptionAccordion(
                              description:
                                  "This is the basic description of the product. "
                                  "It provides an overview of the product and its features. "
                                  "Here is the additional information that appears when you click Read More. "
                                  "This detailed explanation helps the user understand the product better.",
                            ),
                            const ReviewWidget(
                              ratings: [0, 3, 5, 12, 80],
                            ),
                          ],
                        ),
                      ),
                      similarProductWidget(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: controller.onTapAddToCart,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.darkGray,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageConstant.shoppingIcon),
                        const SizedBox(width: 10),
                        const Text(
                          'Add To Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget titleOrPriceWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.prodcut.name!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$ ${controller.prodcut.discountPrice}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Obx(
        () => RatingWidget(
          value: controller.prodcut.rating!,
          size: 20,
        ),
      ),
    );
  }

  Widget colorOrSizeWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Color',
                  style: TextStyle(
                    color: AppColors.darkGray.withOpacityValue(0.8),
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: controller.colors.asMap().entries.map((entry) {
                      int index = entry.key;
                      bool isSelected =
                          controller.selectedColors.contains(index);
                      return GestureDetector(
                        onTap: () => controller.toggleColor(index),
                        child: ColorWidget(
                          color: entry.value,
                          isSelected: isSelected,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Size',
                  style: TextStyle(
                    color: AppColors.darkGray.withOpacityValue(0.8),
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: controller.sizes.map((item) {
                      bool isSelected = controller.seletedSize == item['id'];
                      return GestureDetector(
                          onTap: () => controller.toggleSize(item['id']),
                          child: SizeWidget(
                            size: item['value'],
                            isSelected: isSelected,
                          ));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget similarProductWidget() {
    return AccordionTextIcon(
      title: 'Similar Product',
      isExpanded: true,
      padding: MarginPadding.homeHorPadding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children:
                  List.generate(controller.similarProducts.length, (index) {
                final item = controller.similarProducts[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? MarginPadding.homeHorPadding : 0,
                    right: MarginPadding.homeHorPadding,
                  ),
                  child: ProductCard(
                    name: item.name!,
                    image: item.image,
                    width: 130,
                    price: '\$ ${item.discountPrice.toString()}',
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
