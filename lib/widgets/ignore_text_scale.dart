import 'package:flutter/material.dart';

class IgnoreTextScale extends StatelessWidget {
  final Widget child;

  const IgnoreTextScale({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.noScaling,
      ),
      child: child,
    );
  }
}
