import 'package:intl/intl.dart';

class VoucherDto {
  int id;
  String name;
  bool firstOrder;
  String code;
  String discountType;
  String discountValue;
  dynamic minOrderValue;
  dynamic maxDiscount;
  DateTime validFrom;
  DateTime validTo;
  int usageLimit;
  int usedCount;
  bool userSpecific;

  VoucherDto({
    required this.id,
    required this.name,
    required this.firstOrder,
    required this.code,
    required this.discountType,
    required this.discountValue,
    required this.minOrderValue,
    required this.maxDiscount,
    required this.validFrom,
    required this.validTo,
    required this.usageLimit,
    required this.usedCount,
    required this.userSpecific,
  });

  factory VoucherDto.fromJson(Map<String, dynamic> json) => VoucherDto(
        id: json["id"],
        name: json["name"],
        firstOrder: json["firstOrder"],
        code: json["code"],
        discountType: json["discountType"],
        discountValue: json["discountValue"],
        minOrderValue: json["minOrderValue"],
        maxDiscount: json["maxDiscount"],
        validFrom: DateTime.parse(json["validFrom"]),
        validTo: DateTime.parse(json["validTo"]),
        usageLimit: json["usageLimit"],
        usedCount: json["usedCount"],
        userSpecific: json["userSpecific"],
      );

  String get dValue => double.parse(discountValue).toInt().toString();
  String get day => validTo.day.toString();
  String get month => DateFormat('MMM').format(validTo);
}
