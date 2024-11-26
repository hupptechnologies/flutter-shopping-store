import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/widgets/build_range_slider.dart';
import 'package:e_commerce/widgets/color_widget.dart';
import 'package:e_commerce/widgets/drawer/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterDrawerView extends GetView<FilterController> {
  const FilterDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(30.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Fliter',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(ImageConstant.filterIcon),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                thickness: 1,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      buildTitle('Price'),
                      Obx(
                        () => BuildRangeSlider(
                          values: controller.rangeSlider.value,
                          onChanged: controller.changeRangeSlider,
                        ),
                      ),
                      const SizedBox(height: 25),
                      buildTitle('Color'),
                      buildColorBox(),
                      const SizedBox(height: 25),
                      buildTitle('Star Rating'),
                      buildStartRating(),
                      const SizedBox(height: 25),
                      buildTitle('Category'),
                      const SizedBox(height: 15),
                      buildCategoryCheckbox(),
                      const SizedBox(height: 25),
                      buildTitle('Discount'),
                      const SizedBox(height: 15),
                      buildDiscountCheckbox(),
                      const SizedBox(height: 25),
                      buildActionButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(color: AppColors.darkGray),
    );
  }

  Widget buildColorBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: controller.colors.asMap().entries.map((entry) {
            int index = entry.key;
            bool isSelected = controller.selectedColors.contains(index);
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
    );
  }

  Widget buildStartRating() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (i) {
            int index = i + 1;
            bool isSelected = controller.selectedRating.value == index;
            return GestureDetector(
              onTap: () => controller.changeRating(index),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.black87 : null,
                  border: Border.all(width: 1.5, color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: isSelected ? Colors.white : Colors.black,
                      size: 15,
                    ),
                    Text(
                      index.toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget buildCategoryCheckbox() {
    return Obx(
      () => Wrap(
        spacing: 5,
        children: controller.categoryList.map((category) {
          return FilterChip(
            padding: EdgeInsets.zero,
            label: Text(category['name']),
            selected: controller.selectedCategories.contains(category['id']),
            selectedColor: AppColors.lightGray,
            onSelected: (bool selected) =>
                controller.toggleCategories(selected, category['id']),
          );
        }).toList(),
      ),
    );
  }

  Widget buildDiscountCheckbox() {
    return Obx(
      () => Wrap(
        spacing: 5,
        children: controller.discountList.map((item) {
          return FilterChip(
            padding: EdgeInsets.zero,
            label: Text("${item['name']}% off"),
            selected: item['id'] == controller.selectedDiscount.value,
            selectedColor: AppColors.lightGray,
            onSelected: (bool selected) =>
                controller.changeDiscount(selected, item['id']),
          );
        }).toList(),
      ),
    );
  }

  Widget buildActionButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: MarginPadding.homeTopPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => controller.clearFilter(),
            child: const Text(
              "Clear",
              style: TextStyle(color: AppColors.darkGray),
            ),
          ),
          Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () => controller.saveFilter(context),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                backgroundColor: AppColors.lightGray,
              ),
              child: const Text(
                "Apply",
                style: TextStyle(color: AppColors.darkGray),
              ),
            );
          }),
        ],
      ),
    );
  }
}
