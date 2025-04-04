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
        recommendedProducts: productDtoFromJson(json['recommendedProducts']),
        topCollections: productDtoFromJson(json['topCollections']));
  }

  ProductDto? get firstTopCollection =>
      topCollections.length == 2 ? null : topCollections[0];

  ProductDto? get secondTopCollection =>
      topCollections.length >= 4 ? topCollections[1] : null;

  List<ProductDto> get thirdListTopCollection => topCollections.length == 1
      ? []
      : topCollections.length == 2
          ? topCollections
          : topCollections.length == 3
              ? [topCollections[1], topCollections[2]]
              : [topCollections[2], topCollections[3]];
}
