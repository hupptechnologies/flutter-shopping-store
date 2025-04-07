import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardRecommendedList extends GetView<DashboardController> {
  const DashboardRecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: Obx(() {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.dashboardData.value.recommendedProducts.length,
            itemBuilder: (context, index) {
              final ProductDto item = controller.dashboardData.value.recommendedProducts[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: index == controller.items.length - 1
                      ? MarginPadding.homeHorPadding
                      : 16,
                  left: index == 0 ? MarginPadding.homeHorPadding : 0,
                ),
                child: InkWell(
                  onTap: () => controller.gotoProductDetail(item.id),
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
                            child: item.getImage != null &&
                                    item.getImage!.isNotEmpty
                                ? Image.network(
                                    item.getImage!,
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
                              Text(item.name),
                              Text(
                                item.price.toString(),
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
}