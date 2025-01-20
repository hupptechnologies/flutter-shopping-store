import 'dart:io';

import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RatingController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  late RxDouble rating = 0.0.obs;
  late RxList<File> selectedImages = <File>[].obs;

  void onChangeRating(double value) {
    rating.value = value;
  }

  void removeImage(File value) {
    selectedImages.remove(value);
  }

  Future<void> pickImages() async {
    try {
      final List<XFile>? pickedFiles = await picker.pickMultiImage();

      if (pickedFiles != null) {
        final list = pickedFiles.map((e) => File(e.path)).toList();

        for (var file in list) {
          if (!selectedImages
              .any((existingFile) => existingFile.path == file.path)) {
            selectedImages.add(file);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error picking images: $e");
      }
    }
  }

  void clear() {
    rating.value = 0.0;
    textController.clear();
    selectedImages.clear();
  }

  Future<void> submitReview() async {
    clear();
    CommonGetX.backPage();
  }
}
