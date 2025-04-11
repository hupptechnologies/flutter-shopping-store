class CalculateDto {
  double productPrice;
  double shipping;
  double total;

  CalculateDto({
    required this.productPrice,
    required this.shipping,
    required this.total,
  });

  factory CalculateDto.fromJson(Map<String, num> json) => CalculateDto(
        productPrice: json["productPrice"]!.toDouble(),
        shipping: json["shipping"]!.toDouble(),
        total: json["total"]!.toDouble(),
      );
}
