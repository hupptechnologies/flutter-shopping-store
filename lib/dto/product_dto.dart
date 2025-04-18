import 'package:e_commerce/dto/category_dto.dart';
import 'package:e_commerce/dto/image_dto.dart';
import 'package:e_commerce/dto/review_dto.dart';
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
  List<ProductDto>? similarProducts;
  List<ReviewDto>? reviews;
  bool isFavorite;
  int? totalRating;
  double? averageRating;
  Map<String, dynamic>? ratingPercentage;

  ProductDto({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.type,
    this.images,
    this.category,
    this.variants,
    this.similarProducts,
    this.reviews,
    this.totalRating,
    this.averageRating,
    this.ratingPercentage,
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
        similarProducts: json['similarProducts'] != null
            ? productDtoFromJson(json['similarProducts'])
            : null,
        reviews:
            json['reviews'] != null ? reviewDtoFromJson(json['reviews']) : null,
        averageRating: json['averageRating']?.toDouble(),
        totalRating: json['totalRating'],
        ratingPercentage: json['ratingPercentage'],
        isFavorite: json['isFavorite'] ?? false,
      );

  String? get getImage => images!.isNotEmpty ? images!.first.url : null;
}
