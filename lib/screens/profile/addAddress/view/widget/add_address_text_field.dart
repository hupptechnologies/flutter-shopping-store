import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/reg_exp_constant.dart';
import 'package:flutter/material.dart';

class AddAddressTextField extends StatelessWidget {
  final String? value;
  final String label;
  final bool isRequired;
  final TextInputType? keyboardType;
  final bool isZipCode;
  final bool isNumber;
  final void Function(String)? onChanged;

  const AddAddressTextField({
    super.key,
    this.value,
    required this.label,
    this.isRequired = false,
    this.keyboardType,
    this.onChanged,
    this.isNumber = false,
    this.isZipCode = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(value),
      initialValue: value,
      keyboardType: keyboardType,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
              text: label,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              children: isRequired
                  ? [
                      const TextSpan(
                        text: " *",
                        style: TextStyle(color: AppColors.offRed),
                      ),
                    ]
                  : []),
        ),
      ),
      validator: (value) {
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return "$label is required";
        }
        if (isZipCode && !RegExpConstant.fiveToTenDigits.hasMatch(value ?? "")) {
          return "Enter a valid Zip-code (5-10 digits)";
        }

        if (isNumber &&
            !RegExpConstant.phoneNumber.hasMatch(value ?? "")) {
          return "Enter a valid phone number (10 digits, optional +country code)";
        }
        return null;
      },
    );
  }
}
