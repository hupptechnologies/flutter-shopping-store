import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CommonSnackbar {
  static int duration = 3;
  static SnackPosition commonPosition = SnackPosition.TOP;

  /// Displays an error snackbar with the specified [message].
  ///
  /// The snackbar has a default position at the bottom of the screen.
  /// - [message]: The error message to display in the snackbar.
  /// - [position]: Optional. The position of the snackbar on the screen.
  ///   Defaults to `SnackPosition.TOP`.
  ///
  /// Example:
  /// ```dart
  /// CommonSnackbar.error('An error occurred');
  /// ```
  static void error(String message, {String title = 'Error', SnackPosition? position}) {
    Get.snackbar(
      title,
      message,
      snackPosition: position ?? commonPosition,
      backgroundColor: AppColors.offRed,
      barBlur: 10,
      borderRadius: 25,
      colorText: Colors.white,
      duration: Duration(seconds: duration),
    );
  }

  /// Displays a success snackbar with the specified [message].
  ///
  /// The snackbar has a default position at the bottom of the screen.
  /// - [message]: The success message to display in the snackbar. If empty,
  ///   no snackbar will be displayed.
  /// - [position]: Optional. The position of the snackbar on the screen.
  ///   Defaults to `SnackPosition.TOP`.
  ///
  /// Example:
  /// ```dart
  /// CommonSnackbar.success('Operation successful');
  /// ```
  static void success(String message, {SnackPosition? position, String title = 'Success'}) {
    if (message.isNotEmpty) {
      Get.snackbar(
        title,
        message,
        snackPosition: position ?? commonPosition,
        // backgroundColor: const Color.fromARGB(226, 95, 141, 64),
        barBlur: 10,
        borderRadius: 25,
        colorText: Colors.black,
        duration: Duration(seconds: duration),
      );
    }
  }
}
