import 'package:e_commerce/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowTextWithShowall extends StatelessWidget {
  const RowTextWithShowall(
      {super.key, required this.text, this.horizontal = 0});
  final String text;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          InkWell(
            child: const Text(
              'Show all',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            onTap: () => Get.toNamed(AppRoutes.productList, arguments: {'title': text}),
          ),
        ],
      ),
    );
  }
}
