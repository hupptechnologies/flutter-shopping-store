import 'package:flutter/material.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/services.dart';

class AddPaymentField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const AddPaymentField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            validator: validator ??
                (value) => value == null || value.isEmpty
                    ? "$label is required"
                    : null,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.lightGray.withOpacityValue(0.5),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
