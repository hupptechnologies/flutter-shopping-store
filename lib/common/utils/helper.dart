class Helper {
  static T enumFromString<T>(String value, List<T> enumValues) {
    return enumValues.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
      orElse: () => throw Exception("Invalid enum value: $value"),
    );
  }
}
