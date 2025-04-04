import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard/dashboard_category_circle.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard/dashboard_feature_product_section.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard/dashboard_image_text_card.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard/dashboard_recommended_section.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard/dashboard_top_colletion_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.fetchDashboardData,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardCategoryCircle(),
            const DashboardImageTextCard(),
            const DashboardFeatureProductSection(),
            _buildNewCollection(),
            const DashboardRecommendedSection(),
            const SizedBox(height: 10),
            const DashboardTopColletionSection(),
          ],
        ),
      ),
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
      subTitleFontSize: 20,
      image: ImageConstant.newCollection,
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
}
