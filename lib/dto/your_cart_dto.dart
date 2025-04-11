import 'package:e_commerce/dto/calculate_dto.dart';
import 'package:e_commerce/dto/cart_dto.dart';

class YourCartDto {
  List<CartDto> carts;
  CalculateDto calculate;
  bool isCheckOut;

  YourCartDto({
    required this.carts,
    required this.calculate,
    required this.isCheckOut,
  });

  factory YourCartDto.fromJson(Map<String, dynamic> json) => YourCartDto(
        carts: cartDtofromJson(json["carts"]),
        calculate: CalculateDto.fromJson(json["calculate"]),
        isCheckOut: json["isCheckOut"],
      );
}
