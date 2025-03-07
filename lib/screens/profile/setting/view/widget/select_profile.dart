import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/profile/setting/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectProfile extends GetView<SettingController> {
  const SelectProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Obx(
              () => CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.lightGray,
                backgroundImage: controller.imageFile.value != null
                    ? FileImage(controller.imageFile.value!) as ImageProvider
                    : controller.userDto.value.image != null
                        ? NetworkImage(controller.userDto.value.image!)
                        : null,
                child: (controller.imageFile.value == null &&
                        (controller.userDto.value.image == null ||
                            controller.userDto.value.image!.isEmpty))
                    ? const Icon(Icons.person, color: Colors.white, size: 50)
                    : null,
              ),
            ),
            Positioned(
              right: 5,
              bottom: 0,
              child: GestureDetector(
                onTap: controller.pickImage,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkGray,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 21,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
