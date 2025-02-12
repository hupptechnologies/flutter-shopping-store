import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/aboutUs/controller/about_as_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactAboutUsWidget extends GetView<AboutAsController> {
  const ContactAboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        spacing: 15,
        children: List.generate(
          controller.contacts.length,
          (index) {
            final item = controller.contacts[index];
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.openContacts(item['type']),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    spacing: 5,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: AppColors.black,
                        ),
                        child: Icon(
                          item['icon'],
                          color: AppColors.white,
                          size: 22,
                        ),
                      ),
                      Text(
                        item['title'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        item['subTitle'].toString(),
                        style: const TextStyle(fontSize: 11),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: [item['days'], '\u2022', item['time']]
                            .map(
                              (el) => Text(
                                el,
                                style: const TextStyle(fontSize: 11),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
