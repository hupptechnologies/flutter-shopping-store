import 'package:flutter/material.dart';

class BuildOtpField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final Function handleInputChange;
  final FocusNode? nextFocus;
  final FocusNode? previousFocus;
  final bool autofocus;
  const BuildOtpField({
    super.key,
    required this.controller,
    required this.currentFocus,
    required this.handleInputChange,
    this.nextFocus,
    this.previousFocus,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(signed: true),
        controller: controller,
        focusNode: currentFocus,
        autofocus: autofocus,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
        onChanged: (value) {
          handleInputChange(
            controller,
            currentFocus,
          );
          if (value.isNotEmpty) {
            if (nextFocus != null) {
              nextFocus!.requestFocus(); // Move to the next field directly
            }
          } else if (previousFocus != null) {
            previousFocus!.requestFocus();
          }
        },
        onFieldSubmitted: (value) {
          if (value.isNotEmpty && nextFocus != null) {
            handleInputChange(controller, currentFocus);
            nextFocus!
                .requestFocus(); // Request focus for the next field upon submission
          }
        },
      ),
    );
  }
}
