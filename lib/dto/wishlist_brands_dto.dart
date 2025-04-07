import 'package:e_commerce/dto/product_dto.dart';

List<WishlistBrandsDto> wishlistBrandsDtoFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => WishlistBrandsDto.fromJson(json)).toList();
}

class WishlistBrandsDto {
  int categoryId;
  String categoryName;
  List<ProductDto> products;
  int totalProducts;

  WishlistBrandsDto({
    required this.categoryId,
    required this.categoryName,
    this.products = const [],
    this.totalProducts = 0,
  });

  factory WishlistBrandsDto.fromJson(Map<String, dynamic> json) {
    final products = productDtoFromJson(json['products']);
    return WishlistBrandsDto(
      categoryId: json['category']['id'],
      categoryName: json['category']['name'],
      products: products,
      totalProducts: products.length,
    );
  }

  String? get firstImage {
    return products.isNotEmpty ? products[0].getImage : null;
  }

  String? get secondImage {
    return products.length > 1 ? products[1].getImage : null;
  }
  List<List<String?>> get thirdImage {
    final third = products.length > 2 ? products[2].getImage : null;
    final fourth = products.length > 3 ? products[3].getImage : null;
    final fifth = products.length > 4 ? products[4].getImage : null;
    final sixth = products.length > 5 ? products[5].getImage : null;
    return [[third, fourth], [fifth, sixth]];
  }
}