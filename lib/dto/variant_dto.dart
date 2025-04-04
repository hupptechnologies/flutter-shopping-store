import 'package:e_commerce/dto/image_dto.dart';

List<VariantDto> variantDtofromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => VariantDto.fromJson(json)).toList();
}

class VariantDto {
  int id;
  String color;
  String size;
  double? price;
  int quantity;
  List<ImageDto>? images;

  VariantDto({
    required this.id,
    required this.color,
    required this.size,
    this.price,
    required this.quantity,
    this.images,
  });

  factory VariantDto.fromJson(Map<String, dynamic> json) => VariantDto(
        id: json["id"],
        color: json["color"],
        size: json["size"],
        price: json["price"]!,
        quantity: json["quantity"],
        images:
            json['images'] != null ? imageDtoFromJson(json['images']) : null,
      );
}
