import 'dart:io';

import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/dto/review_dto.dart';
import 'package:e_commerce/screens/profile/feedback/view/widget/feedback_submit_dialog_widget.dart';
import 'package:e_commerce/service/review_service.dart';
import 'package:e_commerce/widgets/image_source_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FeedbackController extends GetxController {
  final ReviewService reviewService = ReviewService();
  final TextEditingController descriptionController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  final RxDouble rating = 0.0.obs;
  final RxBool isValid = false.obs;

  late RxList<File> selectedImages = <File>[].obs;

  @override
  void onInit() {
    super.onInit();
    descriptionController.addListener(_validateForm);
    rating.listen((_) => _validateForm());
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void addImage(File value) {
    selectedImages.add(value);
  }

  void removeImage(File value) {
    selectedImages.remove(value);
  }

  void onRatingChanged(double value) {
    rating.value = value;
  }

  void _validateForm() {
    isValid.value = descriptionController.text.isNotEmpty && rating.value > 0;
  }

  Future<void> pickImages() async {
    try {
      final ImageSource? source = await imageSourceDialog();
      if (source == null) return;

      if (source == ImageSource.camera) {
        await cameraPickImage();
        return;
      }

      await pickMultiImage();
      return;
    } catch (e) {
      if (kDebugMode) {
        print("Error picking images: $e");
      }
    }
  }

  Future<void> pickMultiImage() async {
    final List<XFile> pickedFiles = await picker.pickMultiImage();
    final list = pickedFiles.map((e) => File(e.path)).toList();
    for (var file in list) {
      if (!selectedImages
          .any((existingFile) => existingFile.path == file.path)) {
        selectedImages.add(file);
      }
    }
    return;
  }

  Future<void> cameraPickImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      if (!selectedImages
          .any((existingFile) => existingFile.path == file.path)) {
        selectedImages.add(file);
      }
    }
    return;
  }

  Future<void> submitReview() async {
    final ReviewDto reviewDto = ReviewDto(
      comment: descriptionController.text,
      rating: rating.value.toString(),
    );
    final response = await reviewService.create(reviewDto, selectedImages);
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    clearData();
    Get.dialog(const FeedbackSubmitDialogWidget());
  }

  void clearData() {
    descriptionController.clear();
    rating.value = 0.0;
    selectedImages.clear();
  }
}
