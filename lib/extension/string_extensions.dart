extension StringExtensions on String {
  String toFirstUppercase() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
