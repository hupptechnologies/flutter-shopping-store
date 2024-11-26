import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/color_widget.dart';
import 'package:e_commerce/widgets/description_accordion.dart';
import 'package:e_commerce/widgets/favorite_widget.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:e_commerce/widgets/review_card_widget.dart';
import 'package:e_commerce/widgets/review_widget.dart';
import 'package:e_commerce/widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Obx(
                () => Image.asset(controller.prodcut.image),
              ),
            ),
            backButtonAndFavorite(),
            scrollableSheet()
          ],
        ),
      ),
    );
  }

  Widget backButtonAndFavorite() {
    return Padding(
      padding: EdgeInsets.only(
        top: MarginPadding.homeTopPadding,
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
        initialChildSize: 0.55,
        maxChildSize: 0.65,
        minChildSize: 0.55,
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
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
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
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: ReviewCardWidget(
                              image: ImageConstant.category1,
                              name: 'Jennifer Rose',
                              reting: 4.5,
                              time: '5m ago',
                              message:
                                  'I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!',
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget titleOrPriceWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
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
                    color: AppColors.darkGray.withOpacity(0.8),
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
                    color: AppColors.darkGray.withOpacity(0.8),
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
}
