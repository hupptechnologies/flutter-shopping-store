import 'package:e_commerce/dto/product_dto.dart';

class DashboardDto {
  List<ProductDto> featuredProducts;
  List<ProductDto> recommendedProducts;
  List<ProductDto> topCollections;

  DashboardDto({
    required this.featuredProducts,
    required this.recommendedProducts,
    required this.topCollections,
  });

  factory DashboardDto.fromJson(Map<String, dynamic> json) {
    return DashboardDto(
      featuredProducts: productDtoFromJson(json['featuredProducts']),
      recommendedProducts:productDtoFromJson(json['recommendedProducts']),
      topCollections:productDtoFromJson(json['topCollections'])
    );
  }
}