import 'package:e_commerce/dto/calculate_dto.dart';
import 'package:e_commerce/dto/cart_dto.dart';

class YourCartDto {
  List<CartDto> carts;
  CalculateDto calculate;

  YourCartDto({
    required this.carts,
    required this.calculate,
  });

  factory YourCartDto.fromJson(Map<String, dynamic> json) => YourCartDto(
        carts: cartDtofromJson(json["carts"]),
        calculate: CalculateDto.fromJson(json["calculate"]),
      );
}
