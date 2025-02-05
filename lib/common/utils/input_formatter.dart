import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    newText = newText.replaceAll(RegExp(r'\D'), '');

    if (newText.length > 16) {
      newText = newText.substring(0, 16);
    }

    StringBuffer formattedText = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formattedText.write(' ');
      }
      formattedText.write(newText[i]);
    }

    return newValue.copyWith(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    newText = newText.replaceAll(RegExp(r'\D'), '');

    if (newText.length >= 2) {
      newText =
          '${newText.substring(0, 2)}/${newText.substring(2, newText.length)}';
    }

    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
