import 'dart:io';

import 'package:e_commerce/screens/profile/feedback/view/widget/feedback_submit_dialog_widget.dart';
import 'package:e_commerce/widgets/image_source_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FeedbackController extends GetxController {
  final TextEditingController descriptionController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  late RxList<File> selectedImages = <File>[].obs;

  void removeImage(File value) {
    selectedImages.remove(value);
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

  void submitReview() {
    Get.dialog(const FeedbackSubmitDialogWidget());
  }
}
