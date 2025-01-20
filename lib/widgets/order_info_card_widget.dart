import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum OrderStatus { PENDING, DELIVERED, CANCELLED }

class OrderInfoCardWidget extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String trackingNumber;
  final int quantity;
  final double subtotal;
  final OrderStatus status;
  final Function(OrderStatus status) onTapDetails;

  const OrderInfoCardWidget({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.trackingNumber,
    required this.quantity,
    required this.subtotal,
    required this.status,
    required this.onTapDetails
  });

  TextStyle _labelStyle() => TextStyle(
        fontSize: 14,
        color: AppColors.dartGratWithOpaity5,
      );

  TextStyle _labelBoldORFontSize() =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  SizedBox sizedBox() => const SizedBox(height: 5);

  Widget _buildRow(
    String label,
    String value, {
    TextStyle? valueStyle,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: isBold ? _labelBoldORFontSize() : _labelStyle()),
        Text(
          value,
          style: valueStyle ?? const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildRichRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            style: _labelStyle(),
            children: [
              TextSpan(text: label),
              TextSpan(
                text: value,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _statusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.PENDING:
        return Colors.orange;
      case OrderStatus.DELIVERED:
        return Colors.green;
      case OrderStatus.CANCELLED:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.dartGratWithOpaity5,
            blurRadius: 0.2,
            spreadRadius: 0.15,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRow('Order #$orderNumber', date, isBold: true),
          sizedBox(),
          _buildRow('Tracking number:', trackingNumber),
          sizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRichRow('Quantity: ', '$quantity'),
              _buildRichRow('Subtotal: ', '\$$subtotal'),
            ],
          ),
          sizedBox(),
          sizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status.name,
                style: TextStyle(
                  fontSize: 14,
                  color: _statusColor(status),
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () => onTapDetails(status),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text('Details'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
