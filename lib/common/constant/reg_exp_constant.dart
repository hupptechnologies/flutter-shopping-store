abstract class RegExpConstant {
  static RegExp space = RegExp(r'\s+');
  static RegExp nonDigit = RegExp(r'\D');
  static RegExp fiveToTenDigits = RegExp(r"^\d{5,10}$");
  static RegExp phoneNumber = RegExp(r"^\+?[0-9]{1,3}?[0-9]{10}$");
  static RegExp onlyDigits = RegExp(r'[^0-9]');
  static RegExp maxFourChars = RegExp(r".{1,4}");
}
