import 'package:e_commerce/dto/product_dto.dart';

class DashbaordDto {
  List<ProductDto> featuredProducts;
  List<ProductDto> recommendedProducts;
  List<ProductDto> topCollections;

  DashbaordDto({
    required this.featuredProducts,
    required this.recommendedProducts,
    required this.topCollections,
  });

  factory DashbaordDto.fromJson(Map<String, dynamic> json) {
    return DashbaordDto(
      featuredProducts: productDtoFromJson(json['featuredProducts']),
      recommendedProducts:productDtoFromJson(json['recommendedProducts']),
      topCollections:productDtoFromJson(json['topCollections'])
    );
  }
}