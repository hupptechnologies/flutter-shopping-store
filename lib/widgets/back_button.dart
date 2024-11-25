import 'package:flutter/material.dart';

class BuildBackButton extends StatelessWidget {
  const BuildBackButton({super.key, required this.backPage});
  final VoidCallback backPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () => backPage(),
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }
}
