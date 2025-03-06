import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopScopeWrapper<T> extends StatelessWidget {
  final Widget child;
  final Rx<bool>? isLoader;

  const PopScopeWrapper({
    super.key,
    required this.child,
    this.isLoader,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PopScope(
          canPop: true,
          onPopInvokedWithResult: (bool didPop, dynamic result) {
            if (didPop) {
              if (Get.isRegistered<T>()) {
                if (kDebugMode) {
                  print('Deleting $T.....');
                }
                Get.delete<T>();
              }
            }
          },
          child: child,
        ),

        // Loader Overlay (Only if isLoader is provided)
        if (isLoader != null)
          Obx(() {
            return isLoader!.value
                ? Container(
                    color: Colors.black.withOpacityValue(0.5),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: AppColors.lightGray,
                    ),
                  )
                : const SizedBox.shrink();
          }),
      ],
    );
  }
}
