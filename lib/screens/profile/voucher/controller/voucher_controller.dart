import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VoucherController extends GetxController {
  final List vouchers = [
    {
      "discount": 50.00,
      "title": "Black Friday",
      "subTitle": "Sale off 50%",
      "code": "fridaysale",
      "expDate": "20 Dec 2024"
    },
    {
      "discount": 30.00,
      "title": "Holiday Sale",
      "subTitle": "Sale off 30%",
      "code": "holiday30",
      "expDate": "22 Dec 2024"
    },
    {
      "discount": 20.00,
      "title": "First order",
      "subTitle": "20% off your first order",
      "code": "welcome",
      "expDate": "28 Dec 2024"
    },
  ];

  dynamic getDayOrMonth(String date) {
    DateTime expDate = DateFormat("dd MMM yyyy").parse(date);

    int day = expDate.day;
    String month = DateFormat("MMM").format(expDate);

    return {"day": "$day", "month": month};
  }
}
