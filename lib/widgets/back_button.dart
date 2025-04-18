import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:flutter/material.dart';

class BuildBackButton extends StatelessWidget {
  final VoidCallback? backPage;
  final dynamic result;
  const BuildBackButton({
    super.key,
    this.backPage, this.result,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => backPage != null ? backPage!() : CommonGetX.backPage(result: result),
      child: Container(
        width: 35,
        height: 35,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacityValue(0.2),
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }
}
