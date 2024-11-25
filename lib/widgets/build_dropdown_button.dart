import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class BuildDropdownButton extends StatelessWidget {
  final Map<String, dynamic>? value;
  final String hint;
  final List<Map<String, dynamic>> item;
  final Function(Map<String, dynamic>?)? onChanged;
  const BuildDropdownButton({
    super.key,
    this.value,
    required this.hint,
    this.onChanged,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: AppColors.darkGray.withOpacity(0.5),
        ),
      ),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(20),
        value: value,
        hint: Text(hint),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        style: const TextStyle(color: Colors.black),
        dropdownColor: Colors.white,
        isExpanded: false,
        underline: Container(),
        onChanged: onChanged,
        items: item.map((el) {
          return DropdownMenuItem<Map<String, dynamic>>(
            value: el,
            child: Text(el['name']!),
          );
        }).toList(),
      ),
    );
  }
}
