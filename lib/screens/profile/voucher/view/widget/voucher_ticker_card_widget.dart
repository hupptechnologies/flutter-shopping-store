import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/data/voucher/voucher_dto.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/profile/voucher/controller/voucher_controller.dart';
import 'package:e_commerce/screens/profile/voucher/view/widget/voucher_ticket_clipper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';

class VoucherTickerCardWidget extends GetView<VoucherController> {
  final VoucherDto voucherDto;

  const VoucherTickerCardWidget({
    super.key,
    required this.voucherDto,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LeftTicketClipper(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(12),
          ),
          color: AppColors.lightGray.withOpacityValue(0.8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.black.withOpacityValue(double.parse(voucherDto.discountValue) / 100),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "${voucherDto.dValue}%",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    voucherDto.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(voucherDto.firstOrder ? '${voucherDto.dValue}% off your first order' : 'Sale off ${voucherDto.dValue}%'),
                  Text(
                    "Code: ${voucherDto.code}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Dash(
              direction: Axis.vertical,
              length: 70,
              dashColor: Colors.grey,
            ),
            const SizedBox(width: 12),
            Column(
              children: [
                const Text("Exp.", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                Text(
                  voucherDto.day,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(voucherDto.month, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
