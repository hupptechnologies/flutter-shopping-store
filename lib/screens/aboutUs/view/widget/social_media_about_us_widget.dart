import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/aboutUs/controller/about_as_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SocialMediaAboutUsWidget extends GetView<AboutAsController> {
  const SocialMediaAboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 5),
      itemCount: controller.socialMedias.length,
      itemBuilder: (context, index) {
        final item = controller.socialMedias[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              spacing: 10,
              children: [
                SvgPicture.asset(item['icon']),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        spacing: 5,
                        children: [item['subTitle'], '\u2022', item['other']]
                            .map(
                              (el) => Text(
                                el,
                                style: TextStyle(
                                    color: AppColors.dartGratWithOpaity5),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
