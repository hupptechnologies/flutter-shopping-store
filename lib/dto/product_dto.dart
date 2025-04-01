import 'package:e_commerce/dto/image_dto.dart';

List<ProductDto> productDtoFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => ProductDto.fromJson(json)).toList();
}

List<ProductDto> wishlistDtoFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) {
    final product = ProductDto.fromJson(json['product']);
    product.isFavorite = true;
    return product;
  }).toList();
}

class ProductDto {
  int id;
  String name;
  String? description;
  int price;
  String? type;
  List<ImageDto>? images;
  bool isFavorite;

  ProductDto({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.type,
    this.images,
    required this.isFavorite,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        type: json["type"],
        images:
            json['images'] != null ? imageDtoFromJson(json['images']) : null,
        isFavorite: json['isFavorite'] ?? false,
      );

  String? get getImages => images!.isNotEmpty ? images!.first.url : null;
}
