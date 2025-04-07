import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productDtoToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  final int id;
  final String? name;
  final double? price;
  final double? discountPrice;
  final double? rating;
  final String image;
  final int? size;
  final int? color;
  int quantity;
  bool isFavorite;

  Product({
    required this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.rating,
    required this.image,
    this.isFavorite = false,
    this.size,
    this.color,
    this.quantity = 1,
  });

  factory Product.fromRawJson(String str) =>
      Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: (json["price"] as num).toDouble(),
        discountPrice: (json["discountPrice"] as num).toDouble(),
        rating: (json["rating"] as num).toDouble(),
        image: json["image"],
        size: json["size"],
        color: json["color"],
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
