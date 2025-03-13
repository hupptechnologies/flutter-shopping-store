import 'dart:io';

import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/data/user_dto.dart';
import 'package:e_commerce/service/user_service.dart';
import 'package:e_commerce/widgets/image_source_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingController extends GetxController {
  late UserService userService = UserService();

  Rx<UserDto> userDto = Rx<UserDto>(UserDto());

  late Rx<File?> imageFile = Rx<File?>(null);
  final ImagePicker imagePicker = ImagePicker();

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
    userDto.value = response.data!;
  }

  Future<void> updateProfile() async {
    final response = await userService.updateUser(userDto.value, imageFile.value);
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    Get.back();
    CommonSnackbar.success(response.message);
  }
}
