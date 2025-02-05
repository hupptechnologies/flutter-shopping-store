import 'dart:io';

import 'package:e_commerce/common/enum/gender_enum.dart';
import 'package:e_commerce/data/user/user_dto.dart';
import 'package:e_commerce/widgets/image_source_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingController extends GetxController {
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

  void saveChange () {
    Get.back();
  }
}
