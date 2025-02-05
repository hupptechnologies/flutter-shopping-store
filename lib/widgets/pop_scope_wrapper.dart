import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopScopeWrapper<T> extends StatelessWidget {
  final Widget child;

  const PopScopeWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
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
    );
  }
}
