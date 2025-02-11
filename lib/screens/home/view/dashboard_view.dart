import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:e_commerce/widgets/row_text_with_showall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIconsContainer(),
          _buildImageWithTextContainer(),
          RowTextWithShowall(
            text: 'Feature Products',
            horizontal: MarginPadding.homeHorPadding,
          ),
          _buildFeatureProducatList(),
          _buildNewCollection(),
          RowTextWithShowall(
            text: 'Recommended',
            horizontal: MarginPadding.homeHorPadding,
          ),
          _buildRecommended(),
          const SizedBox(height: 10),
          RowTextWithShowall(
            text: 'Top Collection',
            horizontal: MarginPadding.homeHorPadding,
          ),
          _buildTopColletionFirst(),
          _buildTopColletionSecond(),
          _buildRowCard(),
        ],
      ),
    );
  }

  Widget _buildIconsContainer() {
    return Padding(
      padding: EdgeInsets.only(
        left: MarginPadding.homeHorPadding,
        right: MarginPadding.homeHorPadding,
        top: MarginPadding.homeHorPadding,
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIcon(ImageConstant.womenIcon, 'Women', 0),
            _buildIcon(ImageConstant.menIcon, 'Man', 1),
            _buildIcon(ImageConstant.accessoriesIcon, 'Accessories', 2),
            _buildIcon(ImageConstant.beautyIcon, 'Beauty', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithTextContainer() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
        vertical: 20,
      ),
      child: _customCard(ImageConstant.categoryHome, 'Autumn Collection 2022'),
    );
  }

  Widget _buildFeatureProducatList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(controller.items.length, (index) {
            final item = controller.items[index];
            return Padding(
              padding: EdgeInsets.only(
                right: index == controller.items.length - 1
                    ? MarginPadding.homeHorPadding
                    : 16,
                left: index == 0 ? MarginPadding.homeHorPadding : 0,
              ),
              child: InkWell(
                onTap: () =>
                    Get.toNamed(AppRoutes.productDetail, arguments: {'id': 1}),
                child: ProductCard(
                  name: item['category']!,
                  image: item['image'],
                  price: item['price'],
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Widget _buildNewCollection() {
    return _buildTextWithImage(
      height: 180,
      textPadding: const EdgeInsets.only(
        left: 40,
        right: 15,
      ),
      title: 'NEW COLLECTION',
      subTitle: 'HANG OUT & PARTY',
      image: ImageConstant.newCollection,
    );
  }

  Widget _buildRecommended() {
    return SizedBox(
      height: 82,
      child: Obx(() {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final item = controller.items[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: index == controller.items.length - 1
                      ? MarginPadding.homeHorPadding
                      : 16,
                  left: index == 0 ? MarginPadding.homeHorPadding : 0,
                ),
                child: InkWell(
                  onTap: () => Get.toNamed(AppRoutes.productDetail, arguments: {'id': 2}),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
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
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(6),
                            ),
                            color: Colors.grey[200],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(6),
                            ),
                            child: item['image'] != null &&
                                    item['image']!.isNotEmpty
                                ? Image.asset(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: AppColors.lightGray,
                                        child: const Center(
                                          child: Icon(
                                            Icons.image,
                                            color: AppColors.darkGray,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: AppColors.lightGray,
                                    child: const Center(
                                      child: Icon(
                                        Icons.image,
                                        color: AppColors.darkGray,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['category']!),
                              Text(
                                item['price']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }

  Widget _buildTopColletionFirst() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
      ),
      child: _buildTextWithImage(
        height: 150,
        textPadding: EdgeInsets.only(
          left: 40 - MarginPadding.homeHorPadding,
          right: 30,
        ),
        boxBorderRadius: BorderRadius.circular(10),
        title: 'Sele up to 40%',
        subTitle: 'FOR SLIM \n& BEAUTY',
        subTitleFontSize: 22,
        subTitleColor: Colors.black54,
        image: ImageConstant.topCollection1,
        innerCircleTopPadding: 20,
        innerCircleRightPadding: 20,
      ),
    );
  }

  Widget _buildTopColletionSecond() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
      ),
      child: _buildTextWithImage(
        height: 170,
        textPadding: EdgeInsets.only(
          left: 40 - MarginPadding.homeHorPadding,
        ),
        boxBorderRadius: BorderRadius.circular(10),
        title: 'Summer Collection 2021',
        subTitle: 'Most sexy \n& fabulous design',
        subTitleFontSize: 22,
        subTitleColor: Colors.black54,
        image: ImageConstant.topCollection2,
        innerCircleTopPadding: 35,
        innerCircleRightPadding: 20,
      ),
    );
  }

  Widget _buildRowCard() {
    double width = MediaQuery.of(Get.context!).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * 0.43,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.asset(
                      ImageConstant.imageLeft,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'T-Shirts',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'The Office Life',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width * 0.43,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dresses',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Elegent Design \n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      ImageConstant.imageRight,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      alignment: Alignment.topRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextWithImage({
    required double height,
    required EdgeInsetsGeometry textPadding,
    required String title,
    required String subTitle,
    BorderRadiusGeometry? boxBorderRadius,
    double? subTitleFontSize,
    Color? subTitleColor,
    required String image,
    double innerCircleTopPadding = 0,
    double innerCircleRightPadding = 0,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        margin: EdgeInsets.zero,
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: boxBorderRadius,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: textPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: subTitleFontSize ?? 35,
                        fontWeight: FontWeight.w400,
                        color: subTitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 10),
                child: Center(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (innerCircleTopPadding <= 0)
                            Container(
                              width: height - 50,
                              height: height - 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: innerCircleTopPadding,
                              right: innerCircleRightPadding,
                            ),
                            child: Container(
                              width: height - 70,
                              height: height - 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(image),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String svgPath, String label, int index) {
    bool isSelected = controller.categorySelectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeCategorySeletedIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: isSelected ? const EdgeInsets.all(2) : EdgeInsets.zero,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  isSelected ? Border.all(color: Colors.black, width: 2) : null,
            ),
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.black : AppColors.lightGray,
              ),
              child: SvgPicture.asset(
                svgPath,
                color: isSelected ? Colors.white : Colors.black38,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _customCard(String imageUrl, String overlayText) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  overlayText.replaceAll(' ', '\n'),
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildCategoryCard(Map<String, String> item) {
  //   return SizedBox(
  //     width: 120,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Card(
  //           elevation: 4,
  //           margin: EdgeInsets.zero,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(15),
  //             child: Container(
  //               height: 180,
  //               color: AppColors.lightGray,
  //               child: item['image'] != null && item['image']!.isNotEmpty
  //                   ? Image.asset(
  //                       item['image']!,
  //                       fit: BoxFit.cover,
  //                       errorBuilder: (context, error, stackTrace) {
  //                         return Container(
  //                           color: AppColors.lightGray,
  //                           child: const Center(
  //                             child: Icon(
  //                               Icons.image,
  //                               color: AppColors.darkGray,
  //                             ),
  //                           ),
  //                         );
  //                       },
  //                     )
  //                   : Container(
  //                       color: AppColors.lightGray,
  //                       child: const Center(
  //                         child: Icon(
  //                           Icons.image,
  //                           color: AppColors.darkGray,
  //                         ),
  //                       ),
  //                     ),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 5,
  //         ),
  //         Text(
  //           item['category']!,
  //           style: const TextStyle(
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //         Text(
  //           item['price']!,
  //           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
