import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonGetX extends GetxController {
  /// Unfocuses the current active text field or focus node.
  ///
  /// This is useful for dismissing the keyboard when tapping outside of an input field.
  /// - Uses the current [BuildContext] from GetX to unfocus the active widget.
  ///
  /// Example:
  /// ```dart
  /// CommonGetX.unfocus();
  /// ```
  static void unfocus() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  /// Navigates back to the previous page in the navigation stack.
  ///
  /// Uses the GetX navigation system to pop the current route from the stack.
  /// - Ideal for custom back buttons or specific back-navigation needs in the app.
  ///
  /// Example:
  /// ```dart
  /// CommonGetX.backPage();
  /// ```
  static void backPage() {
    Get.back();
  }
}
