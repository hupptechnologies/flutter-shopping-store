import 'package:e_commerce/dto/category_dto.dart';
import 'package:e_commerce/dto/image_dto.dart';
import 'package:e_commerce/dto/variant_dto.dart';

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
  CategoryDto? category;
  List<VariantDto>? variants;
  bool isFavorite;

  ProductDto({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.type,
    this.images,
    this.category,
    this.variants,
    required this.isFavorite,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        type: json["type"],
        category: json['category'] != null
            ? CategoryDto.fromJson(json['category'])
            : null,
        images:
            json['images'] != null ? imageDtoFromJson(json['images']) : null,
        variants: json['variants'] != null
            ? variantDtofromJson(json['variants'])
            : null,
        isFavorite: json['isFavorite'] ?? false,
      );

  String? get getImages => images!.isNotEmpty ? images!.first.url : null;
}
