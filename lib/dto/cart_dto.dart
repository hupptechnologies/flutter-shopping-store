import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/dto/variant_dto.dart';

List<CartDto> cartDtofromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => CartDto.fromJson(json)).toList();
}

class CartDto {
  final int id;
  final int quantity;
  final double price;
  bool isSelected;
  final ProductDto product;
  final VariantDto variant;

  CartDto({
    required this.id,
    required this.quantity,
    required this.price,
    required this.isSelected,
    required this.product,
    required this.variant,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) {
    return CartDto(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      isSelected: json['isSelected'],
      product: ProductDto.fromJson(json['product']),
      variant: VariantDto.fromJson(json['variant']),
    );
  }
}

