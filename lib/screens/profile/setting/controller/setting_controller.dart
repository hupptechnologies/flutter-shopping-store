import 'dart:io';

import 'package:e_commerce/common/enum/gender_enum.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/data/user/user_dto.dart';
import 'package:e_commerce/service/user_service.dart';
import 'package:e_commerce/widgets/image_source_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingController extends GetxController {
  late UserService userService = UserService();

  late Rx<File?> imageFile = Rx<File?>(null);
  final ImagePicker imagePicker = ImagePicker();
  late Rxn<UserDto> user = Rxn<UserDto>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Rxn<Gender> selectedGender = Rxn<Gender>();

  Future<void> pickImage() async {
    final ImageSource? source = await imageSourceDialog();
    if (source == null) return;

    final XFile? pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    final response = await userService.getProfile();
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    final user = response.data!;
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    emailController.text = user.email;
    phoneController.text = user.mobileNumber!;
  }

  void saveChange() {
    Get.back();
  }
}
