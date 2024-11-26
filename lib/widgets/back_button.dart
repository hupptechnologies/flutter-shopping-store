import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:flutter/material.dart';

class BuildBackButton extends StatelessWidget {
  final VoidCallback? backPage;
  const BuildBackButton({
    super.key,
    this.backPage,
  });

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
        onPressed: () => backPage != null ? backPage!() : CommonGetX.backPage(),
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }
}
