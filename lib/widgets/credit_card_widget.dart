import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardWidget extends StatelessWidget {
  final String icon;
  final int cardNumber;
  final String holderName;
  final String validDate;

  const CreditCardWidget({
    super.key,
    required this.icon,
    required this.cardNumber,
    required this.holderName,
    required this.validDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkGray,
        boxShadow: [
          BoxShadow(
            color: AppColors.dartGratWithOpaity5,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: SvgPicture.asset(
                icon,
                height: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: cardNumberWidget(cardNumber.toString()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              detailWidget("CARDHOLDER NAME", holderName),
              detailWidget("VALID THRU", validDate),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> cardNumberWidget(String cardNumber) {
    final chunks = RegExp(r".{1,4}")
        .allMatches(cardNumber)
        .map((match) => match.group(0)!)
        .toList();
    return chunks.map((chunk) {
      return Text(
        chunk,
        style: const TextStyle(
          fontSize: 20,
          letterSpacing: 1.5,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Widget detailWidget(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
