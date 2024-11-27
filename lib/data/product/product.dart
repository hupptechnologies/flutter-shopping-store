import 'dart:convert';

List<ProductDto> productDtoFromJson(String str) =>
    List<ProductDto>.from(json.decode(str).map((x) => ProductDto.fromJson(x)));

String productDtoToJson(List<ProductDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDto {
  final int id;
  final String? name;
  final double? price;
  final double? discountPrice;
  final double? rating;
  final String image;
  final int? size;
  final int? color;
  final int? quantity;
  bool isFavorite;

  ProductDto({
    required this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.rating,
    required this.image,
    this.isFavorite = false,
    this.size,
    this.color,
    this.quantity,
  });

  factory ProductDto.fromRawJson(String str) =>
      ProductDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        id: json["id"],
        name: json["name"],
        price: (json["price"] as num).toDouble(),
        discountPrice: (json["discountPrice"] as num).toDouble(),
        rating: (json["rating"] as num).toDouble(),
        image: json["image"],
        size: json["size"],
        color: json["color"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discountPrice": discountPrice,
        "rating": rating,
        "image": image,
        "isFavorite": isFavorite,
        "size": size,
        "color": color,
        "quantity": quantity,
      };
}
