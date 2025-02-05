import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<ImageSource?> imageSourceDialog() {
  return Get.bottomSheet<ImageSource?>(
    Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Text(
            "Select Image Source",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ImageSource.values.map((source) {
              return GestureDetector(
                onTap: () => Get.back(result: source),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade700,
                  child: Icon(
                    source == ImageSource.camera
                        ? Icons.camera_alt
                        : Icons.collections_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ),
  );
}
